import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_service.dart';
import '../models/group_standing_dto.dart';

class GroupsRemoteDataSource {
  const GroupsRemoteDataSource(this._apiService);

  final ApiService _apiService;

  Future<List<GroupStandingDto>> getGroups() {
    return _apiService.getList<GroupStandingDto>(
      ApiConstants.groups,
      fromJson: GroupStandingDto.fromJson,
    );
  }
}
