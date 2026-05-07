import 'package:fifa_world_cup_2026_app/routes/route_names.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('contains core route paths', () {
    expect(RoutePaths.root, '/');
    expect(RoutePaths.matchDetails, '/fixtures/:matchId');
    expect(RoutePaths.teamDetails, '/teams/:teamId');
    expect(RoutePaths.newsDetails, '/news/:newsId');
  });

  test('contains named routes', () {
    expect(RouteNames.fixtures, 'fixtures');
    expect(RouteNames.liveScores, 'liveScores');
    expect(RouteNames.settings, 'settings');
  });
}
