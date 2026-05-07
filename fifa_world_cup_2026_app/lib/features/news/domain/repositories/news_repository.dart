import '../../../../core/utils/result.dart';
import '../entities/news.dart';

abstract class NewsRepository {
  Future<Result<List<News>>> getLatestNews({
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  });

  Future<Result<List<News>>> searchNews({
    required String query,
    int page = 1,
    int pageSize = 20,
    bool forceRefresh = false,
  });
}
