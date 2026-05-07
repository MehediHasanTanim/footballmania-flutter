import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'core/config/app_config.dart';
import 'core/firebase/firebase_initializer.dart';
import 'core/storage/hive_initializer.dart';

typedef AppBuilder = FutureOr<Widget> Function();

Future<void> bootstrap(AppBuilder builder) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      final logger = Logger();
      await HiveInitializer.initialize(logger: logger);
      await FirebaseInitializer.initialize(logger: logger);

      FlutterError.onError = (details) {
        FlutterError.presentError(details);

        if (AppConfig.current.loggingEnabled) {
          logger.e(
            'Flutter framework error',
            error: details.exception,
            stackTrace: details.stack,
          );
        }
      };

      runApp(await builder());
    },
    (error, stackTrace) {
      if (AppConfig.current.loggingEnabled || kDebugMode) {
        Logger().e('Uncaught app error', error: error, stackTrace: stackTrace);
      }
    },
  );
}
