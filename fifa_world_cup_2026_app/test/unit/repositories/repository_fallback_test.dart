import 'package:fifa_world_cup_2026_app/core/errors/error_handler.dart';
import 'package:fifa_world_cup_2026_app/core/network/network_info.dart';
import 'package:fifa_world_cup_2026_app/core/utils/result.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/data/datasources/fixtures_local_data_source.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/data/datasources/fixtures_remote_data_source.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/data/models/fixture_dto.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/data/repositories/fixtures_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/test_data.dart';

class MockFixturesRemoteDataSource extends Mock implements FixturesRemoteDataSource {}

class MockFixturesLocalDataSource extends Mock implements FixturesLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late MockFixturesRemoteDataSource remote;
  late MockFixturesLocalDataSource local;
  late MockNetworkInfo network;
  late FixturesRepositoryImpl repository;

  setUp(() {
    remote = MockFixturesRemoteDataSource();
    local = MockFixturesLocalDataSource();
    network = MockNetworkInfo();
    repository = FixturesRepositoryImpl(
      remoteDataSource: remote,
      localDataSource: local,
      networkInfo: network,
      errorHandler: const ErrorHandler(),
    );
    when(() => local.getFixtures(date: null, teamId: null, group: null, stage: null))
        .thenReturn(const <FixtureDto>[]);
  });

  test('test_repository_returns_remote_data_on_success', () async {
    final remoteFixtures = [fakeFixtureDto(id: 1)];
    when(() => network.isConnected).thenAnswer((_) async => true);
    when(() => remote.getFixtures(date: null, teamId: null, group: null, stage: null))
        .thenAnswer((_) async => remoteFixtures);
    when(() => local.cacheFixtures(remoteFixtures)).thenAnswer((_) async {});

    final result = await repository.getFixtures();

    expect(result, isA<Success>());
    expect((result as Success).data.first.id, 1);
  });

  test('test_repository_falls_back_to_cache_on_api_failure', () async {
    when(() => local.getFixtures(date: null, teamId: null, group: null, stage: null))
        .thenReturn([fakeFixtureDto(id: 2)]);
    when(() => network.isConnected).thenAnswer((_) async => true);
    when(() => remote.getFixtures(date: null, teamId: null, group: null, stage: null))
        .thenThrow(Exception('api down'));

    final result = await repository.getFixtures();

    expect(result, isA<Success>());
    expect((result as Success).data.first.id, 2);
  });

  test('test_repository_saves_remote_data_to_cache', () async {
    final remoteFixtures = [fakeFixtureDto(id: 3)];
    when(() => network.isConnected).thenAnswer((_) async => true);
    when(() => remote.getFixtures(date: null, teamId: null, group: null, stage: null))
        .thenAnswer((_) async => remoteFixtures);
    when(() => local.cacheFixtures(remoteFixtures)).thenAnswer((_) async {});

    await repository.getFixtures();

    verify(() => local.cacheFixtures(remoteFixtures)).called(1);
  });

  test('test_repository_returns_cached_data_when_offline', () async {
    when(() => local.getFixtures(
          date: null,
          teamId: null,
          group: null,
          stage: null,
          includeExpired: true,
        )).thenReturn([fakeFixtureDto(id: 4)]);
    when(() => network.isConnected).thenAnswer((_) async => false);

    final result = await repository.getFixtures();

    expect(result, isA<Success>());
    expect((result as Success).data.first.id, 4);
    verifyNever(() => remote.getFixtures(date: null, teamId: null, group: null, stage: null));
  });

  test('test_repository_maps_dto_to_domain_entity', () async {
    final remoteFixtures = [fakeFixtureDto(id: 5)];
    when(() => network.isConnected).thenAnswer((_) async => true);
    when(() => remote.getFixtures(date: null, teamId: null, group: null, stage: null))
        .thenAnswer((_) async => remoteFixtures);
    when(() => local.cacheFixtures(remoteFixtures)).thenAnswer((_) async {});

    final result = await repository.getFixtures();
    final fixture = (result as Success).data.first;

    expect(fixture.id, 5);
    expect(fixture.homeTeamName, isNotEmpty);
  });
}
