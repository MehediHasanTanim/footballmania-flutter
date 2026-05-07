import '../../../../core/errors/error_handler.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/live_match.dart';
import '../../domain/entities/match_event.dart';
import '../../domain/repositories/live_score_repository.dart';
import '../datasources/live_score_local_data_source.dart';
import '../datasources/live_score_remote_data_source.dart';

class LiveScoreRepositoryImpl implements LiveScoreRepository {
  const LiveScoreRepositoryImpl({
    required LiveScoreRemoteDataSource remoteDataSource,
    required LiveScoreLocalDataSource localDataSource,
    required NetworkInfo networkInfo,
    required ErrorHandler errorHandler,
  }) : _remoteDataSource = remoteDataSource,
       _localDataSource = localDataSource,
       _networkInfo = networkInfo,
       _errorHandler = errorHandler;

  final LiveScoreRemoteDataSource _remoteDataSource;
  final LiveScoreLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;
  final ErrorHandler _errorHandler;

  @override
  Future<Result<List<LiveMatch>>> getLiveScores({
    bool forceRefresh = false,
  }) async {
    final cached = _localDataSource.getLiveScores();
    try {
      if (!forceRefresh && !await _networkInfo.isConnected) {
        return cached.isNotEmpty
            ? Success(
                cached.map((match) => match.toEntity()).toList(growable: false),
              )
            : const FailureResult(
                Failure(message: 'No cached live scores available.'),
              );
      }
      final remote = await _remoteDataSource.getLiveScores();
      await _localDataSource.cacheLiveScores(remote);
      return Success(
        remote.map((match) => match.toEntity()).toList(growable: false),
      );
    } catch (error, stackTrace) {
      if (cached.isNotEmpty) {
        return Success(
          cached.map((match) => match.toEntity()).toList(growable: false),
        );
      }
      return FailureResult(
        _errorHandler.failureFromException(error, stackTrace),
      );
    }
  }

  @override
  Future<Result<List<MatchEvent>>> getMatchEvents(
    int fixtureId, {
    bool forceRefresh = false,
  }) async {
    final scores = await getLiveScores(forceRefresh: forceRefresh);
    if (scores is FailureResult<List<LiveMatch>>) {
      return FailureResult(scores.failure);
    }
    final matches = (scores as Success<List<LiveMatch>>).data;
    final match = matches
        .where((item) => item.fixtureId == fixtureId)
        .firstOrNull;
    return Success(match?.events ?? const []);
  }
}
