import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_service.dart';
import '../models/news_dto.dart';

class NewsRemoteDataSource {
  const NewsRemoteDataSource(this._apiService);

  final ApiService _apiService;

  Future<List<NewsDto>> getLatestNews({int page = 1, int pageSize = 20}) {
    return _apiService.getList<NewsDto>(
      ApiConstants.news,
      queryParameters: {'page': page, 'page_size': pageSize},
      fromJson: NewsDto.fromJson,
    );
  }

  Future<List<NewsDto>> searchNews({
    required String query,
    int page = 1,
    int pageSize = 20,
  }) {
    return _apiService.getList<NewsDto>(
      ApiConstants.newsSearch,
      queryParameters: {'q': query, 'page': page, 'page_size': pageSize},
      fromJson: NewsDto.fromJson,
    );
  }
}
