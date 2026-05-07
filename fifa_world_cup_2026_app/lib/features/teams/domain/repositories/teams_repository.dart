import '../../../../core/utils/result.dart';
import '../entities/team.dart';

abstract class TeamsRepository {
  Future<Result<List<Team>>> getTeams({bool forceRefresh = false});

  Future<Result<Team>> getTeamById(int teamId, {bool forceRefresh = false});
}
