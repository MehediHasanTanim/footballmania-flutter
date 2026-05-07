import 'package:fifa_world_cup_2026_app/core/domain/enums/match_status.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/domain/entities/fixture.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/domain/usecases/sort_fixtures_by_date.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const useCase = SortFixturesByDate();

  test('sorts fixtures by kickoff date ascending', () {
    final result = useCase([
      _fixture(2, DateTime.utc(2026, 6, 12)),
      _fixture(1, DateTime.utc(2026, 6, 11)),
      _fixture(3, DateTime.utc(2026, 6, 13)),
    ]);

    expect(result.map((fixture) => fixture.id), [1, 2, 3]);
  });

  test('can prioritize live fixtures', () {
    final result = useCase([
      _fixture(1, DateTime.utc(2026, 6, 11), status: MatchStatus.upcoming),
      _fixture(2, DateTime.utc(2026, 6, 12), status: MatchStatus.live),
    ], prioritizeLive: true);

    expect(result.first.id, 2);
  });
}

Fixture _fixture(
  int id,
  DateTime date, {
  MatchStatus status = MatchStatus.upcoming,
}) {
  return Fixture(
    id: id,
    homeTeamId: 1,
    homeTeamName: 'USA',
    awayTeamId: 2,
    awayTeamName: 'Canada',
    matchDateUtc: date,
    venue: 'Venue',
    stage: 'Group Stage',
    status: status,
  );
}
