import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/domain/enums/match_status.dart';
import '../../../../core/network/connectivity_provider.dart';
import '../../../../core/utils/result.dart';
import '../../../../shared/providers/usecase_providers.dart';
import '../../domain/entities/fixture.dart';
import '../../domain/entities/fixture_filter.dart';

final fixtureFilterProvider =
    StateNotifierProvider<FixtureFilterNotifier, FixtureFilter>((ref) {
      return FixtureFilterNotifier(ref)..loadSaved();
    });

final fixturesProvider =
    AutoDisposeAsyncNotifierProvider<FixturesNotifier, List<Fixture>>(
      FixturesNotifier.new,
    );

final fixtureDetailsProvider =
    AutoDisposeAsyncNotifierProviderFamily<
      FixtureDetailsNotifier,
      Fixture,
      int
    >(FixtureDetailsNotifier.new);

final fixturesUsingCacheProvider = Provider.autoDispose<bool>((ref) {
  final hasFixtures =
      ref.watch(fixturesProvider).valueOrNull?.isNotEmpty == true;
  final isOnline = ref.watch(connectivityStatusProvider).valueOrNull ?? true;
  return hasFixtures && !isOnline;
});

final fixtureDetailsUsingCacheProvider = Provider.autoDispose.family<bool, int>(
  (ref, fixtureId) {
    final hasFixture = ref.watch(fixtureDetailsProvider(fixtureId)).hasValue;
    final isOnline = ref.watch(connectivityStatusProvider).valueOrNull ?? true;
    return hasFixture && !isOnline;
  },
);

final filteredFixturesProvider = Provider<AsyncValue<List<Fixture>>>((ref) {
  final fixtures = ref.watch(fixturesProvider);
  final filter = ref.watch(fixtureFilterProvider);
  final filterFixtures = ref.watch(filterFixturesUseCaseProvider);
  final searchFixtures = ref.watch(searchFixturesUseCaseProvider);
  return fixtures.whenData((items) {
    return searchFixtures(filterFixtures(items, filter), filter.searchQuery);
  });
});

final upcomingFixturesProvider = Provider<AsyncValue<List<Fixture>>>((ref) {
  return ref.watch(filteredFixturesProvider).whenData((items) {
    return items.where((fixture) => fixture.isUpcoming).toList(growable: false);
  });
});

final liveFixturesProvider = Provider<AsyncValue<List<Fixture>>>((ref) {
  return ref.watch(filteredFixturesProvider).whenData((items) {
    return items.where((fixture) => fixture.isLive).toList(growable: false);
  });
});

final completedFixturesProvider = Provider<AsyncValue<List<Fixture>>>((ref) {
  return ref.watch(filteredFixturesProvider).whenData((items) {
    return items
        .where((fixture) => fixture.isCompleted)
        .toList(growable: false);
  });
});

final nextMatchProvider = Provider<Fixture?>((ref) {
  final fixtures = ref.watch(
    upcomingFixturesProvider.select(
      (value) => value.valueOrNull ?? const <Fixture>[],
    ),
  );
  final dated =
      fixtures
          .where((fixture) => fixture.matchDateUtc != null)
          .toList(growable: false)
        ..sort((a, b) => a.matchDateUtc!.compareTo(b.matchDateUtc!));
  return dated.firstOrNull;
});

class FixturesNotifier extends AutoDisposeAsyncNotifier<List<Fixture>> {
  @override
  Future<List<Fixture>> build() => _load();

  Future<void> refresh() => _setState(forceRefresh: false);

  Future<void> forceRefresh() => _setState(forceRefresh: true);

  Future<void> reload() => refresh();

  Future<void> _setState({required bool forceRefresh}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _load(forceRefresh: forceRefresh));
  }

  Future<List<Fixture>> _load({bool forceRefresh = false}) async {
    final filter = ref.read(fixtureFilterProvider);
    final result = await ref.read(getFixturesUseCaseProvider)(
      date: _dateParam(filter.selectedDate),
      teamId: filter.selectedTeamId,
      group: filter.selectedGroup,
      stage: filter.selectedStage,
      forceRefresh: forceRefresh,
    );
    return switch (result) {
      Success<List<Fixture>>(:final data) => data,
      FailureResult<List<Fixture>>(:final failure) => throw failure,
    };
  }

  String? _dateParam(DateTime? date) {
    if (date == null) return null;
    final utc = date.toUtc();
    return '${utc.year.toString().padLeft(4, '0')}-${utc.month.toString().padLeft(2, '0')}-${utc.day.toString().padLeft(2, '0')}';
  }
}

class FixtureDetailsNotifier
    extends AutoDisposeFamilyAsyncNotifier<Fixture, int> {
  @override
  Future<Fixture> build(int arg) => _load(arg);

  Future<void> refresh() => _setState(forceRefresh: false);

  Future<void> forceRefresh() => _setState(forceRefresh: true);

  Future<void> reload() => refresh();

  Future<void> _setState({required bool forceRefresh}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _load(arg, forceRefresh: forceRefresh),
    );
  }

  Future<Fixture> _load(int fixtureId, {bool forceRefresh = false}) async {
    final result = await ref.read(getFixtureByIdUseCaseProvider)(
      fixtureId,
      forceRefresh: forceRefresh,
    );
    return switch (result) {
      Success<Fixture>(:final data) => data,
      FailureResult<Fixture>(:final failure) => throw failure,
    };
  }
}

class FixtureFilterNotifier extends StateNotifier<FixtureFilter> {
  FixtureFilterNotifier(this._ref) : super(const FixtureFilter());

  final Ref _ref;
  static const _filterKey = 'fixtures';

  void loadSaved() {
    final saved = _tryGetSaved();
    if (saved == null) return;
    state = FixtureFilter(
      selectedDate: saved['selectedDate'] is DateTime
          ? saved['selectedDate'] as DateTime
          : null,
      selectedTeamId: saved['selectedTeamId'] as int?,
      selectedGroup: saved['selectedGroup'] as String?,
      selectedStage: saved['selectedStage'] as String?,
      selectedStatus: saved['selectedStatus'] is String
          ? MatchStatus.fromString(saved['selectedStatus'] as String)
          : null,
      searchQuery: saved['searchQuery'] as String?,
    );
  }

  void setDate(DateTime? date) => update(date: date);

  void setTeamId(int? teamId) => update(teamId: teamId);

  void setGroup(String? group) => update(group: group);

  void setStage(String? stage) => update(stage: stage);

  void setStatus(MatchStatus? status) => update(status: status);

  void update({
    DateTime? date,
    int? teamId,
    String? group,
    String? stage,
    MatchStatus? status,
    String? searchQuery,
  }) {
    state = state.copyWith(
      selectedDate: date,
      selectedTeamId: teamId,
      selectedGroup: group,
      selectedStage: stage,
      selectedStatus: status,
      searchQuery: searchQuery,
    );
    _save();
  }

  void replaceFilters(FixtureFilter filter) {
    state = FixtureFilter(
      selectedDate: filter.selectedDate,
      selectedTeamId: filter.selectedTeamId,
      selectedGroup: filter.selectedGroup,
      selectedStage: filter.selectedStage,
      selectedStatus: filter.selectedStatus,
      searchQuery: state.searchQuery,
    );
    _save();
  }

  void setSearchQuery(String query) => update(searchQuery: query);

  void clearFilters() {
    state = const FixtureFilter();
    _tryClearSaved();
  }

  void _save() {
    try {
      unawaited(
        _ref
            .read(saveFilterUseCaseProvider)(_filterKey, {
              'selectedDate': state.selectedDate,
              'selectedTeamId': state.selectedTeamId,
              'selectedGroup': state.selectedGroup,
              'selectedStage': state.selectedStage,
              'selectedStatus': state.selectedStatus?.name,
              'searchQuery': state.searchQuery,
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
