class ApiConstants {
  const ApiConstants._();

  static const connectTimeout = Duration(seconds: 30);
  static const receiveTimeout = Duration(seconds: 30);
  static const sendTimeout = Duration(seconds: 30);

  static const contentType = 'application/json';
  static const accept = 'application/json';

  static const apiV1 = '/api/v1';
  static const home = '$apiV1/home';
  static const fixtures = '$apiV1/fixtures';
  static const liveScores = '$apiV1/live';
  static const teams = '$apiV1/teams';
  static const groups = '$apiV1/groups';
  static const news = '$apiV1/news';
  static const newsSearch = '$apiV1/news/search';
  static const notificationDevices = '$apiV1/notifications/devices';
  static const notificationPreferences = '$apiV1/notifications/preferences';
  static const favorites = '/favorites';
}
