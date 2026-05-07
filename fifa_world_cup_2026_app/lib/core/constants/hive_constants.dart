class HiveConstants {
  const HiveConstants._();

  static const fixturesBox = 'fixtures_box';
  static const teamsBox = 'teams_box';
  static const newsBox = 'news_box';
  static const favoritesBox = 'favorites_box';
  static const settingsBox = 'settings_box';
  static const cacheMetadataBox = 'cache_metadata_box';

  static const cacheVersionKey = 'cache_version';
  static const lastSyncedAtKey = 'last_synced_at';
  static const expiresAtKey = 'expires_at';
  static const fixtureCacheExpiryKey = 'fixtures_cache_expiry';
  static const teamCacheExpiryKey = 'teams_cache_expiry';
  static const newsCacheExpiryKey = 'news_cache_expiry';
  static const favoriteTeamKey = 'favorite_teams';
  static const favoriteMatchKey = 'favorite_matches';
  static const userSettingsKey = 'user_settings';
  static const themeSettingKey = 'theme_mode';
  static const notificationSettingKey = 'notifications_enabled';

  static const allBoxes = [
    fixturesBox,
    teamsBox,
    newsBox,
    favoritesBox,
    settingsBox,
    cacheMetadataBox,
  ];
}
