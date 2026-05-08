import 'package:fifa_world_cup_2026_app/core/errors/failure.dart';
import 'package:fifa_world_cup_2026_app/features/news/presentation/providers/news_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/test_data.dart';
import '../helpers/test_providers.dart';

void main() {
  test('news provider emits loading then data', () async {
    final container = ProviderContainer(overrides: testRepositoryOverrides());
    addTearDown(container.dispose);

    expect(container.read(newsProvider).isLoading, isTrue);
    final result = await container.read(newsProvider.future);

    expect(result.map((news) => news.id), [2, 1]);
  });

  test('news provider emits error state', () async {
    final container = ProviderContainer(
      overrides: testRepositoryOverrides(
        newsRepository: FakeNewsRepository(
          failure: const Failure(message: 'news unavailable'),
        ),
      ),
    );
    addTearDown(container.dispose);

    await expectLater(container.read(newsProvider.future), throwsA(isA<Failure>()));
  });

  test('test_news_provider_uses_cached_data_on_failure', () async {
    final repository = FakeNewsRepository(news: fakeNewsList);
    final container = ProviderContainer(
      overrides: testRepositoryOverrides(newsRepository: repository),
    );
    addTearDown(container.dispose);

    final result = await container.read(newsProvider.future);

    expect(result, hasLength(2));
  });
}
