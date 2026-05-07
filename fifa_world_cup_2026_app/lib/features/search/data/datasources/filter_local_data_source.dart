import '../../../../core/constants/hive_constants.dart';
import '../../../../core/storage/cache_service.dart';
import '../models/persisted_filter_model.dart';

class FilterLocalDataSource {
  const FilterLocalDataSource(this._cacheService);

  final CacheService _cacheService;

  Future<void> saveFilter(String key, Map<String, dynamic> values) {
    return _cacheService.put<PersistedFilterModel>(
      HiveConstants.persistedFiltersBox,
      key,
      PersistedFilterModel(key: key, values: values),
    );
  }

  Map<String, dynamic>? getSavedFilter(String key) {
    return _cacheService
        .get<PersistedFilterModel>(HiveConstants.persistedFiltersBox, key)
        ?.values;
  }

  Future<void> clearSavedFilter(String key) {
    final entries = _cacheService
        .values<PersistedFilterModel>(HiveConstants.persistedFiltersBox)
        .where((item) => item.key != key)
        .toList(growable: false);
    return _cacheService.clear(HiveConstants.persistedFiltersBox).then((_) {
      return _cacheService.putAll<PersistedFilterModel>(
        HiveConstants.persistedFiltersBox,
        {for (final item in entries) item.key: item},
      );
    });
  }
}
