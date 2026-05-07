import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/result.dart';
import '../../../../shared/providers/usecase_providers.dart';
import '../../domain/entities/news.dart';
import '../../domain/entities/news_filter.dart';

final newsSearchProvider =
    StateNotifierProvider<NewsSearchNotifier, NewsFilter>(
      (ref) => NewsSearchNotifier(ref)..loadSaved(),
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
    final query = ref.read(newsSearchProvider).searchQuery;
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
  NewsSearchNotifier(this._ref) : super(const NewsFilter());

  final Ref _ref;
  static const _filterKey = 'news';

  void loadSaved() {
    final saved = _tryGetSaved();
    if (saved == null) return;
    state = NewsFilter(
      searchQuery: saved['searchQuery'] as String?,
      source: saved['source'] as String?,
    );
  }

  void setQuery(String query) {
    state = NewsFilter(
      searchQuery: query,
      source: state.source,
      dateRange: state.dateRange,
    );
    _save();
  }

  void update({String? searchQuery, String? source}) {
    state = state.copyWith(searchQuery: searchQuery, source: source);
    _save();
  }

  void clear() {
    state = const NewsFilter();
    _tryClearSaved();
  }

  void _save() {
    try {
      unawaited(
        _ref
            .read(saveFilterUseCaseProvider)(_filterKey, {
              'searchQuery': state.searchQuery,
              'source': state.source,
              'dateRange': null,
            })
            .catchError((_) {}),
      );
    } catch (_) {}
  }

  Map<String, dynamic>? _tryGetSaved() {
    try {
      return _ref.read(getSavedFilterUseCaseProvider)(_filterKey);
    } catch (_) {
      return null;
    }
  }

  void _tryClearSaved() {
    try {
      unawaited(
        _ref
            .read(clearSavedFilterUseCaseProvider)(_filterKey)
            .catchError((_) {}),
      );
    } catch (_) {}
  }
}
