import '../../../../core/errors/error_handler.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/news.dart';
import '../../domain/repositories/news_repository.dart';
import '../datasources/news_local_data_source.dart';
import '../datasources/news_remote_data_source.dart';

class NewsRepositoryImpl implements NewsRepository {
  const NewsRepositoryImpl({required NewsRemoteDataSource remoteDataSource, required NewsLocalDataSource localDataSource, required NetworkInfo networkInfo, required ErrorHandler errorHandler})
    : _remoteDataSource = remoteDataSource,
      _localDataSource = localDataSource,
      _networkInfo = networkInfo,
      _errorHandler = errorHandler;

  final NewsRemoteDataSource _remoteDataSource;
  final NewsLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;
  final ErrorHandler _errorHandler;

  @override
  Future<Result<List<News>>> getLatestNews({int page = 1, int pageSize = 20, bool forceRefresh = false}) async {
    final cached = _localDataSource.getLatestNews(page: page, pageSize: pageSize);
    try {
      if (!forceRefresh && !await _networkInfo.isConnected) {
        return cached.isNotEmpty ? Success(cached.map((news) => news.toEntity()).toList(growable: false)) : const FailureResult(Failure(message: 'No cached news available.'));
      }
      final remote = await _remoteDataSource.getLatestNews(page: page, pageSize: pageSize);
      await _localDataSource.cacheNews(remote);
      return Success(remote.map((news) => news.toEntity()).toList(growable: false));
    } catch (error, stackTrace) {
      if (cached.isNotEmpty) return Success(cached.map((news) => news.toEntity()).toList(growable: false));
      return FailureResult(_errorHandler.failureFromException(error, stackTrace));
    }
  }

  @override
  Future<Result<List<News>>> searchNews({required String query, int page = 1, int pageSize = 20, bool forceRefresh = false}) async {
    final cached = _localDataSource.searchNews(query: query, page: page, pageSize: pageSize);
    try {
      if (!forceRefresh && !await _networkInfo.isConnected) {
        return cached.isNotEmpty ? Success(cached.map((news) => news.toEntity()).toList(growable: false)) : const FailureResult(Failure(message: 'No cached news available.'));
      }
      final remote = await _remoteDataSource.searchNews(query: query, page: page, pageSize: pageSize);
      return Success(remote.map((news) => news.toEntity()).toList(growable: false));
    } catch (error, stackTrace) {
      if (cached.isNotEmpty) return Success(cached.map((news) => news.toEntity()).toList(growable: false));
      return FailureResult(_errorHandler.failureFromException(error, stackTrace));
    }
  }
}
