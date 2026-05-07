import '../entities/recent_search.dart';
import '../repositories/recent_search_repository.dart';

class ClearRecentSearches {
  const ClearRecentSearches(this._repository);

  final RecentSearchRepository _repository;

  Future<void> call(SearchType type) => _repository.clearRecentSearches(type);
}
