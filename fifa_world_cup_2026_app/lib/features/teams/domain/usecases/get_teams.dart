import '../../../../core/utils/result.dart';
import '../entities/team.dart';
import '../repositories/teams_repository.dart';

class GetTeams {
  const GetTeams(this._repository);

  final TeamsRepository _repository;

  Future<Result<List<Team>>> call({bool forceRefresh = false}) {
    return _repository.getTeams(forceRefresh: forceRefresh);
  }
}
