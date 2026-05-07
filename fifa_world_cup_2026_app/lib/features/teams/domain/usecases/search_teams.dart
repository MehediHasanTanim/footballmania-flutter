import '../../../favorites/domain/entities/favorite_item.dart';
import '../entities/team.dart';
import '../entities/team_filter.dart';

class SearchTeams {
  const SearchTeams();

  List<Team> call(
    List<Team> teams,
    TeamFilter filter, {
    List<FavoriteItem> favoriteTeams = const [],
  }) {
    final query = filter.searchQuery?.trim().toLowerCase();
    final group = filter.group?.trim().toLowerCase();
    final favoriteIds = favoriteTeams.map((item) => item.referenceId).toSet();

    final filtered = teams
        .where((team) {
          if (filter.favoriteOnly &&
              !favoriteIds.contains(team.id.toString())) {
            return false;
          }
          if (group != null && group.isNotEmpty) {
            if (team.group?.toLowerCase() != group) return false;
          }
          if (query == null || query.isEmpty) return true;
          return team.name.toLowerCase().contains(query) ||
              team.countryCode.toLowerCase().contains(query) ||
              (team.group?.toLowerCase().contains(query) ?? false);
        })
        .toList(growable: false);

    filtered.sort((a, b) {
      final aFavorite = favoriteIds.contains(a.id.toString());
      final bFavorite = favoriteIds.contains(b.id.toString());
      if (aFavorite == bFavorite) return a.name.compareTo(b.name);
      return aFavorite ? -1 : 1;
    });
    return filtered;
  }
}
