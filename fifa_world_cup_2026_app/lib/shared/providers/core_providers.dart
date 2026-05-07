import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../core/config/app_config.dart';
import '../../core/errors/error_handler.dart';
import '../../core/network/connectivity_service.dart';
import '../../core/network/dio_client.dart';
import '../../core/network/network_info.dart';

final appConfigProvider = Provider<AppConfig>((ref) => AppConfig.current);

final loggerProvider = Provider<Logger>((ref) => Logger());

final connectivityServiceProvider = Provider<ConnectivityService>(
  (ref) => ConnectivityService(),
);

final networkInfoProvider = Provider<NetworkInfo>((ref) {
  return NetworkInfo(ref.watch(connectivityServiceProvider));
});

final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient(
    config: ref.watch(appConfigProvider),
    logger: ref.watch(loggerProvider),
    apiKeyResolver: () => const String.fromEnvironment('API_KEY'),
  );
});

final dioProvider = Provider<Dio>((ref) => ref.watch(dioClientProvider).dio);

final errorHandlerProvider = Provider<ErrorHandler>((ref) {
  return ErrorHandler(logger: ref.watch(loggerProvider));
});
