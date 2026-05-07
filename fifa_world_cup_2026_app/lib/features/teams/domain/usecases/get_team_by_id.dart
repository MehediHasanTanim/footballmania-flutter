import '../../../../core/utils/result.dart';
import '../entities/team.dart';
import '../repositories/teams_repository.dart';

class GetTeamById {
  const GetTeamById(this._repository);

  final TeamsRepository _repository;

  Future<Result<Team>> call(int teamId, {bool forceRefresh = false}) {
    return _repository.getTeamById(teamId, forceRefresh: forceRefresh);
  }
}
