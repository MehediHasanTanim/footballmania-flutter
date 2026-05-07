import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_service.dart';
import '../models/team_dto.dart';

class TeamsRemoteDataSource {
  const TeamsRemoteDataSource(this._apiService);

  final ApiService _apiService;

  Future<List<TeamDto>> getTeams() {
    return _apiService.getList<TeamDto>(
      ApiConstants.teams,
      fromJson: TeamDto.fromJson,
    );
  }

  Future<TeamDto> getTeamById(int teamId) {
    return _apiService.getObject<TeamDto>(
      '${ApiConstants.teams}/$teamId',
      fromJson: TeamDto.fromJson,
    );
  }
}
