import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/favorites/presentation/screens/favorites_screen.dart';
import '../features/countdown/presentation/screens/countdown_screen.dart';
import '../features/fixtures/presentation/screens/fixtures_screen.dart';
import '../features/fixtures/presentation/screens/match_details_screen.dart';
import '../features/groups/presentation/screens/groups_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/live_score/presentation/screens/live_scores_screen.dart';
import '../features/news/presentation/screens/news_details_screen.dart';
import '../features/news/presentation/screens/news_screen.dart';
import '../features/settings/presentation/screens/settings_screen.dart';
import '../features/splash/presentation/screens/splash_screen.dart';
import '../features/teams/presentation/screens/team_details_screen.dart';
import '../features/teams/presentation/screens/teams_screen.dart';
import '../shared/widgets/not_found_screen.dart';
import 'route_names.dart';

final appRouter = GoRouter(
  initialLocation: RoutePaths.root,
  redirect: _routeGuard,
  errorBuilder: (context, state) =>
      NotFoundScreen(location: state.uri.toString()),
  routes: [
    GoRoute(
      path: RoutePaths.root,
      name: RouteNames.root,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RoutePaths.home,
      name: RouteNames.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: RoutePaths.countdown,
      name: RouteNames.countdown,
      builder: (context, state) => const CountdownScreen(),
    ),
    GoRoute(
      path: RoutePaths.fixtures,
      name: RouteNames.fixtures,
      builder: (context, state) => const FixturesScreen(),
    ),
    GoRoute(
      path: RoutePaths.matchDetails,
      name: RouteNames.matchDetails,
      builder: (context, state) =>
          MatchDetailsScreen(matchId: state.pathParameters['matchId'] ?? ''),
    ),
    GoRoute(
      path: RoutePaths.liveScores,
      name: RouteNames.liveScores,
      builder: (context, state) => const LiveScoresScreen(),
    ),
    GoRoute(
      path: RoutePaths.teams,
      name: RouteNames.teams,
      builder: (context, state) => const TeamsScreen(),
    ),
    GoRoute(
      path: RoutePaths.teamDetails,
      name: RouteNames.teamDetails,
      builder: (context, state) =>
          TeamDetailsScreen(teamId: state.pathParameters['teamId'] ?? ''),
    ),
    GoRoute(
      path: RoutePaths.groups,
      name: RouteNames.groups,
      builder: (context, state) => const GroupsScreen(),
    ),
    GoRoute(
      path: RoutePaths.news,
      name: RouteNames.news,
      builder: (context, state) => const NewsScreen(),
    ),
    GoRoute(
      path: RoutePaths.newsDetails,
      name: RouteNames.newsDetails,
      builder: (context, state) =>
          NewsDetailsScreen(newsId: state.pathParameters['newsId'] ?? ''),
    ),
    GoRoute(
      path: RoutePaths.favorites,
      name: RouteNames.favorites,
      builder: (context, state) => const FavoritesScreen(),
    ),
    GoRoute(
      path: RoutePaths.settings,
      name: RouteNames.settings,
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);

String? _routeGuard(BuildContext context, GoRouterState state) {
  // Future onboarding/auth redirects stay centralized here.
  return null;
}
