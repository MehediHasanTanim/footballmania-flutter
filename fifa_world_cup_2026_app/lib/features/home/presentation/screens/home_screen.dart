import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loader.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../routes/route_names.dart';
import '../../../../shared/widgets/fixture_card.dart';
import '../../../../shared/widgets/match_card.dart';
import '../../../../shared/widgets/news_card.dart';
import '../../../../shared/widgets/section_header.dart';
import '../../../countdown/presentation/providers/countdown_provider.dart';
import '../providers/home_summary_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(homeSummaryProvider);

    return AppScaffold(
      title: AppConfig.current.appName,
      actions: [
        IconButton(
          tooltip: 'Settings',
          onPressed: () => context.push(RoutePaths.settings),
          icon: const Icon(Icons.settings_outlined),
        ),
      ],
      body: summary.when(
        loading: () => const AppLoader(label: 'Loading home feed'),
        error: (error, stackTrace) => AppErrorView(
          message: error.toString(),
          onRetry: () => ref.read(homeSummaryProvider.notifier).forceRefresh(),
        ),
        data: (data) => RefreshIndicator(
          onRefresh: () =>
              ref.read(homeSummaryProvider.notifier).forceRefresh(),
          child: ListView(
            children: [
              const _HeroCountdown(),
              SectionHeader(title: 'Quick navigation'),
              const _QuickNavGrid(),
              SectionHeader(
                title: 'Next Match',
                actionLabel: 'Fixtures',
                onAction: () => context.push(RoutePaths.fixtures),
              ),
              if (data.nextMatch == null)
                const AppEmptyState(
                  title: 'No next match',
                  message: 'Upcoming fixtures will appear here.',
                  icon: Icons.event_available,
                )
              else
                FixtureCard(
                  fixture: data.nextMatch!,
                  onTap: () => context.push('/fixtures/${data.nextMatch!.id}'),
                ),
              SectionHeader(
                title: 'Live Now',
                actionLabel: 'Live Scores',
                onAction: () => context.push(RoutePaths.liveScores),
              ),
              if (data.liveMatches.isEmpty)
                const _CompactEmpty(message: 'No live matches right now')
              else
                ...data.liveMatches
                    .take(3)
                    .map(
                      (match) => MatchCard(
                        match: match,
                        onTap: () =>
                            context.push('/fixtures/${match.fixtureId}'),
                      ),
                    ),
              SectionHeader(
                title: 'Latest News',
                actionLabel: 'News',
                onAction: () => context.push(RoutePaths.news),
              ),
              if (data.latestNews.isEmpty)
                const _CompactEmpty(message: 'No news available')
              else
                ...data.latestNews
                    .take(3)
                    .map(
                      (news) => NewsCard(
                        news: news,
                        onTap: () => context.push('/news/${news.id}'),
                      ),
                    ),
              SectionHeader(title: 'Favorites'),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.favorite),
                  title: const Text('Favorite teams and matches'),
                  subtitle: const Text(
                    'Track the teams and fixtures you care about most.',
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => context.push(RoutePaths.favorites),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeroCountdown extends ConsumerWidget {
  const _HeroCountdown();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countdown = ref.watch(countdownProvider);
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => context.push(RoutePaths.countdown),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.secondaryContainer,
              ],
            ),
          ),
          child: countdown.when(
            loading: () => const LinearProgressIndicator(),
            error: (error, stackTrace) => const Text('Countdown unavailable'),
            data: (value) => Row(
              children: [
                const Icon(Icons.sports_soccer, size: 42),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tournament countdown',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        value.isExpired
                            ? 'World Cup is underway'
                            : '${value.days} days ${value.hours} hours to kickoff',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _QuickNavGrid extends StatelessWidget {
  const _QuickNavGrid();

  @override
  Widget build(BuildContext context) {
    final items = [
      ('Fixtures', Icons.event, RoutePaths.fixtures),
      ('Live Scores', Icons.scoreboard, RoutePaths.liveScores),
      ('Teams', Icons.groups, RoutePaths.teams),
      ('Groups', Icons.table_chart, RoutePaths.groups),
      ('News', Icons.article, RoutePaths.news),
      ('Favorites', Icons.favorite, RoutePaths.favorites),
    ];
    return LayoutBuilder(
      builder: (context, constraints) {
        final count = constraints.maxWidth > 520 ? 3 : 2;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: count,
            mainAxisExtent: 84,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return Card(
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => context.push(item.$3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item.$2),
                    const SizedBox(height: 6),
                    Text(item.$1),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _CompactEmpty extends StatelessWidget {
  const _CompactEmpty({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(message, textAlign: TextAlign.center),
      ),
    );
  }
}
