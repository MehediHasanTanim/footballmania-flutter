import 'package:fifa_world_cup_2026_app/core/domain/enums/favorite_type.dart';
import 'package:fifa_world_cup_2026_app/core/network/connectivity_provider.dart';
import 'package:fifa_world_cup_2026_app/features/countdown/presentation/providers/countdown_provider.dart';
import 'package:fifa_world_cup_2026_app/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/presentation/screens/fixtures_screen.dart';
import 'package:fifa_world_cup_2026_app/features/home/presentation/screens/home_screen.dart';
import 'package:fifa_world_cup_2026_app/features/news/presentation/screens/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../test/helpers/test_data.dart';
import '../test/helpers/test_providers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('test_full_user_flow_home_to_favorites', (tester) async {
    await tester.pumpWidget(_app(const HomeScreen()));
    await tester.pump();
    expect(find.text('Tournament countdown'), findsOneWidget);

    await tester.pumpWidget(_app(const FixturesScreen()));
    await tester.pump();
    expect(find.text('3 fixtures'), findsOneWidget);

    await tester.pumpWidget(
      _app(
        const FavoritesScreen(),
        favoritesRepository: FakeFavoritesRepository(
          favorites: [fakeFavorite(type: FavoriteType.match, referenceId: '1')],
        ),
      ),
    );
    await tester.pump();
    expect(find.text('USA vs Canada'), findsOneWidget);
  });

  testWidgets('test_offline_cache_flow', (tester) async {
    await tester.pumpWidget(_app(const FixturesScreen(), isOnline: false));
    await tester.pump();

    expect(find.text('3 fixtures'), findsOneWidget);
  });

  testWidgets('test_search_and_filter_flow', (tester) async {
    await tester.pumpWidget(_app(const NewsScreen()));
    await tester.pump();

    await tester.enterText(find.byType(TextField), 'squad');
    await tester.pump(const Duration(milliseconds: 400));

    expect(find.text('USA announces squad'), findsOneWidget);
  });
}

Widget _app(
  Widget child, {
  bool isOnline = true,
  FakeFavoritesRepository? favoritesRepository,
}) {
  return ProviderScope(
    overrides: [
      ...testRepositoryOverrides(
        fixturesRepository: FakeFixturesRepository(fixtures: fakeFixtures),
        newsRepository: FakeNewsRepository(news: fakeNewsList),
        favoritesRepository: favoritesRepository ?? FakeFavoritesRepository(),
      ),
      countdownProvider.overrideWith((ref) => Stream.value(fakeCountdown())),
      connectivityStatusProvider.overrideWith((ref) => Stream.value(isOnline)),
    ],
    child: MaterialApp(home: child),
  );
}
