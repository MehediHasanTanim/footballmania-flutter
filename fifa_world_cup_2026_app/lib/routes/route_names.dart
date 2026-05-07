class RouteNames {
  const RouteNames._();

  static const root = 'root';
  static const home = 'home';
  static const fixtures = 'fixtures';
  static const matchDetails = 'matchDetails';
  static const liveScores = 'liveScores';
  static const teams = 'teams';
  static const teamDetails = 'teamDetails';
  static const groups = 'groups';
  static const news = 'news';
  static const newsDetails = 'newsDetails';
  static const favorites = 'favorites';
  static const settings = 'settings';
}

class RoutePaths {
  const RoutePaths._();

  static const root = '/';
  static const home = '/home';
  static const fixtures = '/fixtures';
  static const matchDetails = '/fixtures/:matchId';
  static const liveScores = '/live-scores';
  static const teams = '/teams';
  static const teamDetails = '/teams/:teamId';
  static const groups = '/groups';
  static const news = '/news';
  static const newsDetails = '/news/:newsId';
  static const favorites = '/favorites';
  static const settings = '/settings';
}
