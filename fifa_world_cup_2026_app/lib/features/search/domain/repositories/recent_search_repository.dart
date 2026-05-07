import '../entities/recent_search.dart';

abstract class RecentSearchRepository {
  Future<void> addRecentSearch(RecentSearch search);

  List<RecentSearch> getRecentSearches(SearchType type);

  Future<void> removeRecentSearch(SearchType type, String query);

  Future<void> clearRecentSearches(SearchType type);
}
