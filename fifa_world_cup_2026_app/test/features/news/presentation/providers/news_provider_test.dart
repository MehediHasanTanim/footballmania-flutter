import 'package:fifa_world_cup_2026_app/core/utils/result.dart';
import 'package:fifa_world_cup_2026_app/features/news/domain/entities/news.dart';
import 'package:fifa_world_cup_2026_app/features/news/domain/repositories/news_repository.dart';
import 'package:fifa_world_cup_2026_app/features/news/presentation/providers/news_provider.dart';
import 'package:fifa_world_cup_2026_app/shared/providers/repository_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('news provider loads latest news', () async {
    final container = ProviderContainer(
      overrides: [newsRepositoryProvider.overrideWithValue(_NewsRepository())],
    );
    addTearDown(container.dispose);

    final result = await container.read(newsProvider.future);

    expect(result.map((news) => news.title), ['World Cup']);
  });

  test('news search provider handles query', () async {
    final container = ProviderContainer(
      overrides: [newsRepositoryProvider.overrideWithValue(_NewsRepository())],
    );
    addTearDown(container.dispose);

    container.read(newsSearchProvider.notifier).setQuery('cup');

    expect(container.read(newsSearchProvider).keyword, 'cup');
  });
}

class _NewsRepository implements NewsRepository {
  @override
  Future<Result<List<News>>> getLatestNews({
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  }) async {
    return Success([_news(1, 'World Cup')]);
  }

  @override
  Future<Result<List<News>>> searchNews({
    required String query,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  }) async {
    return Success([_news(2, query)]);
  }
}

News _news(int id, String title) {
  return News(
    id: id,
    title: title,
    description: 'Description',
    content: 'Content',
    sourceName: 'FIFA',
    sourceUrl: 'https://example.com/$id',
    publishedAt: DateTime.utc(2026, 1, id),
  );
}
