import '../../../../core/domain/enums/match_status.dart';
import '../../../../core/domain/value_objects/fixture_filter.dart';
import '../entities/fixture.dart';

class FilterFixtures {
  const FilterFixtures();

  List<Fixture> call(List<Fixture> fixtures, FixtureFilter filter) {
    if (filter.isEmpty) return List.unmodifiable(fixtures);

    return fixtures.where((fixture) {
      return _matchesDate(fixture, filter) &&
          _matchesTeam(fixture, filter.teamId) &&
          _matchesText(fixture.group, filter.group) &&
          _matchesText(fixture.stage, filter.stage) &&
          _matchesStatus(fixture.status, filter.status);
    }).toList(growable: false);
  }

  bool _matchesDate(Fixture fixture, FixtureFilter filter) {
    final kickoff = fixture.matchDateUtc;
    if (kickoff == null) return filter.date == null && filter.dateRange == null;
    final date = filter.date;
    if (date != null) {
      final utc = kickoff.toUtc();
      final target = date.toUtc();
      if (utc.year != target.year || utc.month != target.month || utc.day != target.day) return false;
    }
    return filter.dateRange?.contains(kickoff) ?? true;
  }

  bool _matchesTeam(Fixture fixture, int? teamId) => teamId == null || fixture.involvesTeam(teamId);

  bool _matchesText(String? value, String? expected) {
    if (expected == null || expected.trim().isEmpty) return true;
    return value?.toLowerCase() == expected.toLowerCase();
  }

  bool _matchesStatus(MatchStatus status, MatchStatus? expected) => expected == null || status == expected;
}
