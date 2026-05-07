import 'package:fifa_world_cup_2026_app/core/errors/error_handler.dart';
import 'package:fifa_world_cup_2026_app/core/network/network_info.dart';
import 'package:fifa_world_cup_2026_app/core/utils/result.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/data/datasources/fixtures_local_data_source.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/data/datasources/fixtures_remote_data_source.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/data/models/fixture_dto.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/data/repositories/fixtures_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFixturesRemoteDataSource extends Mock implements FixturesRemoteDataSource {}

class MockFixturesLocalDataSource extends Mock implements FixturesLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late MockFixturesRemoteDataSource remote;
  late MockFixturesLocalDataSource local;
  late MockNetworkInfo networkInfo;
  late FixturesRepositoryImpl repository;

  setUp(() {
    remote = MockFixturesRemoteDataSource();
    local = MockFixturesLocalDataSource();
    networkInfo = MockNetworkInfo();
    repository = FixturesRepositoryImpl(
      remoteDataSource: remote,
      localDataSource: local,
      networkInfo: networkInfo,
      errorHandler: const ErrorHandler(),
    );
  });

  test('returns fresh fixtures and caches them when online', () async {
    final fixtures = [_fixtureDto(1)];
    when(() => local.getFixtures(date: null, teamId: null, group: null, stage: null)).thenReturn(const []);
    when(() => networkInfo.isConnected).thenAnswer((_) async => true);
    when(() => remote.getFixtures(date: null, teamId: null, group: null, stage: null)).thenAnswer((_) async => fixtures);
    when(() => local.cacheFixtures(fixtures)).thenAnswer((_) async {});

    final result = await repository.getFixtures();

    expect(result, isA<Success>());
    expect((result as Success).data.first.id, 1);
    verify(() => local.cacheFixtures(fixtures)).called(1);
  });

  test('falls back to cached fixtures when remote fails', () async {
    final cached = [_fixtureDto(2)];
    when(() => local.getFixtures(date: null, teamId: null, group: null, stage: null)).thenReturn(cached);
    when(() => networkInfo.isConnected).thenAnswer((_) async => true);
    when(() => remote.getFixtures(date: null, teamId: null, group: null, stage: null)).thenThrow(Exception('offline'));

    final result = await repository.getFixtures();

    expect(result, isA<Success>());
    expect((result as Success).data.first.id, 2);
  });

  test('returns failure when remote and cache both fail', () async {
    when(() => local.getFixtures(date: null, teamId: null, group: null, stage: null)).thenReturn(const []);
    when(() => networkInfo.isConnected).thenAnswer((_) async => true);
    when(() => remote.getFixtures(date: null, teamId: null, group: null, stage: null)).thenThrow(Exception('offline'));

    final result = await repository.getFixtures();

    expect(result, isA<FailureResult>());
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
