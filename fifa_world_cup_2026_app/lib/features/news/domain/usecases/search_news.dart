import '../../../../core/domain/value_objects/news_filter.dart';
import '../../../../core/utils/result.dart';
import '../entities/news.dart';
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
    final keyword = filter.keyword?.trim().toLowerCase();
    return news
        .where((item) {
          if (filter.requireTitle && !item.hasTitle) return false;
          if (filter.requireSourceUrl && !item.hasSourceUrl) return false;
          if (keyword == null || keyword.isEmpty) return true;
          return item.title.toLowerCase().contains(keyword) ||
              item.description.toLowerCase().contains(keyword) ||
              item.content.toLowerCase().contains(keyword);
        })
        .toList(growable: false);
  }
}
