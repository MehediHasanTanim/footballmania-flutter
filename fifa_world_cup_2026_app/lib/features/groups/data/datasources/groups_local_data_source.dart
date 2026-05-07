import '../../../../core/constants/hive_constants.dart';
import '../../../../core/storage/cache_service.dart';
import '../models/group_standing_dto.dart';

class GroupsLocalDataSource {
  const GroupsLocalDataSource(this._cacheService);

  static const _itemsKey = 'groups';
  static const _expiresAtKey = 'groups_expires_at';

  final CacheService _cacheService;

  Future<void> cacheGroups(List<GroupStandingDto> groups, {Duration ttl = const Duration(hours: 6)}) async {
    await _cacheService.put<List<Map<String, dynamic>>>(
      HiveConstants.groupsBox,
      _itemsKey,
      groups.map((group) => group.toJson()).toList(growable: false),
    );
    await _cacheService.put<String>(
      HiveConstants.groupsBox,
      _expiresAtKey,
      DateTime.now().toUtc().add(ttl).toIso8601String(),
    );
  }

  List<GroupStandingDto> getGroups() {
    if (_isExpired()) return const [];
    final cached = _cacheService.get<Object>(HiveConstants.groupsBox, _itemsKey);
    if (cached is! List) return const [];
    return cached
        .whereType<Map>()
        .map((item) => GroupStandingDto.fromJson(Map<String, dynamic>.from(item)))
        .toList(growable: false);
  }

  bool _isExpired() {
    final expiresAt = _cacheService.get<String>(HiveConstants.groupsBox, _expiresAtKey);
    if (expiresAt == null) return true;
    final parsed = DateTime.tryParse(expiresAt);
    return parsed == null || DateTime.now().toUtc().isAfter(parsed);
  }
}
