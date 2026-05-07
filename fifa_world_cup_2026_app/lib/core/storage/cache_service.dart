import 'package:hive/hive.dart';

import '../constants/hive_constants.dart';
import '../errors/app_exception.dart';

class CacheService {
  const CacheService();

  Future<void> put<T>(String boxName, String key, T value) async {
    try {
      await _box(boxName).put(key, value);
    } catch (error) {
      throw CacheException(message: 'Unable to write cache', details: error);
    }
  }

  T? get<T>(String boxName, String key) {
    try {
      final value = _box(boxName).get(key);
      return value is T ? value : null;
    } catch (error) {
      throw CacheException(message: 'Unable to read cache', details: error);
    }
  }

  Future<void> putAll<T>(String boxName, Map<String, T> entries) async {
    try {
      await _box(boxName).putAll(entries);
    } catch (error) {
      throw CacheException(message: 'Unable to write cache', details: error);
    }
  }

  List<T> values<T>(String boxName) {
    try {
      return _box(boxName).values.whereType<T>().toList(growable: false);
    } catch (error) {
      throw CacheException(message: 'Unable to read cache', details: error);
    }
  }

  Future<void> clear(String boxName) async {
    try {
      await _box(boxName).clear();
    } catch (error) {
      throw CacheException(message: 'Unable to clear cache', details: error);
    }
  }

  Box<dynamic> _box(String boxName) {
    if (!HiveConstants.allBoxes.contains(boxName)) {
      throw CacheException(message: 'Unknown cache box: $boxName');
    }
    return Hive.box<dynamic>(boxName);
  }
}
