import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loader.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../shared/widgets/news_card.dart';
import '../../../../shared/widgets/search_bar_widget.dart';
import '../providers/news_provider.dart';

class NewsScreen extends ConsumerWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final news = ref.watch(searchedNewsProvider);
    final query = ref.watch(newsSearchProvider.select((filter) => filter.keyword)) ?? '';

    return AppScaffold(
      title: 'News',
      body: Column(
        children: [
          SearchBarWidget(
            hintText: 'Search news',
            initialValue: query,
            onChanged: (value) => ref.read(newsProvider.notifier).search(value),
            onClear: query.isEmpty
                ? null
                : () {
                    ref.read(newsSearchProvider.notifier).clear();
                    ref.read(newsProvider.notifier).refresh();
                  },
          ),
          const SizedBox(height: 12),
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
                  onRefresh: () => ref.read(newsProvider.notifier).forceRefresh(),
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) => NewsCard(
                      news: items[index],
                      onTap: () => context.push('/news/${items[index].id}'),
                    ),
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
