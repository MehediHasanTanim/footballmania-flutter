import '../../../../core/errors/error_handler.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/fixture.dart';
import '../../domain/repositories/fixtures_repository.dart';
import '../datasources/fixtures_local_data_source.dart';
import '../datasources/fixtures_remote_data_source.dart';

class FixturesRepositoryImpl implements FixturesRepository {
  const FixturesRepositoryImpl({
    required FixturesRemoteDataSource remoteDataSource,
    required FixturesLocalDataSource localDataSource,
    required NetworkInfo networkInfo,
    required ErrorHandler errorHandler,
  }) : _remoteDataSource = remoteDataSource,
       _localDataSource = localDataSource,
       _networkInfo = networkInfo,
       _errorHandler = errorHandler;

  final FixturesRemoteDataSource _remoteDataSource;
  final FixturesLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;
  final ErrorHandler _errorHandler;

  @override
  Future<Result<List<Fixture>>> getFixtures({
    String? date,
    int? teamId,
    String? group,
    String? stage,
    bool forceRefresh = false,
  }) async {
    final cached = _localDataSource.getFixtures(date: date, teamId: teamId, group: group, stage: stage);
    try {
      if (!forceRefresh && !await _networkInfo.isConnected) {
        return cached.isNotEmpty ? Success(_toEntities(cached)) : const FailureResult(Failure(message: 'No cached fixtures available.'));
      }
      final remote = await _remoteDataSource.getFixtures(date: date, teamId: teamId, group: group, stage: stage);
      await _localDataSource.cacheFixtures(remote);
      return Success(_toEntities(remote));
    } catch (error, stackTrace) {
      if (cached.isNotEmpty) return Success(_toEntities(cached));
      return FailureResult(_errorHandler.failureFromException(error, stackTrace));
    }
  }

  @override
  Future<Result<Fixture>> getFixtureById(int fixtureId, {bool forceRefresh = false}) async {
    final cached = _localDataSource.getFixtureById(fixtureId);
    try {
      if (!forceRefresh && !await _networkInfo.isConnected) {
        return cached != null ? Success(cached.toEntity()) : const FailureResult(Failure(message: 'No cached fixture available.'));
      }
      final remote = await _remoteDataSource.getFixtureById(fixtureId);
      await _localDataSource.cacheFixture(remote);
      return Success(remote.toEntity());
    } catch (error, stackTrace) {
      if (cached != null) return Success(cached.toEntity());
      return FailureResult(_errorHandler.failureFromException(error, stackTrace));
    }
  }

  List<Fixture> _toEntities(Iterable<dynamic> fixtures) {
    return fixtures.map((fixture) => fixture.toEntity() as Fixture).toList(growable: false);
  }
}
