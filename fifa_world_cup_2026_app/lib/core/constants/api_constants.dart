class ApiConstants {
  const ApiConstants._();

  static const connectTimeout = Duration(seconds: 30);
  static const receiveTimeout = Duration(seconds: 30);
  static const sendTimeout = Duration(seconds: 30);

  static const contentType = 'application/json';
  static const accept = 'application/json';

  static const fixtures = '/fixtures';
  static const liveScores = '/live-scores';
  static const teams = '/teams';
  static const groups = '/groups';
  static const news = '/news';
  static const favorites = '/favorites';
}
