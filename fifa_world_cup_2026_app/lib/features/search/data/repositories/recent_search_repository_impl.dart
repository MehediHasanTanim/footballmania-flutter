import '../../domain/entities/recent_search.dart';
import '../../domain/repositories/recent_search_repository.dart';
import '../datasources/recent_search_local_data_source.dart';

class RecentSearchRepositoryImpl implements RecentSearchRepository {
  const RecentSearchRepositoryImpl(this._localDataSource);

  final RecentSearchLocalDataSource _localDataSource;

  @override
  Future<void> addRecentSearch(RecentSearch search) {
    return _localDataSource.addRecentSearch(search);
  }

  @override
  List<RecentSearch> getRecentSearches(SearchType type) {
    return _localDataSource
        .getRecentSearches(type)
        .map((item) => item.toEntity())
        .toList(growable: false);
  }

  @override
  Future<void> removeRecentSearch(SearchType type, String query) {
    return _localDataSource.removeRecentSearch(type, query);
  }

  @override
  Future<void> clearRecentSearches(SearchType type) {
    return _localDataSource.clearRecentSearches(type);
  }
}
