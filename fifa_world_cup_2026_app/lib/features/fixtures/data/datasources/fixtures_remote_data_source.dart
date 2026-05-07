import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_service.dart';
import '../models/fixture_dto.dart';

class FixturesRemoteDataSource {
  const FixturesRemoteDataSource(this._apiService);

  final ApiService _apiService;

  Future<List<FixtureDto>> getFixtures({
    String? date,
    int? teamId,
    String? group,
    String? stage,
  }) {
    return _apiService.getList<FixtureDto>(
      ApiConstants.fixtures,
      queryParameters: {
        'date': date,
        'team_id': teamId,
        'group': group,
        'stage': stage,
      },
      fromJson: FixtureDto.fromJson,
    );
  }

  Future<FixtureDto> getFixtureById(int fixtureId) {
    return _apiService.getObject<FixtureDto>(
      '${ApiConstants.fixtures}/$fixtureId',
      fromJson: FixtureDto.fromJson,
    );
  }
}
