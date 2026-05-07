enum NotificationType {
  matchReminder,
  goalAlert,
  liveScoreChange,
  breakingNews,
  unknown;

  static NotificationType fromValue(String? value) {
    return switch (value) {
      'match_reminder' => NotificationType.matchReminder,
      'goal_alert' => NotificationType.goalAlert,
      'live_score_change' => NotificationType.liveScoreChange,
      'breaking_news' => NotificationType.breakingNews,
      _ => NotificationType.unknown,
    };
  }
}

class NotificationPayload {
  const NotificationPayload({required this.type, this.matchId, this.newsId});

  final NotificationType type;
  final String? matchId;
  final String? newsId;

  factory NotificationPayload.fromData(Map<String, dynamic> data) {
    return NotificationPayload(
      type: NotificationType.fromValue(data['type'] as String?),
      matchId: data['matchId'] as String? ?? data['match_id'] as String?,
      newsId: data['newsId'] as String? ?? data['news_id'] as String?,
    );
  }
}
