import 'package:dio/dio.dart';

import '../constants/app_constants.dart';

typedef TokenResolver = Future<String?> Function();
typedef ApiKeyResolver = String? Function();

class ApiInterceptor extends Interceptor {
  ApiInterceptor({this.tokenResolver, this.apiKeyResolver});

  final TokenResolver? tokenResolver;
  final ApiKeyResolver? apiKeyResolver;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final apiKey = apiKeyResolver?.call();
    if (apiKey != null && apiKey.isNotEmpty) {
      options.headers[AppConstants.apiKeyHeader] = apiKey;
    }

    final token = await tokenResolver?.call();
    if (token != null && token.isNotEmpty) {
      options.headers[AppConstants.authorizationHeader] =
          '${AppConstants.bearerPrefix} $token';
    }

    super.onRequest(options, handler);
  }
}
