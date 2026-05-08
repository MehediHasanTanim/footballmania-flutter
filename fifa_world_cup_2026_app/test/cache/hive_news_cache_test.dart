import 'package:fifa_world_cup_2026_app/core/constants/hive_constants.dart';
import 'package:fifa_world_cup_2026_app/core/storage/cache_service.dart';
import 'package:fifa_world_cup_2026_app/core/storage/hive_adapters.dart';
import 'package:fifa_world_cup_2026_app/features/news/data/datasources/news_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/hive_test.dart';

import '../helpers/test_data.dart';

void main() {
  setUp(() async {
    await setUpTestHive();
    HiveAdapters.registerAdapters();
    await Hive.openBox<dynamic>(HiveConstants.newsBox);
  });

  tearDown(() async {
    await tearDownTestHive();
  });

  test('test_hive_writes_and_reads_news', () async {
    const dataSource = NewsLocalDataSource(CacheService());

    await dataSource.cacheNews([fakeNewsDto(id: 1), fakeNewsDto(id: 2)]);
    final result = dataSource.getLatestNews();

    expect(result.map((news) => news.id), [1, 2]);
  });

  test('news cache search returns matching cached article', () async {
    const dataSource = NewsLocalDataSource(CacheService());

    await dataSource.cacheNews([fakeNewsDto(id: 1), fakeNewsDto(id: 2)]);
    final result = dataSource.searchNews(query: 'world');

    expect(result.map((news) => news.id), [1, 2]);
  });
}
