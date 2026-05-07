import 'package:flutter/material.dart';

import '../../features/groups/domain/entities/group_standing.dart';

class GroupTable extends StatelessWidget {
  const GroupTable({
    super.key,
    required this.group,
    required this.standings,
    this.onTeamTap,
  });

  final String group;
  final List<GroupStanding> standings;
  final ValueChanged<GroupStanding>? onTeamTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Group $group',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Team')),
                  DataColumn(label: Text('P')),
                  DataColumn(label: Text('W')),
                  DataColumn(label: Text('D')),
                  DataColumn(label: Text('L')),
                  DataColumn(label: Text('GD')),
                  DataColumn(label: Text('Pts')),
                ],
                rows: standings.map((standing) {
                  final qualifies = standing.rank <= 2;
                  return DataRow(
                    color: qualifies
                        ? WidgetStatePropertyAll(
                            Theme.of(context)
                                .colorScheme
                                .primaryContainer
                                .withValues(alpha: 0.35),
                          )
                        : null,
                    cells: [
                      DataCell(
                        Text('${standing.rank}. ${standing.teamName}'),
                        onTap: () => onTeamTap?.call(standing),
                      ),
                      DataCell(Text('${standing.played}')),
                      DataCell(Text('${standing.won}')),
                      DataCell(Text('${standing.drawn}')),
                      DataCell(Text('${standing.lost}')),
                      DataCell(Text('${standing.goalDifference}')),
                      DataCell(Text('${standing.points}')),
                    ],
                  );
                }).toList(growable: false),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
