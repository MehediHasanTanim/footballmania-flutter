import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loader.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../features/search/domain/entities/recent_search.dart';
import '../../../../features/search/presentation/providers/recent_search_provider.dart';
import '../../../../shared/widgets/filter_chip_bar.dart';
import '../../../../shared/widgets/recent_search_list.dart';
import '../../../../shared/widgets/search_result_count.dart';
import '../../../../shared/widgets/team_card.dart';
import '../providers/teams_provider.dart';
import '../widgets/team_search_bar.dart';

class TeamsScreen extends ConsumerStatefulWidget {
  const TeamsScreen({super.key});

  @override
  ConsumerState<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends ConsumerState<TeamsScreen> {
  @override
  Widget build(BuildContext context) {
    final teams = ref.watch(searchedTeamsProvider);
    final filter = ref.watch(teamSearchProvider);
    final recentSearches = ref.watch(recentSearchProvider(SearchType.team));
    return AppScaffold(
      title: 'Teams',
      body: Column(
        children: [
          TeamSearchBar(
            initialValue: filter.searchQuery,
            onChanged: _applySearch,
            onClear: filter.hasSearch ? () => _applySearch('') : null,
          ),
          const SizedBox(height: 12),
          if (!filter.hasSearch)
            RecentSearchList(
              searches: recentSearches,
              onSelected: _applySearch,
              onRemove: (value) => ref
                  .read(recentSearchProvider(SearchType.team).notifier)
                  .remove(value),
              onClear: () => ref
                  .read(recentSearchProvider(SearchType.team).notifier)
                  .clear(),
            ),
          Wrap(
            spacing: 8,
            children: [
              DropdownButton<String?>(
                value: filter.group,
                hint: const Text('Group'),
                items: const [
                  DropdownMenuItem(value: null, child: Text('All groups')),
                  DropdownMenuItem(value: 'A', child: Text('Group A')),
                  DropdownMenuItem(value: 'B', child: Text('Group B')),
                  DropdownMenuItem(value: 'C', child: Text('Group C')),
                  DropdownMenuItem(value: 'D', child: Text('Group D')),
                  DropdownMenuItem(value: 'E', child: Text('Group E')),
                  DropdownMenuItem(value: 'F', child: Text('Group F')),
                  DropdownMenuItem(value: 'G', child: Text('Group G')),
                  DropdownMenuItem(value: 'H', child: Text('Group H')),
                  DropdownMenuItem(value: 'I', child: Text('Group I')),
                  DropdownMenuItem(value: 'J', child: Text('Group J')),
                  DropdownMenuItem(value: 'K', child: Text('Group K')),
                  DropdownMenuItem(value: 'L', child: Text('Group L')),
                ],
                onChanged: (value) =>
                    ref.read(teamSearchProvider.notifier).setGroup(value),
              ),
              FilterChip(
                label: const Text('Favorites first'),
                selected: filter.favoriteOnly,
                onSelected: (value) => ref
                    .read(teamSearchProvider.notifier)
                    .setFavoriteOnly(value),
              ),
            ],
          ),
          FilterChipBar(
            chips: [
              if (filter.searchQuery?.trim().isNotEmpty == true)
                FilterChipData(label: 'Search: ${filter.searchQuery}'),
              if (filter.group?.trim().isNotEmpty == true)
                FilterChipData(label: 'Group ${filter.group}'),
              if (filter.favoriteOnly) const FilterChipData(label: 'Favorites'),
            ],
            onReset: () => ref.read(teamSearchProvider.notifier).clear(),
          ),
          Expanded(
            child: teams.when(
              loading: () => const AppLoader(label: 'Loading teams'),
              error: (error, stackTrace) => AppErrorView(
                message: error.toString(),
                onRetry: () => ref.read(teamsProvider.notifier).forceRefresh(),
              ),
              data: (items) {
                if (items.isEmpty) {
                  return const AppEmptyState(
                    title: 'No teams found',
                    message: 'Try a different team name or country code.',
                    icon: Icons.groups_outlined,
                  );
                }
                return RefreshIndicator(
                  onRefresh: () =>
                      ref.read(teamsProvider.notifier).forceRefresh(),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth < 520) {
                        return ListView.builder(
                          itemCount: items.length + 1,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return SearchResultCount(
                                count: items.length,
                                label: items.length == 1 ? 'team' : 'teams',
                              );
                            }
                            final team = items[index - 1];
                            return TeamCard(
                              team: team,
                              onTap: () => context.push('/teams/${team.id}'),
                            );
                          },
                        );
                      }
                      return GridView.builder(
                        itemCount: items.length,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 360,
                              mainAxisExtent: 104,
                            ),
                        itemBuilder: (context, index) => TeamCard(
                          team: items[index],
                          onTap: () =>
                              context.push('/teams/${items[index].id}'),
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

  Future<void> _applySearch(String query) async {
    ref.read(teamSearchProvider.notifier).setQuery(query);
    if (query.trim().isNotEmpty) {
      await ref.read(recentSearchProvider(SearchType.team).notifier).add(query);
    }
  }
}
