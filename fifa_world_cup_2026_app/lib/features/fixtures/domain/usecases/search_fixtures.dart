import '../entities/fixture.dart';

class SearchFixtures {
  const SearchFixtures();

  List<Fixture> call(List<Fixture> fixtures, String? query) {
    final normalized = query?.trim().toLowerCase();
    if (normalized == null || normalized.isEmpty) {
      return List.unmodifiable(fixtures);
    }

    return fixtures
        .where((fixture) {
          final date = fixture.matchDateUtc
              ?.toLocal()
              .toString()
              .split(' ')
              .first;
          return fixture.homeTeamName.toLowerCase().contains(normalized) ||
              fixture.awayTeamName.toLowerCase().contains(normalized) ||
              fixture.venue.toLowerCase().contains(normalized) ||
              fixture.stage.toLowerCase().contains(normalized) ||
              (fixture.group?.toLowerCase().contains(normalized) ?? false) ||
              fixture.status.name.toLowerCase().contains(normalized) ||
              (date?.contains(normalized) ?? false);
        })
        .toList(growable: false);
  }
}
