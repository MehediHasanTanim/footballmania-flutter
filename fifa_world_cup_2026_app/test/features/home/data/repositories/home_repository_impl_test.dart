import 'package:fifa_world_cup_2026_app/core/errors/error_handler.dart';
import 'package:fifa_world_cup_2026_app/core/network/network_info.dart';
import 'package:fifa_world_cup_2026_app/core/utils/result.dart';
import 'package:fifa_world_cup_2026_app/features/home/data/datasources/home_local_data_source.dart';
import 'package:fifa_world_cup_2026_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:fifa_world_cup_2026_app/features/home/data/models/home_summary_dto.dart';
import 'package:fifa_world_cup_2026_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeRemoteDataSource extends Mock implements HomeRemoteDataSource {}

class MockHomeLocalDataSource extends Mock implements HomeLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  test('returns cached home summary when offline', () async {
    final remote = MockHomeRemoteDataSource();
    final local = MockHomeLocalDataSource();
    final networkInfo = MockNetworkInfo();
    final repository = HomeRepositoryImpl(
      remoteDataSource: remote,
      localDataSource: local,
      networkInfo: networkInfo,
      errorHandler: const ErrorHandler(),
    );
    final cached = HomeSummaryDto(countdownTargetDate: DateTime.utc(2026, 6, 11));

    when(local.getHomeSummary).thenReturn(cached);
    when(() => networkInfo.isConnected).thenAnswer((_) async => false);

    final result = await repository.getHomeSummary();

    expect(result, isA<Success>());
    expect((result as Success).data.countdownTargetDate, DateTime.utc(2026, 6, 11));
    verifyNever(remote.getHomeSummary);
  });

  test('returns failure when home API and cache are unavailable', () async {
    final remote = MockHomeRemoteDataSource();
    final local = MockHomeLocalDataSource();
    final networkInfo = MockNetworkInfo();
    final repository = HomeRepositoryImpl(
      remoteDataSource: remote,
      localDataSource: local,
      networkInfo: networkInfo,
      errorHandler: const ErrorHandler(),
    );

    when(local.getHomeSummary).thenReturn(null);
    when(() => networkInfo.isConnected).thenAnswer((_) async => true);
    when(remote.getHomeSummary).thenThrow(Exception('server down'));

    final result = await repository.getHomeSummary();

    expect(result, isA<FailureResult>());
  });
}
