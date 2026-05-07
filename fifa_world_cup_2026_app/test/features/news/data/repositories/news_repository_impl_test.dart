import 'package:fifa_world_cup_2026_app/core/errors/error_handler.dart';
import 'package:fifa_world_cup_2026_app/core/network/network_info.dart';
import 'package:fifa_world_cup_2026_app/core/utils/result.dart';
import 'package:fifa_world_cup_2026_app/features/news/data/datasources/news_local_data_source.dart';
import 'package:fifa_world_cup_2026_app/features/news/data/datasources/news_remote_data_source.dart';
import 'package:fifa_world_cup_2026_app/features/news/data/models/news_dto.dart';
import 'package:fifa_world_cup_2026_app/features/news/data/repositories/news_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNewsRemoteDataSource extends Mock implements NewsRemoteDataSource {}

class MockNewsLocalDataSource extends Mock implements NewsLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  test('falls back to cached news when latest news API fails', () async {
    final remote = MockNewsRemoteDataSource();
    final local = MockNewsLocalDataSource();
    final networkInfo = MockNetworkInfo();
    final repository = NewsRepositoryImpl(
      remoteDataSource: remote,
      localDataSource: local,
      networkInfo: networkInfo,
      errorHandler: const ErrorHandler(),
    );
    final cached = [_newsDto(1)];

    when(() => local.getLatestNews(page: 1, pageSize: 20)).thenReturn(cached);
    when(() => networkInfo.isConnected).thenAnswer((_) async => true);
    when(() => remote.getLatestNews(page: 1, pageSize: 20)).thenThrow(Exception('server down'));

    final result = await repository.getLatestNews();

    expect(result, isA<Success>());
    expect((result as Success).data.first.title, 'World Cup');
  });
}

NewsDto _newsDto(int id) {
  return NewsDto(
    id: id,
    title: 'World Cup',
    description: 'Latest update',
    content: 'Content',
    sourceName: 'FIFA',
    publishedAt: DateTime.utc(2026),
  );
}
