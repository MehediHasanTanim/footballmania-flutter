import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../config/app_config.dart';
import '../constants/api_constants.dart';
import 'api_interceptor.dart';
import 'logging_interceptor.dart';

class DioClient {
  DioClient({
    required AppConfig config,
    Logger? logger,
    TokenResolver? tokenResolver,
    ApiKeyResolver? apiKeyResolver,
  }) {
    dio = Dio(
      BaseOptions(
        baseUrl: config.baseApiUrl,
        connectTimeout: config.apiTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        sendTimeout: ApiConstants.sendTimeout,
        contentType: ApiConstants.contentType,
        responseType: ResponseType.json,
        headers: const {'Accept': ApiConstants.accept},
      ),
    );

    dio.interceptors.add(
      ApiInterceptor(
        tokenResolver: tokenResolver,
        apiKeyResolver: apiKeyResolver,
      ),
    );
    dio.interceptors.add(_RetryReadyInterceptor());

    if (config.loggingEnabled && logger != null) {
      dio.interceptors.add(AppLoggingInterceptor(logger: logger));
    }
  }

  late final Dio dio;

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return dio.get<T>(path, queryParameters: queryParameters, options: options);
  }

  Future<Response<T>> post<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return dio.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response<T>> put<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return dio.put<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response<T>> delete<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return dio.delete<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }
}

class _RetryReadyInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    err.requestOptions.extra['retryReady'] = true;
    super.onError(err, handler);
  }
}
