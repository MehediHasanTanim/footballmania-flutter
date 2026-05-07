import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/result.dart';
import '../../../favorites/presentation/providers/favorites_provider.dart';
import '../../../../shared/providers/usecase_providers.dart';
import '../../domain/entities/team.dart';
import '../../domain/entities/team_filter.dart';

final teamsProvider =
    AutoDisposeAsyncNotifierProvider<TeamsNotifier, List<Team>>(
      TeamsNotifier.new,
    );

final selectedTeamProvider = StateNotifierProvider<SelectedTeamNotifier, int?>(
  (ref) => SelectedTeamNotifier(),
);

final teamSearchProvider =
    StateNotifierProvider<TeamSearchNotifier, TeamFilter>(
      (ref) => TeamSearchNotifier(ref)..loadSaved(),
    );

final searchedTeamsProvider = Provider<AsyncValue<List<Team>>>((ref) {
  final teams = ref.watch(teamsProvider);
  final filter = ref.watch(teamSearchProvider);
  final favorites = ref.watch(favoriteTeamsProvider);
  final searchTeams = ref.watch(searchTeamsUseCaseProvider);
  return teams.whenData(
    (items) => searchTeams(items, filter, favoriteTeams: favorites),
  );
});

final teamDetailsProvider =
    AutoDisposeAsyncNotifierProviderFamily<TeamDetailsNotifier, Team, int>(
      TeamDetailsNotifier.new,
    );

class TeamsNotifier extends AutoDisposeAsyncNotifier<List<Team>> {
  @override
  Future<List<Team>> build() => _load();

  Future<void> refresh() => _setState(forceRefresh: false);

  Future<void> forceRefresh() => _setState(forceRefresh: true);

  Future<void> reload() => refresh();

  Future<void> _setState({required bool forceRefresh}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _load(forceRefresh: forceRefresh));
  }

  Future<List<Team>> _load({bool forceRefresh = false}) async {
    final result = await ref.read(getTeamsUseCaseProvider)(
      forceRefresh: forceRefresh,
    );
    return switch (result) {
      Success<List<Team>>(:final data) => data,
      FailureResult<List<Team>>(:final failure) => throw failure,
    };
  }
}

class SelectedTeamNotifier extends StateNotifier<int?> {
  SelectedTeamNotifier() : super(null);

  void select(int? teamId) => state = teamId;

  void clear() => state = null;
}

class TeamSearchNotifier extends StateNotifier<TeamFilter> {
  TeamSearchNotifier(this._ref) : super(const TeamFilter());

  final Ref _ref;
  static const _filterKey = 'teams';

  void loadSaved() {
    final saved = _tryGetSaved();
    if (saved == null) return;
    state = TeamFilter(
      searchQuery: saved['searchQuery'] as String?,
      group: saved['group'] as String?,
      favoriteOnly: saved['favoriteOnly'] as bool? ?? false,
    );
  }

  void setQuery(String query) {
    state = state.copyWith(searchQuery: query);
    _save();
  }

  void setGroup(String? group) {
    state = group == null
        ? state.copyWith(clearGroup: true)
        : state.copyWith(group: group);
    _save();
  }

  void setFavoriteOnly(bool value) {
    state = state.copyWith(favoriteOnly: value);
    _save();
  }

  void clear() {
    state = const TeamFilter();
    _tryClearSaved();
  }

  void _save() {
    try {
      unawaited(
        _ref
            .read(saveFilterUseCaseProvider)(_filterKey, {
              'searchQuery': state.searchQuery,
              'group': state.group,
              'favoriteOnly': state.favoriteOnly,
            })
            .catchError((_) {}),
      );
    } catch (_) {}
  }

  Map<String, dynamic>? _tryGetSaved() {
    try {
      return _ref.read(getSavedFilterUseCaseProvider)(_filterKey);
    } catch (_) {
      return null;
    }
  }

  void _tryClearSaved() {
    try {
      unawaited(
        _ref
            .read(clearSavedFilterUseCaseProvider)(_filterKey)
            .catchError((_) {}),
      );
    } catch (_) {}
  }
}

class TeamDetailsNotifier extends AutoDisposeFamilyAsyncNotifier<Team, int> {
  @override
  Future<Team> build(int arg) => _load(arg);

  Future<void> refresh() => _setState(forceRefresh: false);

  Future<void> forceRefresh() => _setState(forceRefresh: true);

  Future<void> _setState({required bool forceRefresh}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _load(arg, forceRefresh: forceRefresh),
    );
  }

  Future<Team> _load(int teamId, {bool forceRefresh = false}) async {
    final result = await ref.read(getTeamByIdUseCaseProvider)(
      teamId,
      forceRefresh: forceRefresh,
    );
    return switch (result) {
      Success<Team>(:final data) => data,
      FailureResult<Team>(:final failure) => throw failure,
    };
  }
}
