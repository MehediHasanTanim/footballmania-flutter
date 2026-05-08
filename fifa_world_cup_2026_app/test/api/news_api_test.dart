import 'package:fifa_world_cup_2026_app/core/errors/app_exception.dart';
import 'package:fifa_world_cup_2026_app/core/errors/error_handler.dart';
import 'package:fifa_world_cup_2026_app/core/network/api_service.dart';
import 'package:fifa_world_cup_2026_app/features/news/data/datasources/news_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/mock_dio.dart';

void main() {
  late MockDioClient dioClient;
  late NewsRemoteDataSource dataSource;

  setUp(() {
    dioClient = MockDioClient();
    dataSource = NewsRemoteDataSource(
      ApiService(dioClient: dioClient, errorHandler: const ErrorHandler()),
    );
  });

  test('test_news_api_success_response', () async {
    when(() => dioClient.get<Object?>(any(), queryParameters: any(named: 'queryParameters')))
        .thenAnswer((_) async => dioResponse({'data': [_newsJson(1)]}));

    final result = await dataSource.getLatestNews();

    expect(result.single.id, 1);
    expect(result.single.title, 'World Cup draw confirmed');
  });

  test('news api missing optional fields handled', () async {
    final json = _newsJson(1)..remove('image_url')..remove('source_url');
    when(() => dioClient.get<Object?>(any(), queryParameters: any(named: 'queryParameters')))
        .thenAnswer((_) async => dioResponse({'data': [json]}));

    final result = await dataSource.getLatestNews();

    expect(result.single.imageUrl, isNull);
  });

  test('test_news_api_handles_invalid_response_shape', () async {
    when(() => dioClient.get<Object?>(any(), queryParameters: any(named: 'queryParameters')))
        .thenAnswer((_) async => dioResponse({'data': {'bad': true}}));

    await expectLater(dataSource.getLatestNews(), throwsA(isA<ServerException>()));
  });

  test('news api pagination response handled', () async {
    when(() => dioClient.get<Object?>(any(), queryParameters: {'page': 2, 'page_size': 1}))
        .thenAnswer((_) async => dioResponse({'data': {'items': [_newsJson(2)]}}));

    final result = await dataSource.getLatestNews(page: 2, pageSize: 1);

    expect(result.single.id, 2);
  });
}

Map<String, dynamic> _newsJson(int id) => {
  'id': id,
  'title': 'World Cup draw confirmed',
  'description': 'Groups are set.',
  'content': 'Tournament news content.',
  'source_name': 'FIFA',
  'source_url': 'https://example.test',
  'published_at': '2026-01-01T00:00:00.000Z',
};
