import '../../../../core/domain/enums/match_status.dart';
import 'match_event.dart';

class LiveMatch {
  const LiveMatch({
    required this.id,
    required this.fixtureId,
    required this.homeTeamName,
    required this.awayTeamName,
    this.homeScore,
    this.awayScore,
    this.status = MatchStatus.unknown,
    this.elapsed,
    this.events = const [],
  });

  final int id;
  final int fixtureId;
  final String homeTeamName;
  final String awayTeamName;
  final int? homeScore;
  final int? awayScore;
  final MatchStatus status;
  final int? elapsed;
  final List<MatchEvent> events;

  bool get hasEvents => events.isNotEmpty;
  bool get isLive => status == MatchStatus.live;
  String get displayScore =>
      homeScore != null && awayScore != null ? '$homeScore - $awayScore' : 'vs';
}
