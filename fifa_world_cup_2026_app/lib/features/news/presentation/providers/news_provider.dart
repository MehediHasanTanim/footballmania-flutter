import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/domain/value_objects/news_filter.dart';
import '../../../../core/utils/result.dart';
import '../../../../shared/providers/usecase_providers.dart';
import '../../domain/entities/news.dart';

final newsSearchProvider =
    StateNotifierProvider<NewsSearchNotifier, NewsFilter>(
      (ref) => NewsSearchNotifier(),
    );

final newsProvider = AutoDisposeAsyncNotifierProvider<NewsNotifier, List<News>>(
  NewsNotifier.new,
);

final searchedNewsProvider = Provider<AsyncValue<List<News>>>((ref) {
  final filter = ref.watch(newsSearchProvider);
  final searchNews = ref.watch(searchNewsUseCaseProvider);
  return ref
      .watch(newsProvider)
      .whenData((items) => searchNews.filterLocal(items, filter));
});

final latestNewsProvider = Provider<AsyncValue<List<News>>>((ref) {
  return ref.watch(newsProvider).whenData((items) {
    final sorted = ref.read(sortNewsByPublishedDateUseCaseProvider)(items);
    return sorted.take(5).toList(growable: false);
  });
});

class NewsNotifier extends AutoDisposeAsyncNotifier<List<News>> {
  @override
  Future<List<News>> build() => _load();

  Future<void> refresh() => _setState(forceRefresh: false);

  Future<void> forceRefresh() => _setState(forceRefresh: true);

  Future<void> reload() => refresh();

  Future<void> search(String query, {bool forceRefresh = false}) async {
    ref.read(newsSearchProvider.notifier).setQuery(query);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _load(query: query, forceRefresh: forceRefresh),
    );
  }

  Future<void> _setState({required bool forceRefresh}) async {
    final query = ref.read(newsSearchProvider).keyword;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _load(query: query, forceRefresh: forceRefresh),
    );
  }

  Future<List<News>> _load({String? query, bool forceRefresh = false}) async {
    final normalizedQuery = query?.trim();
    final result = normalizedQuery == null || normalizedQuery.isEmpty
        ? await ref.read(getNewsUseCaseProvider)(forceRefresh: forceRefresh)
        : await ref.read(searchNewsUseCaseProvider)(
            query: normalizedQuery,
            forceRefresh: forceRefresh,
          );

    return switch (result) {
      Success<List<News>>(:final data) => ref.read(
        sortNewsByPublishedDateUseCaseProvider,
      )(data),
      FailureResult<List<News>>(:final failure) => throw failure,
    };
  }
}

class NewsSearchNotifier extends StateNotifier<NewsFilter> {
  NewsSearchNotifier() : super(const NewsFilter());

  void setQuery(String query) {
    state = NewsFilter(
      keyword: query,
      requireSourceUrl: state.requireSourceUrl,
      requireTitle: state.requireTitle,
    );
  }

  void update({String? keyword, bool? requireSourceUrl, bool? requireTitle}) {
    state = NewsFilter(
      keyword: keyword ?? state.keyword,
      requireSourceUrl: requireSourceUrl ?? state.requireSourceUrl,
      requireTitle: requireTitle ?? state.requireTitle,
    );
  }

  void clear() => state = const NewsFilter();
}
