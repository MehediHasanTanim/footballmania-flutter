import '../entities/recent_search.dart';
import '../repositories/recent_search_repository.dart';

class AddRecentSearch {
  const AddRecentSearch(this._repository);

  final RecentSearchRepository _repository;

  Future<void> call({required SearchType type, required String query}) {
    return _repository.addRecentSearch(
      RecentSearch(query: query, type: type, timestamp: DateTime.now()),
    );
  }
}
