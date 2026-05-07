import '../../../../core/errors/error_handler.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/group_standing.dart';
import '../../domain/repositories/groups_repository.dart';
import '../datasources/groups_local_data_source.dart';
import '../datasources/groups_remote_data_source.dart';

class GroupsRepositoryImpl implements GroupsRepository {
  const GroupsRepositoryImpl({required GroupsRemoteDataSource remoteDataSource, required GroupsLocalDataSource localDataSource, required NetworkInfo networkInfo, required ErrorHandler errorHandler})
    : _remoteDataSource = remoteDataSource,
      _localDataSource = localDataSource,
      _networkInfo = networkInfo,
      _errorHandler = errorHandler;

  final GroupsRemoteDataSource _remoteDataSource;
  final GroupsLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;
  final ErrorHandler _errorHandler;

  @override
  Future<Result<List<GroupStanding>>> getGroups({bool forceRefresh = false}) async {
    final cached = _localDataSource.getGroups();
    try {
      if (!forceRefresh && !await _networkInfo.isConnected) {
        return cached.isNotEmpty ? Success(cached.map((group) => group.toEntity()).toList(growable: false)) : const FailureResult(Failure(message: 'No cached groups available.'));
      }
      final remote = await _remoteDataSource.getGroups();
      await _localDataSource.cacheGroups(remote);
      return Success(remote.map((group) => group.toEntity()).toList(growable: false));
    } catch (error, stackTrace) {
      if (cached.isNotEmpty) return Success(cached.map((group) => group.toEntity()).toList(growable: false));
      return FailureResult(_errorHandler.failureFromException(error, stackTrace));
    }
  }
}
