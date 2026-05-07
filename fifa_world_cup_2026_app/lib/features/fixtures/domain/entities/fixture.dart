import '../../../../core/domain/enums/match_status.dart';

class Fixture {
  const Fixture({
    required this.id,
    required this.homeTeamId,
    required this.homeTeamName,
    required this.awayTeamId,
    required this.awayTeamName,
    this.homeTeamFlag,
    this.awayTeamFlag,
    this.matchDateUtc,
    required this.venue,
    required this.stage,
    this.group,
    this.status = MatchStatus.unknown,
    this.homeScore,
    this.awayScore,
  });

  final int id;
  final int homeTeamId;
  final String homeTeamName;
  final int awayTeamId;
  final String awayTeamName;
  final String? homeTeamFlag;
  final String? awayTeamFlag;
  final DateTime? matchDateUtc;
  final String venue;
  final String stage;
  final String? group;
  final MatchStatus status;
  final int? homeScore;
  final int? awayScore;

  bool get isUpcoming => status == MatchStatus.upcoming;
  bool get isLive => status == MatchStatus.live;
  bool get isCompleted => status == MatchStatus.completed;
  bool get hasScore => homeScore != null && awayScore != null;
  String get displayScore => hasScore ? '$homeScore - $awayScore' : 'vs';
  bool involvesTeam(int teamId) => homeTeamId == teamId || awayTeamId == teamId;
}
