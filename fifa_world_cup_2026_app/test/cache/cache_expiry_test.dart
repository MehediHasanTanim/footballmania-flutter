import 'package:fifa_world_cup_2026_app/core/constants/hive_constants.dart';
import 'package:fifa_world_cup_2026_app/core/storage/cache_service.dart';
import 'package:fifa_world_cup_2026_app/core/storage/hive_adapters.dart';
import 'package:fifa_world_cup_2026_app/features/favorites/data/datasources/favorites_local_data_source.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/data/datasources/fixtures_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/hive_test.dart';

import '../helpers/test_data.dart';

void main() {
  setUp(() async {
    await setUpTestHive();
    HiveAdapters.registerAdapters();
    await Hive.openBox<dynamic>(HiveConstants.fixturesBox);
    await Hive.openBox<dynamic>(HiveConstants.favoritesBox);
  });

  tearDown(() async {
    await tearDownTestHive();
  });

  test('test_cache_expiry_marks_data_expired', () async {
    final expired = fakeFixtureDto(id: 1).toCachedModel(
      ttl: const Duration(milliseconds: -1),
    );
    await Hive.box<dynamic>(HiveConstants.fixturesBox).put('1', expired);

    const dataSource = FixturesLocalDataSource(CacheService());

    expect(dataSource.getFixtures(), isEmpty);
    expect(dataSource.getFixtures(includeExpired: true), hasLength(1));
  });

  test('test_cache_cleanup_removes_expired_entries', () async {
    final box = Hive.box<dynamic>(HiveConstants.fixturesBox);
    await box.put('1', fakeFixtureDto(id: 1).toCachedModel(ttl: const Duration(milliseconds: -1)));
    await box.put('2', fakeFixtureDto(id: 2).toCachedModel());

    for (final key in box.keys.toList()) {
      final value = box.get(key);
      if (value?.isExpired == true) await box.delete(key);
    }

    expect(box.keys, ['2']);
  });

  test('test_corrupted_cache_returns_empty_or_error_safely', () async {
    await Hive.box<dynamic>(HiveConstants.fixturesBox).put('broken', {'bad': 'shape'});

    const dataSource = FixturesLocalDataSource(CacheService());

    expect(dataSource.getFixtures(), isEmpty);
  });

  test('favorite add remove persists correctly', () async {
    const dataSource = FavoritesLocalDataSource(CacheService());
    final favorite = fakeFavorite();

    await dataSource.saveFavorite(favorite);
    expect(dataSource.getFavorites(), hasLength(1));

    await dataSource.removeFavorite(type: favorite.type, referenceId: favorite.referenceId);
    expect(dataSource.getFavorites(), isEmpty);
  });
}
