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

  test('api maps 400 to validation error', () async {
    when(() => dioClient.get<Object?>(any(), queryParameters: any(named: 'queryParameters')))
        .thenThrow(dioError(type: DioExceptionType.badResponse, statusCode: 400));

    await expectLater(dataSource.getFixtures(), throwsA(isA<ValidationException>()));
  });

  test('test_api_maps_401_to_unauthorized_error', () async {
    when(() => dioClient.get<Object?>(any(), queryParameters: any(named: 'queryParameters')))
        .thenThrow(dioError(type: DioExceptionType.badResponse, statusCode: 401));

    await expectLater(dataSource.getFixtures(), throwsA(isA<UnauthorizedException>()));
  });

  test('api maps 500 to server error', () async {
    when(() => dioClient.get<Object?>(any(), queryParameters: any(named: 'queryParameters')))
        .thenThrow(dioError(type: DioExceptionType.badResponse, statusCode: 500));

    await expectLater(dataSource.getFixtures(), throwsA(isA<ServerException>()));
  });

  test('test_api_maps_timeout_to_network_error', () async {
    when(() => dioClient.get<Object?>(any(), queryParameters: any(named: 'queryParameters')))
        .thenThrow(dioError(type: DioExceptionType.connectionTimeout));

    await expectLater(dataSource.getFixtures(), throwsA(isA<TimeoutException>()));
  });
}
