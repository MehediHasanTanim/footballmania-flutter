import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/domain/enums/match_status.dart';
import '../../../../core/domain/value_objects/fixture_filter.dart';
import '../../../../core/utils/result.dart';
import '../../../../shared/providers/usecase_providers.dart';
import '../../domain/entities/fixture.dart';

final fixtureFilterProvider =
    StateNotifierProvider<FixtureFilterNotifier, FixtureFilter>((ref) {
      return FixtureFilterNotifier();
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

final filteredFixturesProvider = Provider<AsyncValue<List<Fixture>>>((ref) {
  final fixtures = ref.watch(fixturesProvider);
  final filter = ref.watch(fixtureFilterProvider);
  final filterFixtures = ref.watch(filterFixturesUseCaseProvider);
  return fixtures.whenData((items) => filterFixtures(items, filter));
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
      date: _dateParam(filter.date),
      teamId: filter.teamId,
      group: filter.group,
      stage: filter.stage,
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
  FixtureFilterNotifier() : super(const FixtureFilter());

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
  }) {
    state = FixtureFilter(
      date: date ?? state.date,
      dateRange: state.dateRange,
      teamId: teamId ?? state.teamId,
      group: group ?? state.group,
      stage: stage ?? state.stage,
      status: status ?? state.status,
    );
  }

  void clearFilters() => state = const FixtureFilter();
}
