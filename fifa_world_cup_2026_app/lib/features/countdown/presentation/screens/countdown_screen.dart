import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loader.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../shared/widgets/countdown_card.dart';
import '../../../../shared/widgets/fixture_card.dart';
import '../../../fixtures/presentation/providers/fixtures_provider.dart';
import '../providers/countdown_provider.dart';

class CountdownScreen extends ConsumerWidget {
  const CountdownScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countdown = ref.watch(countdownProvider);
    final fixtures = ref.watch(upcomingFixturesProvider);

    return AppScaffold(
      title: 'Countdown',
      body: countdown.when(
        loading: () => const AppLoader(label: 'Calculating countdown'),
        error: (error, stackTrace) => AppErrorView(
          message: error.toString(),
          onRetry: () => ref.invalidate(countdownProvider),
        ),
        data: (value) => RefreshIndicator(
          onRefresh: () => ref.read(fixturesProvider.notifier).forceRefresh(),
          child: ListView(
            children: [
              CountdownCard(
                title: 'FIFA World Cup 2026 begins in',
                countdown: value,
              ),
              const SizedBox(height: 8),
              Text(
                'Upcoming match countdowns',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              fixtures.when(
                loading: () => const AppLoader(),
                error: (error, stackTrace) =>
                    AppErrorView(message: error.toString()),
                data: (items) {
                  final dated = items
                      .where((fixture) => fixture.matchDateUtc != null)
                      .take(6)
                      .toList(growable: false);
                  if (dated.isEmpty) {
                    return const AppEmptyState(
                      title: 'No upcoming matches',
                      message:
                          'Match countdowns will appear once fixtures are available.',
                      icon: Icons.timer_outlined,
                    );
                  }
                  return Column(
                    children: dated
                        .map((fixture) => FixtureCard(fixture: fixture))
                        .toList(growable: false),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
