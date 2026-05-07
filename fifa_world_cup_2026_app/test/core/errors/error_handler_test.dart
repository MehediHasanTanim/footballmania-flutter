import 'package:dio/dio.dart';
import 'package:fifa_world_cup_2026_app/core/errors/error_handler.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('maps Dio timeout into friendly failure', () {
    const handler = ErrorHandler();
    final failure = handler.failureFromException(
      DioException(
        requestOptions: RequestOptions(path: '/fixtures'),
        type: DioExceptionType.connectionTimeout,
      ),
    );

    expect(failure.message, 'The request took too long. Please try again.');
  });

  test('maps unauthorized response into friendly failure', () {
    const handler = ErrorHandler();
    final failure = handler.failureFromException(
      DioException(
        requestOptions: RequestOptions(path: '/favorites'),
        response: Response(
          requestOptions: RequestOptions(path: '/favorites'),
          statusCode: 401,
        ),
        type: DioExceptionType.badResponse,
      ),
    );

    expect(failure.message, 'Your session has expired. Please sign in again.');
  });
}
