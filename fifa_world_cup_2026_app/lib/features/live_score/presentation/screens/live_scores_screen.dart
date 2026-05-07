import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/network/connectivity_provider.dart';
import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loader.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../shared/widgets/match_card.dart';
import '../providers/live_score_provider.dart';

class LiveScoresScreen extends ConsumerWidget {
  const LiveScoresScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liveScores = ref.watch(liveScoreStreamProvider);
    final isOnline = ref.watch(connectivityStatusProvider).valueOrNull ?? true;

    return AppScaffold(
      title: 'Live Scores',
      actions: [
        IconButton(
          tooltip: 'Refresh live scores',
          onPressed: () => ref.read(liveScoreProvider.notifier).refreshStream(),
          icon: const Icon(Icons.refresh),
        ),
      ],
      body: liveScores.when(
        loading: () => const AppLoader(label: 'Checking live matches'),
        error: (error, stackTrace) => AppErrorView(
          message: isOnline ? error.toString() : 'Offline. Showing the latest cached live score data when available.',
          onRetry: () => ref.read(liveScoreProvider.notifier).refreshStream(),
        ),
        data: (matches) {
          if (matches.isEmpty) {
            return RefreshIndicator(
              onRefresh: () async => ref.read(liveScoreProvider.notifier).refreshStream(),
              child: ListView(
                children: const [
                  AppEmptyState(
                    title: 'No live matches',
                    message: 'Live score cards will appear during active matches.',
                    icon: Icons.scoreboard_outlined,
                  ),
                ],
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () async => ref.read(liveScoreProvider.notifier).refreshStream(),
            child: ListView.builder(
              itemCount: matches.length + (isOnline ? 0 : 1),
              itemBuilder: (context, index) {
                if (!isOnline && index == 0) {
                  return const Card(
                    child: ListTile(
                      leading: Icon(Icons.cloud_off),
                      title: Text('Offline fallback'),
                      subtitle: Text('Scores may be cached and not fully current.'),
                    ),
                  );
                }
                final match = matches[index - (isOnline ? 0 : 1)];
                return MatchCard(
                  match: match,
                  onTap: () => context.push('/fixtures/${match.fixtureId}'),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
