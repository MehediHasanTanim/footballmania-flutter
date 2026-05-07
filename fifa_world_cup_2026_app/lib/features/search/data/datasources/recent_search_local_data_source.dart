import '../../../../core/constants/hive_constants.dart';
import '../../../../core/storage/cache_service.dart';
import '../../domain/entities/recent_search.dart';
import '../models/recent_search_model.dart';

class RecentSearchLocalDataSource {
  const RecentSearchLocalDataSource(this._cacheService);

  final CacheService _cacheService;

  List<RecentSearchModel> getRecentSearches(SearchType type) {
    return _cacheService
        .values<RecentSearchModel>(HiveConstants.recentSearchesBox)
        .where((item) => item.type == type.name)
        .toList(growable: false)
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
  }

  Future<void> addRecentSearch(RecentSearch search) async {
    final query = search.query.trim();
    if (query.isEmpty) return;
    final normalizedKey = _key(search.type, query);
    final existing = getRecentSearches(search.type)
        .where(
          (item) =>
              _key(SearchType.fromName(item.type), item.query) != normalizedKey,
        )
        .toList(growable: false);
    final next = [
      RecentSearchModel.fromEntity(
        RecentSearch(
          query: query,
          type: search.type,
          timestamp: search.timestamp,
        ),
      ),
      ...existing,
    ].take(10).toList(growable: false);
    await _replaceType(search.type, next);
  }

  Future<void> removeRecentSearch(SearchType type, String query) async {
    final normalizedKey = _key(type, query);
    final next = getRecentSearches(type)
        .where((item) => _key(type, item.query) != normalizedKey)
        .toList(growable: false);
    await _replaceType(type, next);
  }

  Future<void> clearRecentSearches(SearchType type) =>
      _replaceType(type, const []);

  Future<void> _replaceType(
    SearchType type,
    List<RecentSearchModel> items,
  ) async {
    final otherTypes = _cacheService
        .values<RecentSearchModel>(HiveConstants.recentSearchesBox)
        .where((item) => item.type != type.name)
        .toList(growable: false);
    await _cacheService.clear(HiveConstants.recentSearchesBox);
    await _cacheService.putAll<RecentSearchModel>(
      HiveConstants.recentSearchesBox,
      {
        for (final item in [...otherTypes, ...items])
          _key(SearchType.fromName(item.type), item.query): item,
      },
    );
  }

  String _key(SearchType type, String query) =>
      '${type.name}:${query.trim().toLowerCase()}';
}
