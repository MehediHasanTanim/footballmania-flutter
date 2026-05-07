import '../../../../core/utils/result.dart';
import '../entities/home_summary.dart';
import '../repositories/home_repository.dart';

class GetHomeSummary {
  const GetHomeSummary(this._repository);

  final HomeRepository _repository;

  Future<Result<HomeSummary>> call({bool forceRefresh = false}) {
    return _repository.getHomeSummary(forceRefresh: forceRefresh);
  }
}
