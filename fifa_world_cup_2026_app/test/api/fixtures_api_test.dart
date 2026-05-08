import 'package:dio/dio.dart';
import 'package:fifa_world_cup_2026_app/core/errors/app_exception.dart';
import 'package:fifa_world_cup_2026_app/core/errors/error_handler.dart';
import 'package:fifa_world_cup_2026_app/core/network/api_service.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/data/datasources/fixtures_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/mock_dio.dart';

void main() {
  late MockDioClient dioClient;
  late FixturesRemoteDataSource dataSource;

  setUp(() {
    dioClient = MockDioClient();
    dataSource = FixturesRemoteDataSource(
      ApiService(dioClient: dioClient, errorHandler: const ErrorHandler()),
    );
  });

  test('test_fixtures_api_success_response', () async {
    when(() => dioClient.get<Object?>(any(), queryParameters: any(named: 'queryParameters')))
        .thenAnswer((_) async => dioResponse({'data': [_fixtureJson(1)]}));

    final result = await dataSource.getFixtures();

    expect(result.single.id, 1);
    expect(result.single.homeTeamName, 'USA');
  });

  test('test_fixtures_api_handles_empty_response', () async {
    when(() => dioClient.get<Object?>(any(), queryParameters: any(named: 'queryParameters')))
        .thenAnswer((_) async => dioResponse({'data': []}));

    final result = await dataSource.getFixtures();

    expect(result, isEmpty);
  });

  test('fixtures api handles invalid response shape', () async {
    when(() => dioClient.get<Object?>(any(), queryParameters: any(named: 'queryParameters')))
        .thenAnswer((_) async => dioResponse({'data': {'unexpected': true}}));

    await expectLater(dataSource.getFixtures(), throwsA(isA<ServerException>()));
  });
}

Map<String, dynamic> _fixtureJson(int id) => {
  'id': id,
  'home_team_id': 10,
  'home_team_name': 'USA',
  'away_team_id': 20,
  'away_team_name': 'Canada',
  'match_date_utc': '2026-06-11T19:00:00.000Z',
  'venue': 'MetLife Stadium',
  'stage': 'Group Stage',
  'status': 'scheduled',
};
