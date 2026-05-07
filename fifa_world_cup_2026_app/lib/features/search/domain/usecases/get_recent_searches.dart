import '../entities/recent_search.dart';
import '../repositories/recent_search_repository.dart';

class GetRecentSearches {
  const GetRecentSearches(this._repository);

  final RecentSearchRepository _repository;

  List<RecentSearch> call(SearchType type) =>
      _repository.getRecentSearches(type);
}
