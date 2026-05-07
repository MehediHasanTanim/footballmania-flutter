import '../../../../core/constants/hive_constants.dart';
import '../../../../core/storage/cache_service.dart';
import '../models/live_match_dto.dart';

class LiveScoreLocalDataSource {
  const LiveScoreLocalDataSource(this._cacheService);

  static const _itemsKey = 'live_scores';
  static const _expiresAtKey = 'live_scores_expires_at';

  final CacheService _cacheService;

  Future<void> cacheLiveScores(
    List<LiveMatchDto> matches, {
    Duration ttl = const Duration(minutes: 2),
  }) async {
    await _cacheService.put<List<Map<String, dynamic>>>(
      HiveConstants.liveScoresBox,
      _itemsKey,
      matches.map((match) => match.toJson()).toList(growable: false),
    );
    await _cacheService.put<String>(
      HiveConstants.liveScoresBox,
      _expiresAtKey,
      DateTime.now().toUtc().add(ttl).toIso8601String(),
    );
  }

  List<LiveMatchDto> getLiveScores() {
    if (_isExpired()) return const [];
    final cached = _cacheService.get<Object>(
      HiveConstants.liveScoresBox,
      _itemsKey,
    );
    if (cached is! List) return const [];
    return cached
        .whereType<Map>()
        .map((item) => LiveMatchDto.fromJson(Map<String, dynamic>.from(item)))
        .toList(growable: false);
  }

  bool _isExpired() {
    final expiresAt = _cacheService.get<String>(
      HiveConstants.liveScoresBox,
      _expiresAtKey,
    );
    if (expiresAt == null) return true;
    final parsed = DateTime.tryParse(expiresAt);
    return parsed == null || DateTime.now().toUtc().isAfter(parsed);
  }
}
