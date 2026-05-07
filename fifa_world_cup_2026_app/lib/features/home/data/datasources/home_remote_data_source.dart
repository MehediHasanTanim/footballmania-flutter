import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_service.dart';
import '../models/home_summary_dto.dart';

class HomeRemoteDataSource {
  const HomeRemoteDataSource(this._apiService);

  final ApiService _apiService;

  Future<HomeSummaryDto> getHomeSummary() {
    return _apiService.getObject<HomeSummaryDto>(
      ApiConstants.home,
      fromJson: HomeSummaryDto.fromJson,
    );
  }
}
