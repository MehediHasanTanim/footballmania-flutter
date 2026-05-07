import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loader.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../features/search/domain/entities/recent_search.dart';
import '../../../../features/search/presentation/providers/recent_search_provider.dart';
import '../../../../shared/widgets/news_card.dart';
import '../../../../shared/widgets/recent_search_list.dart';
import '../../../../shared/widgets/search_result_count.dart';
import '../providers/news_provider.dart';
import '../widgets/news_search_bar.dart';

class NewsScreen extends ConsumerWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final news = ref.watch(searchedNewsProvider);
    final query =
        ref.watch(newsSearchProvider.select((filter) => filter.searchQuery)) ??
        '';
    final recentSearches = ref.watch(recentSearchProvider(SearchType.news));

    return AppScaffold(
      title: 'News',
      body: Column(
        children: [
          NewsSearchBar(
            initialValue: query,
            onChanged: (value) async {
              await ref.read(newsProvider.notifier).search(value);
              if (value.trim().isNotEmpty) {
                await ref
                    .read(recentSearchProvider(SearchType.news).notifier)
                    .add(value);
              }
            },
            onClear: query.isEmpty
                ? null
                : () {
                    ref.read(newsSearchProvider.notifier).clear();
                    ref.read(newsProvider.notifier).refresh();
                  },
          ),
          const SizedBox(height: 12),
          if (query.isEmpty)
            RecentSearchList(
              searches: recentSearches,
              onSelected: (value) =>
                  ref.read(newsProvider.notifier).search(value),
              onRemove: (value) => ref
                  .read(recentSearchProvider(SearchType.news).notifier)
                  .remove(value),
              onClear: () => ref
                  .read(recentSearchProvider(SearchType.news).notifier)
                  .clear(),
            ),
          Expanded(
            child: news.when(
              loading: () => const AppLoader(label: 'Loading latest news'),
              error: (error, stackTrace) => AppErrorView(
                message: error.toString(),
                onRetry: () => ref.read(newsProvider.notifier).forceRefresh(),
              ),
              data: (items) {
                if (items.isEmpty) {
                  return const AppEmptyState(
                    title: 'No news found',
                    message: 'Try another keyword or refresh latest news.',
                    icon: Icons.article_outlined,
                  );
                }
                return RefreshIndicator(
                  onRefresh: () =>
                      ref.read(newsProvider.notifier).forceRefresh(),
                  child: ListView.builder(
                    itemCount: items.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return SearchResultCount(
                          count: items.length,
                          label: items.length == 1 ? 'article' : 'articles',
                        );
                      }
                      final item = items[index - 1];
                      return NewsCard(
                        news: item,
                        onTap: () => context.push('/news/${item.id}'),
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
}
