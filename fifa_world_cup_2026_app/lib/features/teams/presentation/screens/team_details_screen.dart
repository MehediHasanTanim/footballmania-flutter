import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loader.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../shared/widgets/fixture_card.dart';
import '../../../../shared/widgets/team_card.dart';
import '../../../fixtures/presentation/providers/fixtures_provider.dart';
import '../providers/teams_provider.dart';

class TeamDetailsScreen extends ConsumerWidget {
  const TeamDetailsScreen({super.key, required this.teamId});

  final String teamId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = int.tryParse(teamId);
    if (id == null) {
      return const AppScaffold(title: 'Team Details', body: AppErrorView(message: 'Invalid team id'));
    }
    final team = ref.watch(teamDetailsProvider(id));
    final fixtures = ref.watch(fixturesProvider).valueOrNull ?? const [];

    return AppScaffold(
      title: 'Team Details',
      body: team.when(
        loading: () => const AppLoader(label: 'Loading team'),
        error: (error, stackTrace) => AppErrorView(
          message: error.toString(),
          onRetry: () => ref.read(teamDetailsProvider(id).notifier).forceRefresh(),
        ),
        data: (value) {
          final teamFixtures = fixtures.where((fixture) => fixture.involvesTeam(value.id)).toList(growable: false);
          final results = teamFixtures.where((fixture) => fixture.isCompleted).toList(growable: false);
          final upcoming = teamFixtures.where((fixture) => !fixture.isCompleted).toList(growable: false);
          return RefreshIndicator(
            onRefresh: () => ref.read(teamDetailsProvider(id).notifier).forceRefresh(),
            child: ListView(
              children: [
                TeamCard(team: value),
                Card(
                  child: Column(
                    children: [
                      ListTile(leading: const Icon(Icons.flag), title: const Text('Group'), subtitle: Text(value.group ?? 'TBD')),
                      ListTile(leading: const Icon(Icons.person), title: const Text('Coach'), subtitle: Text(value.coach ?? 'Unavailable')),
                      ListTile(leading: const Icon(Icons.leaderboard), title: const Text('FIFA ranking'), subtitle: Text(value.fifaRanking?.toString() ?? 'Unavailable')),
                    ],
                  ),
                ),
                _Section(title: 'Fixtures'),
                if (upcoming.isEmpty)
                  const AppEmptyState(title: 'No fixtures', message: 'Upcoming matches will appear here.', icon: Icons.event)
                else
                  ...upcoming.map((fixture) => FixtureCard(fixture: fixture)),
                _Section(title: 'Results'),
                if (results.isEmpty)
                  const AppEmptyState(title: 'No results', message: 'Completed matches will appear here.', icon: Icons.check_circle_outline)
                else
                  ...results.map((fixture) => FixtureCard(fixture: fixture)),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 20, 4, 8),
      child: Text(title, style: Theme.of(context).textTheme.titleLarge),
    );
  }
}
