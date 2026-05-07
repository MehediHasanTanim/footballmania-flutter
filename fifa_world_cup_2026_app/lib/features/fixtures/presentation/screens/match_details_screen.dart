import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/domain/enums/favorite_type.dart';
import '../../../../core/domain/enums/match_status.dart';
import '../../../../core/utils/date_time_formatter.dart';
import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loader.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../features/favorites/domain/entities/favorite_item.dart';
import '../../../../features/live_score/domain/entities/match_event.dart';
import '../../../../features/live_score/presentation/providers/live_score_provider.dart';
import '../../../../shared/widgets/favorite_button.dart';
import '../../../../shared/widgets/status_chip.dart';
import '../providers/fixtures_provider.dart';

class MatchDetailsScreen extends ConsumerWidget {
  const MatchDetailsScreen({super.key, required this.matchId});

  final String matchId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = int.tryParse(matchId);
    if (id == null) {
      return const AppScaffold(
        title: 'Match Details',
        body: AppErrorView(message: 'Invalid match id'),
      );
    }

    final fixture = ref.watch(fixtureDetailsProvider(id));
    final liveMatches = ref.watch(liveScoreProvider).valueOrNull ?? const [];

    return AppScaffold(
      title: 'Match Details',
      body: fixture.when(
        loading: () => const AppLoader(label: 'Loading match details'),
        error: (error, stackTrace) => AppErrorView(
          message: error.toString(),
          onRetry: () =>
              ref.read(fixtureDetailsProvider(id).notifier).forceRefresh(),
        ),
        data: (match) {
          final liveMatch = liveMatches
              .where((item) => item.fixtureId == match.id)
              .firstOrNull;
          final events = liveMatch?.events ?? const <MatchEvent>[];
          final kickoff = match.matchDateUtc?.toLocal();
          return RefreshIndicator(
            onRefresh: () =>
                ref.read(fixtureDetailsProvider(id).notifier).forceRefresh(),
            child: ListView(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            StatusChip(status: match.status),
                            const Spacer(),
                            FavoriteButton(
                              favorite: FavoriteItem(
                                id: 'match-${match.id}',
                                type: FavoriteType.match,
                                referenceId: match.id.toString(),
                                title:
                                    '${match.homeTeamName} vs ${match.awayTeamName}',
                                subtitle: match.venue,
                                createdAt: DateTime.now(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: _TeamBlock(name: match.homeTeamName),
                            ),
                            Text(
                              match.displayScore,
                              style: Theme.of(context).textTheme.displaySmall
                                  ?.copyWith(fontWeight: FontWeight.w900),
                            ),
                            Expanded(
                              child: _TeamBlock(
                                name: match.awayTeamName,
                                alignEnd: true,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.schedule),
                        title: const Text('Kickoff'),
                        subtitle: Text(
                          kickoff == null
                              ? 'TBD'
                              : DateTimeFormatter.formatDateTime(kickoff),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.stadium),
                        title: const Text('Venue'),
                        subtitle: Text(match.venue),
                      ),
                      ListTile(
                        leading: const Icon(Icons.emoji_events),
                        title: const Text('Stage'),
                        subtitle: Text(
                          match.group == null
                              ? match.stage
                              : '${match.stage} - ${match.group}',
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 20, 4, 8),
                  child: Text(
                    'Match Timeline',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                if (events.isEmpty)
                  const AppEmptyState(
                    title: 'No events yet',
                    message:
                        'Goals, cards, substitutions, and penalties will appear here.',
                    icon: Icons.timeline,
                  )
                else
                  ...events.map((event) => _EventTile(event: event)),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _TeamBlock extends StatelessWidget {
  const _TeamBlock({required this.name, this.alignEnd = false});

  final String name;
  final bool alignEnd;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignEnd
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        CircleAvatar(child: Text(name.characters.first)),
        const SizedBox(height: 8),
        Text(
          name,
          textAlign: alignEnd ? TextAlign.end : TextAlign.start,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}

class _EventTile extends StatelessWidget {
  const _EventTile({required this.event});

  final MatchEvent event;

  @override
  Widget build(BuildContext context) {
    final icon = switch (event.type) {
      MatchEventType.goal ||
      MatchEventType.ownGoal ||
      MatchEventType.penalty => Icons.sports_soccer,
      MatchEventType.yellowCard || MatchEventType.redCard => Icons.style,
      MatchEventType.substitution => Icons.swap_horiz,
      MatchEventType.unknown => Icons.circle,
    };
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(event.minute == null ? '-' : '${event.minute}\''),
        ),
        title: Text(event.playerName ?? event.detail ?? event.type.name),
        subtitle: Text(
          [
            event.teamName,
            event.assistName == null ? null : 'Assist: ${event.assistName}',
          ].whereType<String>().join(' - '),
        ),
        trailing: Icon(icon),
      ),
    );
  }
}
