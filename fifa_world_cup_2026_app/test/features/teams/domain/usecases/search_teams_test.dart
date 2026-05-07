import 'package:fifa_world_cup_2026_app/core/domain/enums/favorite_type.dart';
import 'package:fifa_world_cup_2026_app/features/favorites/domain/entities/favorite_item.dart';
import 'package:fifa_world_cup_2026_app/features/teams/domain/entities/team.dart';
import 'package:fifa_world_cup_2026_app/features/teams/domain/entities/team_filter.dart';
import 'package:fifa_world_cup_2026_app/features/teams/domain/usecases/search_teams.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const useCase = SearchTeams();
  const teams = [
    Team(id: 1, name: 'USA', countryCode: 'USA', group: 'A'),
    Team(id: 2, name: 'Brazil', countryCode: 'BRA', group: 'B'),
    Team(id: 3, name: 'Japan', countryCode: 'JPN', group: 'B'),
  ];

  test('searches teams by name', () {
    final result = useCase(teams, const TeamFilter(searchQuery: 'brazil'));

    expect(result.map((team) => team.id), [2]);
  });

  test('filters teams by group', () {
    final result = useCase(teams, const TeamFilter(group: 'B'));

    expect(result.map((team) => team.id), [2, 3]);
  });

  test('shows favorite teams first when enabled', () {
    final result = useCase(
      teams,
      const TeamFilter(favoriteOnly: true),
      favoriteTeams: [
        FavoriteItem(
          id: 'fav-2',
          type: FavoriteType.team,
          referenceId: '2',
          title: 'Brazil',
          createdAt: DateTime.utc(2026),
        ),
      ],
    );

    expect(result.map((team) => team.id), [2]);
  });
}
