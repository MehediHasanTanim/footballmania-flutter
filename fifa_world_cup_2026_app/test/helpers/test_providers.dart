import 'package:fifa_world_cup_2026_app/core/domain/enums/favorite_type.dart';
import 'package:fifa_world_cup_2026_app/core/errors/failure.dart';
import 'package:fifa_world_cup_2026_app/core/utils/result.dart';
import 'package:fifa_world_cup_2026_app/features/countdown/domain/entities/countdown.dart';
import 'package:fifa_world_cup_2026_app/features/countdown/domain/repositories/countdown_repository.dart';
import 'package:fifa_world_cup_2026_app/features/favorites/domain/entities/favorite_item.dart';
import 'package:fifa_world_cup_2026_app/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/domain/entities/fixture.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/domain/repositories/fixtures_repository.dart';
import 'package:fifa_world_cup_2026_app/features/home/domain/entities/home_summary.dart';
import 'package:fifa_world_cup_2026_app/features/home/domain/repositories/home_repository.dart';
import 'package:fifa_world_cup_2026_app/features/news/domain/entities/news.dart';
import 'package:fifa_world_cup_2026_app/features/news/domain/repositories/news_repository.dart';
import 'package:fifa_world_cup_2026_app/features/search/domain/entities/recent_search.dart';
import 'package:fifa_world_cup_2026_app/features/search/domain/repositories/recent_search_repository.dart';
import 'package:fifa_world_cup_2026_app/shared/providers/repository_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'test_data.dart';

List<Override> testRepositoryOverrides({
  FixturesRepository? fixturesRepository,
  NewsRepository? newsRepository,
  FavoritesRepository? favoritesRepository,
  HomeRepository? homeRepository,
  CountdownRepository? countdownRepository,
  RecentSearchRepository? recentSearchRepository,
}) {
  return [
    fixturesRepositoryProvider.overrideWithValue(
      fixturesRepository ?? FakeFixturesRepository(),
    ),
    newsRepositoryProvider.overrideWithValue(newsRepository ?? FakeNewsRepository()),
    favoritesRepositoryProvider.overrideWithValue(
      favoritesRepository ?? FakeFavoritesRepository(),
    ),
    homeRepositoryProvider.overrideWithValue(homeRepository ?? FakeHomeRepository()),
    countdownRepositoryProvider.overrideWithValue(
      countdownRepository ?? FakeCountdownRepository(),
    ),
    recentSearchRepositoryProvider.overrideWithValue(
      recentSearchRepository ?? FakeRecentSearchRepository(),
    ),
  ];
}

class FakeFixturesRepository implements FixturesRepository {
  FakeFixturesRepository({this.fixtures = const [], this.failure});

  final List<Fixture> fixtures;
  final Failure? failure;
  int calls = 0;

  @override
  Future<Result<List<Fixture>>> getFixtures({
    String? date,
    int? teamId,
    String? group,
    String? stage,
    bool forceRefresh = false,
  }) async {
    calls++;
    if (failure != null) return FailureResult(failure!);
    return Success(fixtures.isEmpty ? fakeFixtures : fixtures);
  }

  @override
  Future<Result<Fixture>> getFixtureById(
    int fixtureId, {
    bool forceRefresh = false,
  }) async {
    return Success((fixtures.isEmpty ? fakeFixtures : fixtures).first);
  }
}

class FakeNewsRepository implements NewsRepository {
  FakeNewsRepository({this.news = const [], this.failure});

  final List<News> news;
  final Failure? failure;
  int calls = 0;

  @override
  Future<Result<List<News>>> getLatestNews({
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  }) async {
    calls++;
    if (failure != null) return FailureResult(failure!);
    return Success(news.isEmpty ? fakeNewsList : news);
  }

  @override
  Future<Result<List<News>>> searchNews({
    required String query,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  }) async {
    calls++;
    if (failure != null) return FailureResult(failure!);
    final source = news.isEmpty ? fakeNewsList : news;
    return Success(
      source
          .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
          .toList(growable: false),
    );
  }
}

class FakeFavoritesRepository implements FavoritesRepository {
  FakeFavoritesRepository({List<FavoriteItem>? favorites, this.failure})
    : favorites = [...?favorites];

  final List<FavoriteItem> favorites;
  final Failure? failure;

  @override
  Future<Result<List<FavoriteItem>>> getFavorites() async {
    if (failure != null) return FailureResult(failure!);
    return Success(List.unmodifiable(favorites));
  }

  @override
  Future<Result<FavoriteItem>> addFavorite(FavoriteItem favorite) async {
    if (failure != null) return FailureResult(failure!);
    favorites.removeWhere((item) => item.identityKey == favorite.identityKey);
    favorites.add(favorite);
    return Success(favorite);
  }

  @override
  Future<Result<void>> removeFavorite({
    required FavoriteType type,
    required String referenceId,
  }) async {
    if (failure != null) return FailureResult(failure!);
    favorites.removeWhere(
      (item) => item.type == type && item.referenceId == referenceId,
    );
    return const Success(null);
  }

  @override
  Future<Result<bool>> isFavorite({
    required FavoriteType type,
    required String referenceId,
  }) async {
    if (failure != null) return FailureResult(failure!);
    return Success(
      favorites.any((item) => item.type == type && item.referenceId == referenceId),
    );
  }
}

class FakeHomeRepository implements HomeRepository {
  FakeHomeRepository({HomeSummary? summary, this.failure})
    : summary = summary ?? fakeHomeSummary();

  final HomeSummary summary;
  final Failure? failure;

  @override
  Future<Result<HomeSummary>> getHomeSummary({bool forceRefresh = false}) async {
    if (failure != null) return FailureResult(failure!);
    return Success(summary);
  }
}

class FakeCountdownRepository implements CountdownRepository {
  FakeCountdownRepository({Countdown? countdown, this.failure})
    : countdown = countdown ?? fakeCountdown();

  final Countdown countdown;
  final Failure? failure;

  @override
  Future<Result<Countdown>> getTournamentCountdown({DateTime? nowUtc}) async {
    if (failure != null) return FailureResult(failure!);
    return Success(countdown);
  }

  @override
  Future<Result<Countdown>> getMatchCountdown(
    DateTime kickoffUtc, {
    DateTime? nowUtc,
  }) async {
    if (failure != null) return FailureResult(failure!);
    return Success(countdown);
  }
}

class FakeRecentSearchRepository implements RecentSearchRepository {
  final Map<SearchType, List<RecentSearch>> _searches = {};

  @override
  Future<void> addRecentSearch(RecentSearch search) async {
    final list = _searches.putIfAbsent(search.type, () => []);
    list.removeWhere((item) => item.query == search.query);
    list.add(search);
  }

  @override
  List<RecentSearch> getRecentSearches(SearchType type) {
    return List.unmodifiable(_searches[type] ?? const []);
  }

  @override
  Future<void> removeRecentSearch(SearchType type, String query) async {
    _searches[type]?.removeWhere((item) => item.query == query);
  }

  @override
  Future<void> clearRecentSearches(SearchType type) async {
    _searches[type] = [];
  }
}
