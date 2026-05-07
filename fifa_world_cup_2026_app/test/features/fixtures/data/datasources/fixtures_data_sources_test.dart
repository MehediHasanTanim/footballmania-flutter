import 'package:fifa_world_cup_2026_app/core/constants/api_constants.dart';
import 'package:fifa_world_cup_2026_app/core/constants/hive_constants.dart';
import 'package:fifa_world_cup_2026_app/core/network/api_service.dart';
import 'package:fifa_world_cup_2026_app/core/storage/cache_service.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/data/datasources/fixtures_local_data_source.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/data/datasources/fixtures_remote_data_source.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/data/models/cached_fixture.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/data/models/fixture_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApiService extends Mock implements ApiService {}

class MockCacheService extends Mock implements CacheService {}

void main() {
  test('remote data source calls fixtures endpoint with filters', () async {
    final apiService = MockApiService();
    final dataSource = FixturesRemoteDataSource(apiService);
    final fixtures = [_fixtureDto(1)];

    when(
      () => apiService.getList<FixtureDto>(
        ApiConstants.fixtures,
        queryParameters: {
          'date': '2026-06-11',
          'team_id': 1,
          'group': 'A',
          'stage': 'Group Stage',
        },
        fromJson: FixtureDto.fromJson,
      ),
    ).thenAnswer((_) async => fixtures);

    final result = await dataSource.getFixtures(
      date: '2026-06-11',
      teamId: 1,
      group: 'A',
      stage: 'Group Stage',
    );

    expect(result, fixtures);
  });

  test('local data source reads unexpired cached fixture', () {
    final cacheService = MockCacheService();
    final dataSource = FixturesLocalDataSource(cacheService);
    final cached = _cachedFixture(1, expiresAt: DateTime.now().add(const Duration(hours: 1)));

    when(() => cacheService.get<CachedFixture>(HiveConstants.fixturesBox, '1')).thenReturn(cached);

    final result = dataSource.getFixtureById(1);

    expect(result?.id, 1);
    expect(result?.homeTeamName, 'USA');
  });

  test('local data source writes fixtures to cache', () async {
    final cacheService = MockCacheService();
    final dataSource = FixturesLocalDataSource(cacheService);
    final fixtures = [_fixtureDto(1)];

    when(() => cacheService.clear(HiveConstants.fixturesBox)).thenAnswer((_) async {});
    when(() => cacheService.putAll<CachedFixture>(HiveConstants.fixturesBox, any())).thenAnswer((_) async {});

    await dataSource.cacheFixtures(fixtures);

    verify(() => cacheService.clear(HiveConstants.fixturesBox)).called(1);
    verify(() => cacheService.putAll<CachedFixture>(HiveConstants.fixturesBox, any())).called(1);
  });
}

FixtureDto _fixtureDto(int id) {
  return FixtureDto(
    id: id,
    homeTeamId: 1,
    homeTeamName: 'USA',
    awayTeamId: 2,
    awayTeamName: 'Canada',
    matchDateUtc: DateTime.utc(2026, 6, 11, 20),
    venue: 'MetLife Stadium',
    stage: 'Group Stage',
    status: 'scheduled',
  );
}

CachedFixture _cachedFixture(int id, {required DateTime expiresAt}) {
  final now = DateTime.now();
  return CachedFixture(
    id: '$id',
    homeTeamId: '1',
    homeTeamName: 'USA',
    awayTeamId: '2',
    awayTeamName: 'Canada',
    matchDateUtc: DateTime.utc(2026, 6, 11, 20),
    venue: 'MetLife Stadium',
    stage: 'Group Stage',
    status: 'scheduled',
    createdAt: now,
    updatedAt: now,
    cachedAt: now,
    expiresAt: expiresAt,
  );
}
