import '../../../live_score/domain/entities/match_event.dart';

class Match {
  const Match({
    required this.id,
    required this.fixtureId,
    required this.homeTeam,
    required this.awayTeam,
    this.score,
    required this.status,
    required this.venue,
    this.kickoffTimeUtc,
    this.events = const [],
  });

  final int id;
  final int fixtureId;
  final String homeTeam;
  final String awayTeam;
  final String? score;
  final String status;
  final String venue;
  final DateTime? kickoffTimeUtc;
  final List<MatchEvent> events;
}
