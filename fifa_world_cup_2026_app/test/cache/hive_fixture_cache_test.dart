import 'package:fifa_world_cup_2026_app/core/constants/hive_constants.dart';
import 'package:fifa_world_cup_2026_app/core/storage/cache_service.dart';
import 'package:fifa_world_cup_2026_app/core/storage/hive_adapters.dart';
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
  });

  tearDown(() async {
    await tearDownTestHive();
  });

  test('test_hive_writes_and_reads_fixtures', () async {
    const cacheService = CacheService();
    const dataSource = FixturesLocalDataSource(cacheService);

    await dataSource.cacheFixtures([fakeFixtureDto(id: 1), fakeFixtureDto(id: 2)]);
    final result = dataSource.getFixtures();

    expect(result.map((fixture) => fixture.id), [1, 2]);
  });

  test('fixture cache filters by team and date', () async {
    const dataSource = FixturesLocalDataSource(CacheService());

    await dataSource.cacheFixtures([fakeFixtureDto(id: 1), fakeFixtureDto(id: 2)]);
    final result = dataSource.getFixtures(teamId: 10, date: '2026-06-11');

    expect(result.map((fixture) => fixture.id), [1]);
  });
}
