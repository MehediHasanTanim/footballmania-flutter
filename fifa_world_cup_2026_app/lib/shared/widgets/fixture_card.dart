import 'package:flutter/material.dart';

import '../../core/domain/enums/favorite_type.dart';
import '../../core/utils/date_time_formatter.dart';
import '../../features/favorites/domain/entities/favorite_item.dart';
import '../../features/fixtures/domain/entities/fixture.dart';
import 'favorite_button.dart';
import 'status_chip.dart';

class FixtureCard extends StatelessWidget {
  const FixtureCard({super.key, required this.fixture, this.onTap});

  final Fixture fixture;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final kickoff = fixture.matchDateUtc?.toLocal();
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  StatusChip(status: fixture.status),
                  const Spacer(),
                  FavoriteButton(
                    favorite: FavoriteItem(
                      id: 'match-${fixture.id}',
                      type: FavoriteType.match,
                      referenceId: fixture.id.toString(),
                      title:
                          '${fixture.homeTeamName} vs ${fixture.awayTeamName}',
                      subtitle: fixture.venue,
                      createdAt: DateTime.now(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: _TeamName(name: fixture.homeTeamName)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      fixture.displayScore,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                  ),
                  Expanded(
                    child: _TeamName(name: fixture.awayTeamName, alignEnd: true),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 12,
                runSpacing: 6,
                children: [
                  _MetaIcon(
                    icon: Icons.schedule,
                    label: kickoff == null
                        ? 'TBD'
                        : DateTimeFormatter.formatDateTime(kickoff),
                  ),
                  _MetaIcon(icon: Icons.stadium, label: fixture.venue),
                  _MetaIcon(
                    icon: Icons.emoji_events,
                    label: fixture.group == null
                        ? fixture.stage
                        : '${fixture.stage} - ${fixture.group}',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TeamName extends StatelessWidget {
  const _TeamName({required this.name, this.alignEnd = false});

  final String name;
  final bool alignEnd;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      textAlign: alignEnd ? TextAlign.end : TextAlign.start,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w800,
          ),
    );
  }
}

class _MetaIcon extends StatelessWidget {
  const _MetaIcon({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 4),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
