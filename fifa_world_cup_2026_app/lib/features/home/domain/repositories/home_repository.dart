import '../../../../core/utils/result.dart';
import '../entities/home_summary.dart';

abstract class HomeRepository {
  Future<Result<HomeSummary>> getHomeSummary({bool forceRefresh = false});
}
