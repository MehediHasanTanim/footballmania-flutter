class NotificationPreferences {
  const NotificationPreferences({
    required this.matchReminders,
    required this.goalAlerts,
    required this.liveScoreAlerts,
    required this.newsAlerts,
    this.reminderMinutesBefore = 30,
  });

  final bool matchReminders;
  final bool goalAlerts;
  final bool liveScoreAlerts;
  final bool newsAlerts;
  final int reminderMinutesBefore;

  bool get anyEnabled =>
      matchReminders || goalAlerts || liveScoreAlerts || newsAlerts;

  Map<String, dynamic> toJson() => {
    'matchReminders': matchReminders,
    'goalAlerts': goalAlerts,
    'liveScoreAlerts': liveScoreAlerts,
    'newsAlerts': newsAlerts,
    'reminderMinutesBefore': reminderMinutesBefore,
  };
}
