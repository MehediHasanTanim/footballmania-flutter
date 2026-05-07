import '../../../../core/utils/result.dart';
import '../entities/news.dart';
import '../entities/news_filter.dart';
import '../repositories/news_repository.dart';

class SearchNews {
  const SearchNews(this._repository);

  final NewsRepository _repository;

  Future<Result<List<News>>> call({
    required String query,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  }) {
    return _repository.searchNews(
      query: query,
      page: page,
      pageSize: pageSize,
      forceRefresh: forceRefresh,
    );
  }

  List<News> filterLocal(List<News> news, NewsFilter filter) {
    final keyword = filter.searchQuery?.trim().toLowerCase();
    final source = filter.source?.trim().toLowerCase();
    return news
        .where((item) {
          if (source != null &&
              source.isNotEmpty &&
              !item.sourceName.toLowerCase().contains(source)) {
            return false;
          }
          if (filter.dateRange != null && item.publishedAt != null) {
            if (!filter.dateRange!.contains(item.publishedAt!)) return false;
          }
          if (keyword == null || keyword.isEmpty) return true;
          final published = item.publishedAt
              ?.toLocal()
              .toString()
              .split(' ')
              .first;
          return item.title.toLowerCase().contains(keyword) ||
              item.description.toLowerCase().contains(keyword) ||
              item.content.toLowerCase().contains(keyword) ||
              item.sourceName.toLowerCase().contains(keyword) ||
              (published?.contains(keyword) ?? false);
        })
        .toList(growable: false);
  }
}
