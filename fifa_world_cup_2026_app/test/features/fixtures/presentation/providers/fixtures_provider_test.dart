import 'package:fifa_world_cup_2026_app/core/domain/enums/match_status.dart';
import 'package:fifa_world_cup_2026_app/core/errors/failure.dart';
import 'package:fifa_world_cup_2026_app/core/utils/result.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/domain/entities/fixture.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/domain/repositories/fixtures_repository.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/presentation/providers/fixtures_provider.dart';
import 'package:fifa_world_cup_2026_app/shared/providers/repository_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('fixtures provider loads successfully', () async {
    final container = ProviderContainer(
      overrides: [
        fixturesRepositoryProvider.overrideWithValue(_FixturesRepository()),
      ],
    );
    addTearDown(container.dispose);

    final result = await container.read(fixturesProvider.future);

    expect(result, hasLength(3));
  });

  test('fixtures provider returns error state', () async {
    final container = ProviderContainer(
      overrides: [
        fixturesRepositoryProvider.overrideWithValue(
          _FixturesRepository(shouldFail: true),
        ),
      ],
    );
    addTearDown(container.dispose);

    await expectLater(
      container.read(fixturesProvider.future),
      throwsA(isA<Failure>()),
    );
  });

  test('fixtures provider supports refresh', () async {
    final repository = _FixturesRepository();
    final container = ProviderContainer(
      overrides: [fixturesRepositoryProvider.overrideWithValue(repository)],
    );
    addTearDown(container.dispose);

    await container.read(fixturesProvider.future);
    await container.read(fixturesProvider.notifier).refresh();

    expect(repository.calls, 2);
  });

  test('filter provider updates selected date team and status', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final date = DateTime.utc(2026, 6, 11);
    final notifier = container.read(fixtureFilterProvider.notifier);
    notifier.setDate(date);
    notifier.setTeamId(10);
    notifier.setStatus(MatchStatus.live);

    final state = container.read(fixtureFilterProvider);
    expect(state.selectedDate, date);
    expect(state.selectedTeamId, 10);
    expect(state.selectedStatus, MatchStatus.live);
  });

  test('filter reset clears selected filters and query', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final notifier = container.read(fixtureFilterProvider.notifier);
    notifier.setTeamId(10);
    notifier.setSearchQuery('usa');
    notifier.clearFilters();

    expect(container.read(fixtureFilterProvider).isEmpty, isTrue);
  });

  test('derived providers return correct filtered data', () async {
    final container = ProviderContainer(
      overrides: [
        fixturesRepositoryProvider.overrideWithValue(_FixturesRepository()),
      ],
    );
    addTearDown(container.dispose);

    await container.read(fixturesProvider.future);

    expect(
      container
          .read(upcomingFixturesProvider)
          .valueOrNull
          ?.map((fixture) => fixture.id),
      [1],
    );
    expect(
      container
          .read(liveFixturesProvider)
          .valueOrNull
          ?.map((fixture) => fixture.id),
      [2],
    );
    expect(
      container
          .read(completedFixturesProvider)
          .valueOrNull
          ?.map((fixture) => fixture.id),
      [3],
    );
  });
}

class _FixturesRepository implements FixturesRepository {
  _FixturesRepository({this.shouldFail = false});

  final bool shouldFail;
  int calls = 0;

  @override
  Future<Result<List<Fixture>>> getFixtures({
    String? date,
    int? teamId,
    String? group,
    String? stage,
    bool forceRefresh = false,
  }) async {
    calls++;
    if (shouldFail) {
      return const FailureResult(Failure(message: 'Network error'));
    }
    return Success([
      _fixture(1, MatchStatus.upcoming),
      _fixture(2, MatchStatus.live),
      _fixture(3, MatchStatus.completed),
    ]);
  }

  @override
  Future<Result<Fixture>> getFixtureById(
    int fixtureId, {
    bool forceRefresh = false,
  }) async {
    return Success(_fixture(fixtureId, MatchStatus.upcoming));
  }
}

Fixture _fixture(int id, MatchStatus status) {
  return Fixture(
    id: id,
    homeTeamId: id,
    homeTeamName: 'Team $id',
    awayTeamId: id + 10,
    awayTeamName: 'Opponent $id',
    matchDateUtc: DateTime.utc(2026, 6, 10 + id),
    venue: 'Venue',
    stage: 'Group Stage',
    group: 'A',
    status: status,
  );
}
