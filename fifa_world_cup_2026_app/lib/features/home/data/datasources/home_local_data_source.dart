import '../../../../core/constants/hive_constants.dart';
import '../../../../core/storage/cache_service.dart';
import '../models/home_summary_dto.dart';

class HomeLocalDataSource {
  const HomeLocalDataSource(this._cacheService);

  static const _summaryKey = 'home_summary';
  static const _expiresAtKey = 'home_summary_expires_at';

  final CacheService _cacheService;

  Future<void> cacheHomeSummary(HomeSummaryDto summary, {Duration ttl = const Duration(minutes: 15)}) async {
    await _cacheService.put<Map<String, dynamic>>(
      HiveConstants.homeBox,
      _summaryKey,
      summary.toJson(),
    );
    await _cacheService.put<String>(
      HiveConstants.homeBox,
      _expiresAtKey,
      DateTime.now().toUtc().add(ttl).toIso8601String(),
    );
  }

  HomeSummaryDto? getHomeSummary() {
    if (_isExpired()) return null;
    final cached = _cacheService.get<Object>(HiveConstants.homeBox, _summaryKey);
    if (cached is! Map) return null;
    return HomeSummaryDto.fromJson(Map<String, dynamic>.from(cached));
  }

  bool _isExpired() {
    final expiresAt = _cacheService.get<String>(HiveConstants.homeBox, _expiresAtKey);
    if (expiresAt == null) return true;
    final parsed = DateTime.tryParse(expiresAt);
    return parsed == null || DateTime.now().toUtc().isAfter(parsed);
  }
}
