import 'package:dio/dio.dart';

import '../errors/app_exception.dart';
import '../errors/error_handler.dart';
import 'api_response.dart';
import 'dio_client.dart';

class ApiService {
  const ApiService({required DioClient dioClient, required ErrorHandler errorHandler})
    : _dioClient = dioClient,
      _errorHandler = errorHandler;

  final DioClient _dioClient;
  final ErrorHandler _errorHandler;

  Future<T> getObject<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    required T Function(Map<String, dynamic> json) fromJson,
  }) async {
    final response = await _get(path, queryParameters: queryParameters);
    return ApiResponse.parseObject<T>(response.data, fromJson);
  }

  Future<List<T>> getList<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    required T Function(Map<String, dynamic> json) fromJson,
  }) async {
    final response = await _get(path, queryParameters: queryParameters);
    return ApiResponse.parseList<T>(response.data, fromJson);
  }

  Future<Response<Object?>> _get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dioClient.get<Object?>(
        path,
        queryParameters: _compactQuery(queryParameters),
      );
    } on DioException catch (error) {
      throw _errorHandler.exceptionFromDio(error);
    } on AppException {
      rethrow;
    } catch (error) {
      throw UnknownException(details: error);
    }
  }

  Map<String, dynamic>? _compactQuery(Map<String, dynamic>? query) {
    if (query == null) return null;
    final compact = Map<String, dynamic>.from(query)..removeWhere((_, value) => value == null || value == '');
    return compact.isEmpty ? null : compact;
  }
}
