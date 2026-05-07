import '../../../../core/constants/hive_constants.dart';
import '../../../../core/storage/cache_service.dart';
import '../models/cached_news.dart';
import '../models/news_dto.dart';

class NewsLocalDataSource {
  const NewsLocalDataSource(this._cacheService);

  final CacheService _cacheService;

  Future<void> cacheNews(List<NewsDto> news) async {
    await _cacheService.clear(HiveConstants.newsBox);
    await _cacheService.putAll<CachedNews>(HiveConstants.newsBox, {
      for (final item in news) (item.id ?? 0).toString(): item.toCachedModel(),
    });
  }

  List<NewsDto> getLatestNews({int page = 1, int pageSize = 20}) {
    final offset = (page - 1) * pageSize;
    final items =
        _cacheService
            .values<CachedNews>(HiveConstants.newsBox)
            .where((news) => !news.isExpired)
            .map(NewsDto.fromCachedModel)
            .toList(growable: false)
          ..sort(
            (a, b) => (b.publishedAt ?? DateTime(0)).compareTo(
              a.publishedAt ?? DateTime(0),
            ),
          );
    if (offset >= items.length) return const [];
    return items.skip(offset).take(pageSize).toList(growable: false);
  }

  List<NewsDto> searchNews({
    required String query,
    int page = 1,
    int pageSize = 20,
  }) {
    final normalizedQuery = query.toLowerCase();
    final offset = (page - 1) * pageSize;
    final items = _cacheService
        .values<CachedNews>(HiveConstants.newsBox)
        .where((news) => !news.isExpired)
        .map(NewsDto.fromCachedModel)
        .where(
          (news) =>
              news.title?.toLowerCase().contains(normalizedQuery) == true ||
              news.description?.toLowerCase().contains(normalizedQuery) ==
                  true ||
              news.content?.toLowerCase().contains(normalizedQuery) == true,
        )
        .toList(growable: false);
    if (offset >= items.length) return const [];
    return items.skip(offset).take(pageSize).toList(growable: false);
  }
}
