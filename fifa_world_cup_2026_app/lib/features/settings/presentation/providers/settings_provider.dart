import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/hive_constants.dart';
import '../../../../core/errors/app_exception.dart';
import '../../../../core/firebase/firebase_initializer.dart';
import '../../../../features/notifications/domain/entities/notification_preferences.dart';
import '../../../../features/notifications/presentation/providers/notification_providers.dart';
import '../../data/models/cached_user_settings.dart';
import '../../../../shared/providers/data_source_providers.dart';

class UserSettings {
  const UserSettings({
    this.themeMode = ThemeMode.system,
    this.matchReminders = true,
    this.goalAlerts = true,
    this.liveScoreAlerts = true,
    this.newsAlerts = true,
    this.isClearingCache = false,
  });

  final ThemeMode themeMode;
  final bool matchReminders;
  final bool goalAlerts;
  final bool liveScoreAlerts;
  final bool newsAlerts;
  final bool isClearingCache;

  UserSettings copyWith({
    ThemeMode? themeMode,
    bool? matchReminders,
    bool? goalAlerts,
    bool? liveScoreAlerts,
    bool? newsAlerts,
    bool? isClearingCache,
  }) {
    return UserSettings(
      themeMode: themeMode ?? this.themeMode,
      matchReminders: matchReminders ?? this.matchReminders,
      goalAlerts: goalAlerts ?? this.goalAlerts,
      liveScoreAlerts: liveScoreAlerts ?? this.liveScoreAlerts,
      newsAlerts: newsAlerts ?? this.newsAlerts,
      isClearingCache: isClearingCache ?? this.isClearingCache,
    );
  }

  NotificationPreferences toNotificationPreferences() {
    return NotificationPreferences(
      matchReminders: matchReminders,
      goalAlerts: goalAlerts,
      liveScoreAlerts: liveScoreAlerts,
      newsAlerts: newsAlerts,
    );
  }
}

final settingsProvider = StateNotifierProvider<SettingsNotifier, UserSettings>(
  (ref) => SettingsNotifier(ref),
);

final themeModeProvider = Provider<ThemeMode>((ref) {
  return ref.watch(settingsProvider.select((settings) => settings.themeMode));
});

class SettingsNotifier extends StateNotifier<UserSettings> {
  SettingsNotifier(this._ref) : super(const UserSettings()) {
    _loadSettings();
  }

  final Ref _ref;

  void setThemeMode(ThemeMode themeMode) {
    state = state.copyWith(themeMode: themeMode);
    unawaited(_persistSettings());
  }

  void setMatchReminders(bool value) {
    state = state.copyWith(matchReminders: value);
    unawaited(_persistSettings());
    unawaited(_syncNotifications());
  }

  void setGoalAlerts(bool value) {
    state = state.copyWith(goalAlerts: value);
    unawaited(_persistSettings());
    unawaited(_syncNotifications());
  }

  void setLiveScoreAlerts(bool value) {
    state = state.copyWith(liveScoreAlerts: value);
    unawaited(_persistSettings());
    unawaited(_syncNotifications());
  }

  void setNewsAlerts(bool value) {
    state = state.copyWith(newsAlerts: value);
    unawaited(_persistSettings());
    unawaited(_syncNotifications());
  }

  Future<void> clearExpiredCache() async {
    state = state.copyWith(isClearingCache: true);
    try {
      await _ref
          .read(cacheServiceProvider)
          .clear(HiveConstants.cacheMetadataBox);
    } finally {
      state = state.copyWith(isClearingCache: false);
    }
  }

  Future<void> clearAllCache() async {
    state = state.copyWith(isClearingCache: true);
    try {
      final cache = _ref.read(cacheServiceProvider);
      for (final box in HiveConstants.allBoxes) {
        if (box != HiveConstants.settingsBox) {
          await cache.clear(box);
        }
      }
    } finally {
      state = state.copyWith(isClearingCache: false);
    }
  }

  void _loadSettings() {
    final CachedUserSettings? cached;
    final bool? liveScoreAlerts;
    try {
      final cache = _ref.read(cacheServiceProvider);
      cached = cache.get<CachedUserSettings>(
        HiveConstants.settingsBox,
        HiveConstants.userSettingsKey,
      );
      liveScoreAlerts = cache.get<bool>(
        HiveConstants.settingsBox,
        HiveConstants.liveScoreAlertSettingKey,
      );
    } on CacheException {
      return;
    }

    if (cached == null) {
      state = state.copyWith(liveScoreAlerts: liveScoreAlerts ?? true);
      return;
    }

    state = state.copyWith(
      themeMode: _themeModeFromString(cached.themeMode),
      matchReminders: cached.enableMatchReminders,
      goalAlerts: cached.enableGoalAlerts,
      liveScoreAlerts: liveScoreAlerts ?? true,
      newsAlerts: cached.enableNewsAlerts,
    );
  }

  Future<void> _persistSettings() async {
    final now = DateTime.now();
    final cache = _ref.read(cacheServiceProvider);
    final CachedUserSettings? cached;

    try {
      cached = cache.get<CachedUserSettings>(
        HiveConstants.settingsBox,
        HiveConstants.userSettingsKey,
      );
    } on CacheException {
      return;
    }

    try {
      await cache.put(
        HiveConstants.settingsBox,
        HiveConstants.userSettingsKey,
        CachedUserSettings(
          themeMode: _themeModeToString(state.themeMode),
          languageCode: cached?.languageCode ?? 'en',
          timezone: cached?.timezone ?? 'local',
          enableMatchReminders: state.matchReminders,
          enableGoalAlerts: state.goalAlerts,
          enableNewsAlerts: state.newsAlerts,
          reminderMinutesBefore: cached?.reminderMinutesBefore ?? 30,
          createdAt: cached?.createdAt ?? now,
          updatedAt: now,
        ),
      );
      await cache.put(
        HiveConstants.settingsBox,
        HiveConstants.liveScoreAlertSettingKey,
        state.liveScoreAlerts,
      );
    } on CacheException {
      return;
    }
  }

  Future<void> _syncNotifications() async {
    if (!FirebaseInitializer.isAvailable) return;
    await _ref
        .read(notificationServiceProvider)
        .syncPreferences(state.toNotificationPreferences());
  }

  ThemeMode _themeModeFromString(String value) {
    return switch (value) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }

  String _themeModeToString(ThemeMode value) {
    return switch (value) {
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
      ThemeMode.system => 'system',
    };
  }
}
