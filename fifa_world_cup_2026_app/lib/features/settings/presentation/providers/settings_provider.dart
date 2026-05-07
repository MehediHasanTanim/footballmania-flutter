import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/hive_constants.dart';
import '../../../../shared/providers/data_source_providers.dart';

class UserSettings {
  const UserSettings({
    this.themeMode = ThemeMode.system,
    this.matchReminders = true,
    this.goalAlerts = true,
    this.newsAlerts = true,
    this.isClearingCache = false,
  });

  final ThemeMode themeMode;
  final bool matchReminders;
  final bool goalAlerts;
  final bool newsAlerts;
  final bool isClearingCache;

  UserSettings copyWith({
    ThemeMode? themeMode,
    bool? matchReminders,
    bool? goalAlerts,
    bool? newsAlerts,
    bool? isClearingCache,
  }) {
    return UserSettings(
      themeMode: themeMode ?? this.themeMode,
      matchReminders: matchReminders ?? this.matchReminders,
      goalAlerts: goalAlerts ?? this.goalAlerts,
      newsAlerts: newsAlerts ?? this.newsAlerts,
      isClearingCache: isClearingCache ?? this.isClearingCache,
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
  SettingsNotifier(this._ref) : super(const UserSettings());

  final Ref _ref;

  void setThemeMode(ThemeMode themeMode) {
    state = state.copyWith(themeMode: themeMode);
  }

  void setMatchReminders(bool value) {
    state = state.copyWith(matchReminders: value);
  }

  void setGoalAlerts(bool value) {
    state = state.copyWith(goalAlerts: value);
  }

  void setNewsAlerts(bool value) {
    state = state.copyWith(newsAlerts: value);
  }

  Future<void> clearExpiredCache() async {
    state = state.copyWith(isClearingCache: true);
    try {
      await _ref.read(cacheServiceProvider).clear(HiveConstants.cacheMetadataBox);
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
}
