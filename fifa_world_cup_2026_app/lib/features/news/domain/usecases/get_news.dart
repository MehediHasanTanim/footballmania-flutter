import '../../../../core/utils/result.dart';
import '../entities/news.dart';
import '../repositories/news_repository.dart';

class GetNews {
  const GetNews(this._repository);

  final NewsRepository _repository;

  Future<Result<List<News>>> call({
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  }) {
    return _repository.getLatestNews(
      page: page,
      pageSize: pageSize,
      forceRefresh: forceRefresh,
    );
  }
}
