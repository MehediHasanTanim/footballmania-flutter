import 'package:fifa_world_cup_2026_app/features/groups/domain/entities/group_standing.dart';
import 'package:fifa_world_cup_2026_app/features/groups/domain/usecases/sort_group_standings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('sorts by points, goal difference, goals scored, then team name', () {
    const useCase = SortGroupStandings();
    final result = useCase([
      _standing('Canada', points: 4, goalsFor: 4, goalsAgainst: 2),
      _standing('USA', points: 6, goalsFor: 3, goalsAgainst: 1),
      _standing('Mexico', points: 4, goalsFor: 5, goalsAgainst: 3),
      _standing('Brazil', points: 4, goalsFor: 5, goalsAgainst: 3),
    ]);

    expect(result.map((standing) => standing.teamName), ['USA', 'Brazil', 'Mexico', 'Canada']);
  });
}

GroupStanding _standing(String name, {required int points, required int goalsFor, required int goalsAgainst}) {
  return GroupStanding(
    group: 'A',
    teamId: name.hashCode,
    teamName: name,
    played: 3,
    won: 1,
    drawn: 1,
    lost: 1,
    goalsFor: goalsFor,
    goalsAgainst: goalsAgainst,
    points: points,
    rank: 0,
  );
}
