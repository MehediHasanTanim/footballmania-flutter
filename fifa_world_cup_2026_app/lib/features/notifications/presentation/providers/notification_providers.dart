import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/providers/core_providers.dart';
import '../../application/notification_service.dart';
import '../../data/datasources/notifications_remote_data_source.dart';

final firebaseMessagingProvider = Provider<FirebaseMessaging>(
  (ref) => FirebaseMessaging.instance,
);

final notificationsRemoteDataSourceProvider =
    Provider<NotificationsRemoteDataSource>((ref) {
      return NotificationsRemoteDataSource(
        dioClient: ref.watch(dioClientProvider),
        errorHandler: ref.watch(errorHandlerProvider),
      );
    });

final notificationServiceProvider = Provider<NotificationService>((ref) {
  final service = NotificationService(
    messaging: ref.watch(firebaseMessagingProvider),
    remoteDataSource: ref.watch(notificationsRemoteDataSourceProvider),
    logger: ref.watch(loggerProvider),
  );
  ref.onDispose(() => unawaited(service.dispose()));
  return service;
});
