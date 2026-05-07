import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/domain/value_objects/fixture_filter.dart';
import '../../../../core/utils/date_time_formatter.dart';
import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loader.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../shared/widgets/filter_bottom_sheet.dart';
import '../../../../shared/widgets/fixture_card.dart';
import '../../../../shared/widgets/search_bar_widget.dart';
import '../../domain/entities/fixture.dart';
import '../providers/fixtures_provider.dart';

class FixturesScreen extends ConsumerStatefulWidget {
  const FixturesScreen({super.key});

  @override
  ConsumerState<FixturesScreen> createState() => _FixturesScreenState();
}

class _FixturesScreenState extends ConsumerState<FixturesScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final fixtures = ref.watch(filteredFixturesProvider);

    return AppScaffold(
      title: 'Fixtures',
      actions: [
        IconButton(
          tooltip: 'Filters',
          icon: const Icon(Icons.tune),
          onPressed: _showFilters,
        ),
      ],
      body: Column(
        children: [
          SearchBarWidget(
            hintText: 'Search team, venue, or stage',
            onChanged: (value) => setState(() => _query = value),
            onClear: _query.isEmpty ? null : () => setState(() => _query = ''),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: fixtures.when(
              loading: () => const AppLoader(label: 'Loading fixtures'),
              error: (error, stackTrace) => AppErrorView(
                message: error.toString(),
                onRetry: () =>
                    ref.read(fixturesProvider.notifier).forceRefresh(),
              ),
              data: (items) {
                final searched = _search(items);
                if (searched.isEmpty) {
                  return const AppEmptyState(
                    title: 'No fixtures found',
                    message: 'Try clearing search or filters.',
                    icon: Icons.event_busy,
                  );
                }
                final grouped = _groupByDate(searched);
                final keys = grouped.keys.toList();
                return RefreshIndicator(
                  onRefresh: () =>
                      ref.read(fixturesProvider.notifier).forceRefresh(),
                  child: ListView.builder(
                    itemCount: keys.length,
                    itemBuilder: (context, index) {
                      final date = keys[index];
                      final groupItems = grouped[date]!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4, 16, 4, 4),
                            child: Text(
                              date,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          ...groupItems.map(
                            (fixture) => FixtureCard(
                              fixture: fixture,
                              onTap: () =>
                                  context.push('/fixtures/${fixture.id}'),
                            ),
                          ),
                        ],
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

  Future<void> _showFilters() async {
    final result = await showModalBottomSheet<FixtureFilter>(
      context: context,
      isScrollControlled: true,
      builder: (context) =>
          FilterBottomSheet(initialFilter: ref.read(fixtureFilterProvider)),
    );
    if (result == null) return;
    ref.read(fixtureFilterProvider.notifier).clearFilters();
    ref
        .read(fixtureFilterProvider.notifier)
        .update(
          date: result.date,
          teamId: result.teamId,
          group: result.group,
          stage: result.stage,
          status: result.status,
        );
    await ref.read(fixturesProvider.notifier).refresh();
  }

  List<Fixture> _search(List<Fixture> items) {
    final query = _query.trim().toLowerCase();
    if (query.isEmpty) return items;
    return items
        .where((fixture) {
          return fixture.homeTeamName.toLowerCase().contains(query) ||
              fixture.awayTeamName.toLowerCase().contains(query) ||
              fixture.venue.toLowerCase().contains(query) ||
              fixture.stage.toLowerCase().contains(query) ||
              (fixture.group?.toLowerCase().contains(query) ?? false);
        })
        .toList(growable: false);
  }

  Map<String, List<Fixture>> _groupByDate(List<Fixture> items) {
    final grouped = <String, List<Fixture>>{};
    for (final fixture in items) {
      final date = fixture.matchDateUtc?.toLocal();
      final key = date == null
          ? 'Date TBD'
          : DateTimeFormatter.formatDate(date);
      grouped.putIfAbsent(key, () => <Fixture>[]).add(fixture);
    }
    return grouped;
  }
}
