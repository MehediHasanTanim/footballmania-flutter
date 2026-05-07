import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logger/logger.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

class FirebaseInitializer {
  const FirebaseInitializer._();

  static bool isAvailable = false;

  static Future<void> initialize({required Logger logger}) async {
    try {
      await Firebase.initializeApp();
      FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
      isAvailable = true;
    } catch (error, stackTrace) {
      isAvailable = false;
      logger.w(
        'Firebase is not configured; notifications are disabled',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}
