import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_service.dart';
import '../models/live_match_dto.dart';

class LiveScoreRemoteDataSource {
  const LiveScoreRemoteDataSource(this._apiService);

  final ApiService _apiService;

  Future<List<LiveMatchDto>> getLiveScores() {
    return _apiService.getList<LiveMatchDto>(
      ApiConstants.liveScores,
      fromJson: LiveMatchDto.fromJson,
    );
  }
}
