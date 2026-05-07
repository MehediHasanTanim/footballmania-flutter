import '../../../../core/domain/enums/match_status.dart';
import 'match_event.dart';

class Match {
  const Match({
    required this.id,
    required this.fixtureId,
    required this.homeTeam,
    required this.awayTeam,
    this.score,
    this.status = MatchStatus.unknown,
    required this.venue,
    this.kickoffTimeUtc,
    this.events = const [],
  });

  final int id;
  final int fixtureId;
  final String homeTeam;
  final String awayTeam;
  final String? score;
  final MatchStatus status;
  final String venue;
  final DateTime? kickoffTimeUtc;
  final List<MatchEvent> events;

  bool get hasEvents => events.isNotEmpty;
  bool get isLive => status == MatchStatus.live;
  bool get isCompleted => status == MatchStatus.completed;
}
