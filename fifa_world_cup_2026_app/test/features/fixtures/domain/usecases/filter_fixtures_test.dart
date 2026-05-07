import 'package:fifa_world_cup_2026_app/core/domain/enums/match_status.dart';
import 'package:fifa_world_cup_2026_app/core/domain/value_objects/fixture_filter.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/domain/entities/fixture.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/domain/usecases/filter_fixtures.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const useCase = FilterFixtures();
  final fixtures = [
    _fixture(id: 1, homeTeamId: 10, group: 'A', status: MatchStatus.upcoming, date: DateTime.utc(2026, 6, 11)),
    _fixture(id: 2, homeTeamId: 20, group: 'B', status: MatchStatus.live, date: DateTime.utc(2026, 6, 12)),
    _fixture(id: 3, homeTeamId: 30, group: 'A', status: MatchStatus.completed, date: DateTime.utc(2026, 6, 13)),
  ];

  test('filters fixtures by date', () {
    final result = useCase(fixtures, FixtureFilter(date: DateTime.utc(2026, 6, 12)));

    expect(result.map((fixture) => fixture.id), [2]);
  });

  test('filters fixtures by team', () {
    final result = useCase(fixtures, const FixtureFilter(teamId: 10));

    expect(result.map((fixture) => fixture.id), [1]);
  });

  test('filters fixtures by group', () {
    final result = useCase(fixtures, const FixtureFilter(group: 'A'));

    expect(result.map((fixture) => fixture.id), [1, 3]);
  });

  test('filters fixtures by status', () {
    final result = useCase(fixtures, const FixtureFilter(status: MatchStatus.live));

    expect(result.map((fixture) => fixture.id), [2]);
  });

  test('supports combined filters', () {
    final result = useCase(fixtures, const FixtureFilter(group: 'A', status: MatchStatus.completed));

    expect(result.map((fixture) => fixture.id), [3]);
  });
}

Fixture _fixture({required int id, required int homeTeamId, required String group, required MatchStatus status, required DateTime date}) {
  return Fixture(
    id: id,
    homeTeamId: homeTeamId,
    homeTeamName: 'Team $homeTeamId',
    awayTeamId: homeTeamId + 1,
    awayTeamName: 'Opponent',
    matchDateUtc: date,
    venue: 'Venue',
    stage: 'Group Stage',
    group: group,
    status: status,
  );
}
