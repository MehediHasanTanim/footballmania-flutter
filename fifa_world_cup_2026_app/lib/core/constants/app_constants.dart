class AppConstants {
  const AppConstants._();

  static const appName = 'FIFA World Cup 2026';
  static const appVersion = '1.0.0';
  static const defaultLocale = 'en';
  static const supportedLocales = ['en'];
  static const hiveAppBox = 'world_cup_app_box';
  static const hiveCacheBox = 'world_cup_cache_box';
  static const apiKeyHeader = 'x-api-key';
  static const authorizationHeader = 'Authorization';
  static const bearerPrefix = 'Bearer';
  static const offlineRetryDebounce = Duration(milliseconds: 500);
}
