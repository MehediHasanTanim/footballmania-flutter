import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import '../../../routes/app_router.dart';
import '../data/datasources/notifications_remote_data_source.dart';
import '../domain/entities/notification_payload.dart';
import '../domain/entities/notification_preferences.dart';

class NotificationService {
  NotificationService({
    required FirebaseMessaging messaging,
    required NotificationsRemoteDataSource remoteDataSource,
    required Logger logger,
  }) : _messaging = messaging,
       _remoteDataSource = remoteDataSource,
       _logger = logger;

  final FirebaseMessaging _messaging;
  final NotificationsRemoteDataSource _remoteDataSource;
  final Logger _logger;
  StreamSubscription<String>? _tokenSubscription;
  StreamSubscription<RemoteMessage>? _openedSubscription;
  NotificationPreferences? _lastPreferences;

  Future<void> initialize(NotificationPreferences preferences) async {
    _lastPreferences = preferences;
    await _requestPermission();
    await _messaging.setAutoInitEnabled(preferences.anyEnabled);
    await _syncDevice(preferences);

    _tokenSubscription ??= _messaging.onTokenRefresh.listen((token) async {
      final currentPreferences = _lastPreferences;
      if (currentPreferences == null) return;
      await _safeRemoteCall(
        () => _remoteDataSource.registerDevice(
          token: token,
          preferences: currentPreferences,
        ),
      );
    });

    _openedSubscription ??= FirebaseMessaging.onMessageOpenedApp.listen(
      handleMessageOpened,
    );

    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      handleMessageOpened(initialMessage);
    }
  }

  Future<void> syncPreferences(NotificationPreferences preferences) async {
    _lastPreferences = preferences;
    await _messaging.setAutoInitEnabled(preferences.anyEnabled);

    final token = await _messaging.getToken();
    if (token == null) return;

    if (preferences.anyEnabled) {
      await _safeRemoteCall(
        () => _remoteDataSource.syncPreferences(
          token: token,
          preferences: preferences,
        ),
      );
    } else {
      await _safeRemoteCall(() => _remoteDataSource.unregisterDevice(token));
    }
  }

  void handleMessageOpened(RemoteMessage message) {
    final payload = NotificationPayload.fromData(message.data);
    final route = switch (payload.type) {
      NotificationType.matchReminder ||
      NotificationType.goalAlert ||
      NotificationType.liveScoreChange when payload.matchId != null =>
        '/fixtures/${payload.matchId}',
      NotificationType.liveScoreChange => '/live-scores',
      NotificationType.breakingNews when payload.newsId != null =>
        '/news/${payload.newsId}',
      NotificationType.breakingNews => '/news',
      NotificationType.matchReminder ||
      NotificationType.goalAlert => '/fixtures',
      NotificationType.unknown => null,
    };

    if (route != null) {
      appRouter.go(route);
    }
  }

  Future<void> dispose() async {
    await _tokenSubscription?.cancel();
    await _openedSubscription?.cancel();
  }

  Future<void> _requestPermission() async {
    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      await _messaging.requestPermission(alert: true, badge: true, sound: true);
      await _messaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }

  Future<void> _syncDevice(NotificationPreferences preferences) async {
    final token = await _messaging.getToken();
    if (token == null || !preferences.anyEnabled) return;

    await _safeRemoteCall(
      () => _remoteDataSource.registerDevice(
        token: token,
        preferences: preferences,
      ),
    );
  }

  Future<void> _safeRemoteCall(Future<void> Function() call) async {
    try {
      await call();
    } catch (error, stackTrace) {
      _logger.w(
        'Notification backend sync failed',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}
