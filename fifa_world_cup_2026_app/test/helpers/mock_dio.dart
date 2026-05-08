import 'package:dio/dio.dart';
import 'package:fifa_world_cup_2026_app/core/network/dio_client.dart';
import 'package:mocktail/mocktail.dart';

class MockDioClient extends Mock implements DioClient {}

Response<Object?> dioResponse(Object? data, {int statusCode = 200}) {
  return Response<Object?>(
    requestOptions: RequestOptions(path: '/test'),
    statusCode: statusCode,
    data: data,
  );
}

DioException dioError({
  required DioExceptionType type,
  int? statusCode,
  Object? data,
}) {
  final requestOptions = RequestOptions(path: '/test');
  return DioException(
    requestOptions: requestOptions,
    type: type,
    response: statusCode == null
        ? null
        : Response<Object?>(
            requestOptions: requestOptions,
            statusCode: statusCode,
            data: data,
          ),
  );
}
