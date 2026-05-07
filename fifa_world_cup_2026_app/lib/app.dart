import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/config/app_config.dart';
import 'core/firebase/firebase_initializer.dart';
import 'core/theme/app_theme.dart';
import 'features/notifications/presentation/providers/notification_providers.dart';
import 'features/settings/presentation/providers/settings_provider.dart';
import 'routes/app_router.dart';

class WorldCupApp extends ConsumerStatefulWidget {
  const WorldCupApp({super.key});

  @override
  ConsumerState<WorldCupApp> createState() => _WorldCupAppState();
}

class _WorldCupAppState extends ConsumerState<WorldCupApp> {
  @override
  void initState() {
    super.initState();
    if (FirebaseInitializer.isAvailable) {
      Future.microtask(() {
        final settings = ref.read(settingsProvider);
        unawaited(
          ref
              .read(notificationServiceProvider)
              .initialize(settings.toNotificationPreferences()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConfig.current.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ref.watch(themeModeProvider),
      routerConfig: appRouter,
    );
  }
}
