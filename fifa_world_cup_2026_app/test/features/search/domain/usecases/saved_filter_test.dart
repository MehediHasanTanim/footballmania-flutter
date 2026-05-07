import 'dart:io';

import 'package:fifa_world_cup_2026_app/core/constants/hive_constants.dart';
import 'package:fifa_world_cup_2026_app/core/storage/cache_service.dart';
import 'package:fifa_world_cup_2026_app/core/storage/hive_adapters.dart';
import 'package:fifa_world_cup_2026_app/features/search/data/datasources/filter_local_data_source.dart';
import 'package:fifa_world_cup_2026_app/features/search/domain/usecases/clear_saved_filter.dart';
import 'package:fifa_world_cup_2026_app/features/search/domain/usecases/get_saved_filter.dart';
import 'package:fifa_world_cup_2026_app/features/search/domain/usecases/save_filter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

void main() {
  late Directory tempDir;
  late FilterLocalDataSource dataSource;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('saved_filter_test');
    Hive.init(tempDir.path);
    HiveAdapters.registerAdapters();
    await Hive.openBox<dynamic>(HiveConstants.persistedFiltersBox);
    dataSource = const FilterLocalDataSource(CacheService());
  });

  tearDown(() async {
    await Hive.close();
    await tempDir.delete(recursive: true);
  });

  test('saves loads and clears filters', () async {
    final save = SaveFilter(dataSource);
    final get = GetSavedFilter(dataSource);
    final clear = ClearSavedFilter(dataSource);

    await save('teams', {'searchQuery': 'usa', 'favoriteOnly': true});
    expect(get('teams'), {'searchQuery': 'usa', 'favoriteOnly': true});

    await clear('teams');
    expect(get('teams'), isNull);
  });
}
