import 'package:flutter/material.dart';

import '../../features/live_score/domain/entities/live_match.dart';
import 'status_chip.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({super.key, required this.match, this.onTap});

  final LiveMatch match;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  StatusChip(
                    status: match.status,
                    label: match.elapsed == null ? null : '${match.elapsed}\'',
                  ),
                  const Spacer(),
                  Text('${match.events.length} events'),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(child: Text(match.homeTeamName)),
                  Text(
                    match.displayScore,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  Expanded(
                    child: Text(match.awayTeamName, textAlign: TextAlign.end),
                  ),
                ],
              ),
              if (match.events.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(
                  match.events.take(2).map((event) {
                    final minute = event.minute == null ? '' : '${event.minute}\' ';
                    return '$minute${event.playerName ?? event.detail ?? event.type.name}';
                  }).join('  |  '),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
