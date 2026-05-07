import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loader.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../shared/widgets/search_bar_widget.dart';
import '../../../../shared/widgets/team_card.dart';
import '../../domain/entities/team.dart';
import '../providers/teams_provider.dart';

class TeamsScreen extends ConsumerStatefulWidget {
  const TeamsScreen({super.key});

  @override
  ConsumerState<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends ConsumerState<TeamsScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final teams = ref.watch(teamsProvider);
    return AppScaffold(
      title: 'Teams',
      body: Column(
        children: [
          SearchBarWidget(
            hintText: 'Search teams',
            onChanged: (value) => setState(() => _query = value),
            onClear: _query.isEmpty ? null : () => setState(() => _query = ''),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: teams.when(
              loading: () => const AppLoader(label: 'Loading teams'),
              error: (error, stackTrace) => AppErrorView(
                message: error.toString(),
                onRetry: () => ref.read(teamsProvider.notifier).forceRefresh(),
              ),
              data: (items) {
                final filtered = _filter(items);
                if (filtered.isEmpty) {
                  return const AppEmptyState(
                    title: 'No teams found',
                    message: 'Try a different team name or country code.',
                    icon: Icons.groups_outlined,
                  );
                }
                return RefreshIndicator(
                  onRefresh: () => ref.read(teamsProvider.notifier).forceRefresh(),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth < 520) {
                        return ListView.builder(
                          itemCount: filtered.length,
                          itemBuilder: (context, index) => TeamCard(
                            team: filtered[index],
                            onTap: () => context.push('/teams/${filtered[index].id}'),
                          ),
                        );
                      }
                      return GridView.builder(
                        itemCount: filtered.length,
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 360,
                          mainAxisExtent: 104,
                        ),
                        itemBuilder: (context, index) => TeamCard(
                          team: filtered[index],
                          onTap: () => context.push('/teams/${filtered[index].id}'),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Team> _filter(List<Team> items) {
    final query = _query.trim().toLowerCase();
    if (query.isEmpty) return items;
    return items.where((team) {
      return team.name.toLowerCase().contains(query) ||
          team.countryCode.toLowerCase().contains(query) ||
          (team.group?.toLowerCase().contains(query) ?? false);
    }).toList(growable: false);
  }
}
