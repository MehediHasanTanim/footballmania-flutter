import '../../../../core/domain/enums/match_status.dart';

class MatchEvent {
  const MatchEvent({
    required this.id,
    this.minute,
    this.teamId,
    this.teamName,
    this.playerName,
    this.assistName,
    this.type = MatchEventType.unknown,
    this.detail,
  });

  final int id;
  final int? minute;
  final int? teamId;
  final String? teamName;
  final String? playerName;
  final String? assistName;
  final MatchEventType type;
  final String? detail;

  bool get isCard => type == MatchEventType.yellowCard || type == MatchEventType.redCard;
  bool get isGoal => type == MatchEventType.goal || type == MatchEventType.ownGoal || type == MatchEventType.penalty;
}
