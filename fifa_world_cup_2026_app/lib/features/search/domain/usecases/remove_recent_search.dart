import '../entities/recent_search.dart';
import '../repositories/recent_search_repository.dart';

class RemoveRecentSearch {
  const RemoveRecentSearch(this._repository);

  final RecentSearchRepository _repository;

  Future<void> call(SearchType type, String query) {
    return _repository.removeRecentSearch(type, query);
  }
}
