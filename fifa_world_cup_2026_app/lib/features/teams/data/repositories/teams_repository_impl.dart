import '../../../../core/errors/error_handler.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/team.dart';
import '../../domain/repositories/teams_repository.dart';
import '../datasources/teams_local_data_source.dart';
import '../datasources/teams_remote_data_source.dart';

class TeamsRepositoryImpl implements TeamsRepository {
  const TeamsRepositoryImpl({required TeamsRemoteDataSource remoteDataSource, required TeamsLocalDataSource localDataSource, required NetworkInfo networkInfo, required ErrorHandler errorHandler})
    : _remoteDataSource = remoteDataSource,
      _localDataSource = localDataSource,
      _networkInfo = networkInfo,
      _errorHandler = errorHandler;

  final TeamsRemoteDataSource _remoteDataSource;
  final TeamsLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;
  final ErrorHandler _errorHandler;

  @override
  Future<Result<List<Team>>> getTeams({bool forceRefresh = false}) async {
    final cached = _localDataSource.getTeams();
    try {
      if (!forceRefresh && !await _networkInfo.isConnected) {
        return cached.isNotEmpty ? Success(cached.map((team) => team.toEntity()).toList(growable: false)) : const FailureResult(Failure(message: 'No cached teams available.'));
      }
      final remote = await _remoteDataSource.getTeams();
      await _localDataSource.cacheTeams(remote);
      return Success(remote.map((team) => team.toEntity()).toList(growable: false));
    } catch (error, stackTrace) {
      if (cached.isNotEmpty) return Success(cached.map((team) => team.toEntity()).toList(growable: false));
      return FailureResult(_errorHandler.failureFromException(error, stackTrace));
    }
  }

  @override
  Future<Result<Team>> getTeamById(int teamId, {bool forceRefresh = false}) async {
    final cached = _localDataSource.getTeamById(teamId);
    try {
      if (!forceRefresh && !await _networkInfo.isConnected) {
        return cached != null ? Success(cached.toEntity()) : const FailureResult(Failure(message: 'No cached team available.'));
      }
      final remote = await _remoteDataSource.getTeamById(teamId);
      await _localDataSource.cacheTeam(remote);
      return Success(remote.toEntity());
    } catch (error, stackTrace) {
      if (cached != null) return Success(cached.toEntity());
      return FailureResult(_errorHandler.failureFromException(error, stackTrace));
    }
  }
}
