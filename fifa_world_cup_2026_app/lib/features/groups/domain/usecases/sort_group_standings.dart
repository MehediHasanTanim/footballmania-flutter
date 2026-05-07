import '../entities/group_standing.dart';

class SortGroupStandings {
  const SortGroupStandings();

  List<GroupStanding> call(List<GroupStanding> standings) {
    final sorted = List<GroupStanding>.of(standings);
    sorted.sort((a, b) {
      final pointsCompare = b.points.compareTo(a.points);
      if (pointsCompare != 0) return pointsCompare;
      final goalDifferenceCompare = b.goalDifference.compareTo(a.goalDifference);
      if (goalDifferenceCompare != 0) return goalDifferenceCompare;
      final goalsForCompare = b.goalsFor.compareTo(a.goalsFor);
      if (goalsForCompare != 0) return goalsForCompare;
      return a.teamName.toLowerCase().compareTo(b.teamName.toLowerCase());
    });
    return List.unmodifiable(sorted);
  }
}
