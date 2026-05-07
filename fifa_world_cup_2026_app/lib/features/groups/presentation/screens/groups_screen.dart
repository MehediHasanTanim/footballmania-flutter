import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loader.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../shared/widgets/group_table.dart';
import '../../domain/entities/group_standing.dart';
import '../providers/groups_provider.dart';

enum _StandingSort { points, goalDifference, goalsFor }

class GroupsScreen extends ConsumerStatefulWidget {
  const GroupsScreen({super.key});

  @override
  ConsumerState<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends ConsumerState<GroupsScreen> {
  _StandingSort _sort = _StandingSort.points;

  @override
  Widget build(BuildContext context) {
    final standings = ref.watch(selectedGroupStandingsProvider);
    return AppScaffold(
      title: 'Groups',
      actions: [
        PopupMenuButton<_StandingSort>(
          tooltip: 'Sort standings',
          initialValue: _sort,
          onSelected: (value) => setState(() => _sort = value),
          itemBuilder: (context) => const [
            PopupMenuItem(value: _StandingSort.points, child: Text('Sort by points')),
            PopupMenuItem(value: _StandingSort.goalDifference, child: Text('Sort by goal difference')),
            PopupMenuItem(value: _StandingSort.goalsFor, child: Text('Sort by goals scored')),
          ],
        ),
      ],
      body: standings.when(
        loading: () => const AppLoader(label: 'Loading groups'),
        error: (error, stackTrace) => AppErrorView(
          message: error.toString(),
          onRetry: () => ref.read(groupsProvider.notifier).forceRefresh(),
        ),
        data: (items) {
          if (items.isEmpty) {
            return const AppEmptyState(
              title: 'No group standings',
              message: 'Tables will appear after tournament data is available.',
              icon: Icons.table_chart_outlined,
            );
          }
          final grouped = _group(items);
          final keys = grouped.keys.toList()..sort();
          return RefreshIndicator(
            onRefresh: () => ref.read(groupsProvider.notifier).forceRefresh(),
            child: ListView.builder(
              itemCount: keys.length,
              itemBuilder: (context, index) {
                final group = keys[index];
                return GroupTable(
                  group: group,
                  standings: _sortStandings(grouped[group]!),
                  onTeamTap: (standing) => context.push('/teams/${standing.teamId}'),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Map<String, List<GroupStanding>> _group(List<GroupStanding> items) {
    final grouped = <String, List<GroupStanding>>{};
    for (final standing in items) {
      grouped.putIfAbsent(standing.group, () => <GroupStanding>[]).add(standing);
    }
    return grouped;
  }

  List<GroupStanding> _sortStandings(List<GroupStanding> items) {
    final copy = [...items];
    copy.sort((a, b) {
      final result = switch (_sort) {
        _StandingSort.points => b.points.compareTo(a.points),
        _StandingSort.goalDifference => b.goalDifference.compareTo(a.goalDifference),
        _StandingSort.goalsFor => b.goalsFor.compareTo(a.goalsFor),
      };
      return result == 0 ? a.rank.compareTo(b.rank) : result;
    });
    return copy;
  }
}
