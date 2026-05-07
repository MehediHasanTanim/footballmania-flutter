import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/date_time_formatter.dart';
import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loader.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../providers/news_provider.dart';

class NewsDetailsScreen extends ConsumerWidget {
  const NewsDetailsScreen({super.key, required this.newsId});

  final String newsId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = int.tryParse(newsId);
    if (id == null) {
      return const AppScaffold(
        title: 'News Details',
        body: AppErrorView(message: 'Invalid news id'),
      );
    }
    final newsState = ref.watch(newsProvider);

    return AppScaffold(
      title: 'News Details',
      body: newsState.when(
        loading: () => const AppLoader(label: 'Loading article'),
        error: (error, stackTrace) => AppErrorView(
          message: error.toString(),
          onRetry: () => ref.read(newsProvider.notifier).forceRefresh(),
        ),
        data: (items) {
          final news = items.where((item) => item.id == id).firstOrNull;
          if (news == null) {
            return const AppEmptyState(
              title: 'Article not found',
              message: 'Refresh news and try again.',
              icon: Icons.article_outlined,
            );
          }
          final url = news.sourceUrl ?? news.url;
          return ListView(
            children: [
              if (news.hasImage)
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    imageUrl: news.imageUrl!,
                    height: 220,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        const SizedBox.shrink(),
                  ),
                ),
              const SizedBox(height: 16),
              Text(
                news.title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${news.sourceName}${news.publishedAt == null ? '' : ' - ${DateTimeFormatter.formatDateTime(news.publishedAt!.toLocal())}'}',
              ),
              const SizedBox(height: 18),
              Text(
                news.content.isEmpty ? news.description : news.content,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              if (url != null && url.trim().isNotEmpty)
                FilledButton.icon(
                  onPressed: () => showDialog<void>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Original article'),
                      content: SelectableText(url),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Close'),
                        ),
                      ],
                    ),
                  ),
                  icon: const Icon(Icons.open_in_new),
                  label: const Text('Open original article'),
                ),
            ],
          );
        },
      ),
    );
  }
}
