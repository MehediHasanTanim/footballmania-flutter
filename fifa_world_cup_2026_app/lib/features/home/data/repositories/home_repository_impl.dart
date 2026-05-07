import '../../../../core/errors/error_handler.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/home_summary.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_local_data_source.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl({
    required HomeRemoteDataSource remoteDataSource,
    required HomeLocalDataSource localDataSource,
    required NetworkInfo networkInfo,
    required ErrorHandler errorHandler,
  }) : _remoteDataSource = remoteDataSource,
       _localDataSource = localDataSource,
       _networkInfo = networkInfo,
       _errorHandler = errorHandler;

  final HomeRemoteDataSource _remoteDataSource;
  final HomeLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;
  final ErrorHandler _errorHandler;

  @override
  Future<Result<HomeSummary>> getHomeSummary({
    bool forceRefresh = false,
  }) async {
    final cached = _localDataSource.getHomeSummary();
    try {
      if (!forceRefresh && !await _networkInfo.isConnected) {
        return cached != null
            ? Success(cached.toEntity())
            : const FailureResult(
                Failure(message: 'No cached home summary available.'),
              );
      }
      final remote = await _remoteDataSource.getHomeSummary();
      await _localDataSource.cacheHomeSummary(remote);
      return Success(remote.toEntity());
    } catch (error, stackTrace) {
      if (cached != null) return Success(cached.toEntity());
      return FailureResult(
        _errorHandler.failureFromException(error, stackTrace),
      );
    }
  }
}
