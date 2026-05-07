enum MatchStatus {
  upcoming,
  live,
  completed,
  postponed,
  cancelled,
  unknown;

  static MatchStatus fromString(String? value) {
    final normalized = value
        ?.trim()
        .toLowerCase()
        .replaceAll('-', '_')
        .replaceAll(' ', '_');
    return switch (normalized) {
      'upcoming' ||
      'scheduled' ||
      'not_started' ||
      'ns' => MatchStatus.upcoming,
      'live' ||
      'in_play' ||
      'first_half' ||
      'second_half' ||
      'halftime' ||
      'ht' => MatchStatus.live,
      'completed' ||
      'finished' ||
      'ft' ||
      'aet' ||
      'pen' => MatchStatus.completed,
      'postponed' || 'pst' => MatchStatus.postponed,
      'cancelled' || 'canceled' || 'cancel' => MatchStatus.cancelled,
      _ => MatchStatus.unknown,
    };
  }
}

enum MatchEventType {
  goal,
  yellowCard,
  redCard,
  substitution,
  penalty,
  ownGoal,
  unknown;

  static MatchEventType fromString(String? value) {
    final normalized = value
        ?.trim()
        .toLowerCase()
        .replaceAll('-', '_')
        .replaceAll(' ', '_');
    return switch (normalized) {
      'goal' => MatchEventType.goal,
      'yellow_card' || 'yellowcard' => MatchEventType.yellowCard,
      'red_card' || 'redcard' => MatchEventType.redCard,
      'substitution' || 'subst' => MatchEventType.substitution,
      'penalty' => MatchEventType.penalty,
      'own_goal' || 'owngoal' => MatchEventType.ownGoal,
      _ => MatchEventType.unknown,
    };
  }
}
