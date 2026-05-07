class GroupStanding {
  const GroupStanding({
    required this.group,
    required this.teamId,
    required this.teamName,
    this.teamFlag,
    required this.played,
    required this.won,
    required this.drawn,
    required this.lost,
    required this.goalsFor,
    required this.goalsAgainst,
    required this.points,
    required this.rank,
  });

  final String group;
  final int teamId;
  final String teamName;
  final String? teamFlag;
  final int played;
  final int won;
  final int drawn;
  final int lost;
  final int goalsFor;
  final int goalsAgainst;
  final int points;
  final int rank;

  int get goalDifference => goalsFor - goalsAgainst;
}
