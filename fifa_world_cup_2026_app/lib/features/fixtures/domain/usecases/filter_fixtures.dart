import '../../../../core/domain/enums/match_status.dart';
import '../entities/fixture.dart';
import '../entities/fixture_filter.dart';

class FilterFixtures {
  const FilterFixtures();

  List<Fixture> call(List<Fixture> fixtures, FixtureFilter filter) {
    if (!filter.hasFilters) return List.unmodifiable(fixtures);

    return fixtures
        .where((fixture) {
          return _matchesDate(fixture, filter) &&
              _matchesTeam(fixture, filter.selectedTeamId) &&
              _matchesText(fixture.group, filter.selectedGroup) &&
              _matchesText(fixture.stage, filter.selectedStage) &&
              _matchesStatus(fixture.status, filter.selectedStatus);
        })
        .toList(growable: false);
  }

  bool _matchesDate(Fixture fixture, FixtureFilter filter) {
    final kickoff = fixture.matchDateUtc;
    if (kickoff == null) return filter.selectedDate == null;
    final date = filter.selectedDate;
    if (date != null) {
      final utc = kickoff.toUtc();
      final target = date.toUtc();
      if (utc.year != target.year ||
          utc.month != target.month ||
          utc.day != target.day) {
        return false;
      }
    }
    return true;
  }

  bool _matchesTeam(Fixture fixture, int? teamId) =>
      teamId == null || fixture.involvesTeam(teamId);

  bool _matchesText(String? value, String? expected) {
    if (expected == null || expected.trim().isEmpty) return true;
    return value?.toLowerCase() == expected.toLowerCase();
  }

  bool _matchesStatus(MatchStatus status, MatchStatus? expected) =>
      expected == null || status == expected;
}
