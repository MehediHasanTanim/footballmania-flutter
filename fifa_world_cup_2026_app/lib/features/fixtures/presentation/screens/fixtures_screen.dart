import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/date_time_formatter.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loader.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../features/search/domain/entities/recent_search.dart';
import '../../../../features/search/presentation/providers/recent_search_provider.dart';
import '../../../../shared/widgets/filter_bottom_sheet.dart';
import '../../../../shared/widgets/filter_chip_bar.dart';
import '../../../../shared/widgets/fixture_card.dart';
import '../../../../shared/widgets/recent_search_list.dart';
import '../../../../shared/widgets/search_empty_state.dart';
import '../../../../shared/widgets/search_result_count.dart';
import '../../domain/entities/fixture.dart';
import '../../domain/entities/fixture_filter.dart';
import '../providers/fixtures_provider.dart';
import '../widgets/fixture_search_bar.dart';

class FixturesScreen extends ConsumerStatefulWidget {
  const FixturesScreen({super.key});

  @override
  ConsumerState<FixturesScreen> createState() => _FixturesScreenState();
}

class _FixturesScreenState extends ConsumerState<FixturesScreen> {
  @override
  Widget build(BuildContext context) {
    final fixtures = ref.watch(filteredFixturesProvider);
    final filter = ref.watch(fixtureFilterProvider);
    final recentSearches = ref.watch(recentSearchProvider(SearchType.fixture));

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
          FixtureSearchBar(
            initialValue: filter.searchQuery,
            onChanged: _applySearch,
            onClear: filter.hasSearch ? () => _applySearch('') : null,
          ),
          const SizedBox(height: 12),
          if (!filter.hasSearch)
            RecentSearchList(
              searches: recentSearches,
              onSelected: _applySearch,
              onRemove: (query) => ref
                  .read(recentSearchProvider(SearchType.fixture).notifier)
                  .remove(query),
              onClear: () => ref
                  .read(recentSearchProvider(SearchType.fixture).notifier)
                  .clear(),
            ),
          FilterChipBar(chips: _chips(filter), onReset: _resetFilters),
          Expanded(
            child: fixtures.when(
              loading: () => const AppLoader(label: 'Loading fixtures'),
              error: (error, stackTrace) => AppErrorView(
                message: error.toString(),
                onRetry: () =>
                    ref.read(fixturesProvider.notifier).forceRefresh(),
              ),
              data: (items) {
                if (items.isEmpty) {
                  return const SearchEmptyState(
                    title: 'No fixtures found',
                    message: 'Try clearing search or filters.',
                  );
                }
                final grouped = _groupByDate(items);
                final keys = grouped.keys.toList();
                return RefreshIndicator(
                  onRefresh: () =>
                      ref.read(fixturesProvider.notifier).forceRefresh(),
                  child: ListView.builder(
                    itemCount: keys.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return SearchResultCount(
                          count: items.length,
                          label: items.length == 1 ? 'fixture' : 'fixtures',
                        );
                      }
                      final date = keys[index - 1];
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
    ref.read(fixtureFilterProvider.notifier).replaceFilters(result);
    await ref.read(fixturesProvider.notifier).refresh();
  }

  Future<void> _applySearch(String query) async {
    ref.read(fixtureFilterProvider.notifier).setSearchQuery(query);
    if (query.trim().isNotEmpty) {
      await ref
          .read(recentSearchProvider(SearchType.fixture).notifier)
          .add(query);
    }
  }

  void _resetFilters() {
    ref.read(fixtureFilterProvider.notifier).clearFilters();
    ref.read(fixturesProvider.notifier).refresh();
  }

  List<FilterChipData> _chips(FixtureFilter filter) {
    return [
      if (filter.searchQuery?.trim().isNotEmpty == true)
        FilterChipData(label: 'Search: ${filter.searchQuery}'),
      if (filter.selectedDate != null)
        FilterChipData(
          label: DateTimeFormatter.formatDate(filter.selectedDate!),
        ),
      if (filter.selectedGroup?.trim().isNotEmpty == true)
        FilterChipData(label: 'Group ${filter.selectedGroup}'),
      if (filter.selectedStage?.trim().isNotEmpty == true)
        FilterChipData(label: filter.selectedStage!),
      if (filter.selectedStatus != null)
        FilterChipData(label: filter.selectedStatus!.name),
    ];
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
