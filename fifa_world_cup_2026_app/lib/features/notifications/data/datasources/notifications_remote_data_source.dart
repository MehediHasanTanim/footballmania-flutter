import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/errors/app_exception.dart';
import '../../../../core/errors/error_handler.dart';
import '../../../../core/network/dio_client.dart';
import '../../domain/entities/notification_preferences.dart';

class NotificationsRemoteDataSource {
  const NotificationsRemoteDataSource({
    required DioClient dioClient,
    required ErrorHandler errorHandler,
  }) : _dioClient = dioClient,
       _errorHandler = errorHandler;

  final DioClient _dioClient;
  final ErrorHandler _errorHandler;

  Future<void> registerDevice({
    required String token,
    required NotificationPreferences preferences,
  }) async {
    await _post(
      ApiConstants.notificationDevices,
      data: {
        'token': token,
        'platform': defaultTargetPlatform.name,
        'preferences': preferences.toJson(),
      },
    );
  }

  Future<void> syncPreferences({
    required String token,
    required NotificationPreferences preferences,
  }) async {
    await _post(
      ApiConstants.notificationPreferences,
      data: {'token': token, 'preferences': preferences.toJson()},
    );
  }

  Future<void> unregisterDevice(String token) async {
    await _dioCall(
      () => _dioClient.delete<Object?>(
        '${ApiConstants.notificationDevices}/$token',
      ),
    );
  }

  Future<void> _post(String path, {required Object data}) async {
    await _dioCall(() => _dioClient.post<Object?>(path, data: data));
  }

  Future<void> _dioCall(Future<Response<Object?>> Function() request) async {
    try {
      await request();
    } on DioException catch (error) {
      throw _errorHandler.exceptionFromDio(error);
    } on AppException {
      rethrow;
    } catch (error) {
      throw UnknownException(details: error);
    }
  }
}
