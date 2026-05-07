import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/result.dart';
import '../../../../shared/providers/usecase_providers.dart';
import '../../domain/entities/team.dart';

final teamsProvider =
    AutoDisposeAsyncNotifierProvider<TeamsNotifier, List<Team>>(
      TeamsNotifier.new,
    );

final selectedTeamProvider = StateNotifierProvider<SelectedTeamNotifier, int?>(
  (ref) => SelectedTeamNotifier(),
);

final teamDetailsProvider = AutoDisposeAsyncNotifierProviderFamily<
    TeamDetailsNotifier, Team, int>(TeamDetailsNotifier.new);

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
