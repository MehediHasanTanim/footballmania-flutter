import 'package:flutter/material.dart';

import '../../core/domain/enums/match_status.dart';

class StatusChip extends StatelessWidget {
  const StatusChip({super.key, required this.status, this.label});

  final MatchStatus status;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final color = switch (status) {
      MatchStatus.live => Colors.red,
      MatchStatus.completed => Colors.blueGrey,
      MatchStatus.upcoming => Theme.of(context).colorScheme.primary,
      MatchStatus.postponed => Colors.orange,
      MatchStatus.cancelled => Theme.of(context).colorScheme.error,
      MatchStatus.unknown => Theme.of(context).colorScheme.outline,
    };

    return Chip(
      visualDensity: VisualDensity.compact,
      label: Text(label ?? status.name.toUpperCase()),
      avatar: status == MatchStatus.live
          ? const Icon(Icons.circle, size: 10, color: Colors.red)
          : null,
      side: BorderSide(color: color.withValues(alpha: 0.35)),
      backgroundColor: color.withValues(alpha: 0.12),
      labelStyle: TextStyle(color: color, fontWeight: FontWeight.w700),
    );
  }
}
