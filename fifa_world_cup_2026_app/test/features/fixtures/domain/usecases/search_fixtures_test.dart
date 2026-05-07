import 'package:fifa_world_cup_2026_app/core/domain/enums/match_status.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/domain/entities/fixture.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/domain/usecases/search_fixtures.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const useCase = SearchFixtures();
  final fixtures = [
    _fixture(id: 1, home: 'USA', away: 'Canada', venue: 'MetLife Stadium'),
    _fixture(id: 2, home: 'Brazil', away: 'Japan', venue: 'SoFi Stadium'),
  ];

  test('searches fixtures by team', () {
    final result = useCase(fixtures, 'brazil');

    expect(result.map((fixture) => fixture.id), [2]);
  });

  test('searches fixtures by venue', () {
    final result = useCase(fixtures, 'metlife');

    expect(result.map((fixture) => fixture.id), [1]);
  });

  test('searches fixtures by stage', () {
    final result = useCase(fixtures, 'group');

    expect(result.map((fixture) => fixture.id), [1, 2]);
  });
}

Fixture _fixture({
  required int id,
  required String home,
  required String away,
  required String venue,
}) {
  return Fixture(
    id: id,
    homeTeamId: id,
    homeTeamName: home,
    awayTeamId: id + 10,
    awayTeamName: away,
    matchDateUtc: DateTime.utc(2026, 6, 11 + id),
    venue: venue,
    stage: 'Group Stage',
    group: 'A',
    status: MatchStatus.upcoming,
  );
}
