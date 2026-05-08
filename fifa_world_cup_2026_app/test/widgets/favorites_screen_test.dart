import 'package:fifa_world_cup_2026_app/core/domain/enums/favorite_type.dart';
import 'package:fifa_world_cup_2026_app/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/test_data.dart';
import '../helpers/test_providers.dart';

void main() {
  testWidgets('test_favorites_screen_empty_state', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: testRepositoryOverrides(favoritesRepository: FakeFavoritesRepository()),
        child: const MaterialApp(home: FavoritesScreen()),
      ),
    );
    await tester.pump();

    expect(find.text('No favorites yet'), findsOneWidget);
  });

  testWidgets('favorite list renders', (tester) async {
    await tester.pumpWidget(_favoritesApp());
    await tester.pump();

    expect(find.text('USA vs Canada'), findsOneWidget);
  });

  testWidgets('remove favorite updates UI', (tester) async {
    await tester.pumpWidget(_favoritesApp());
    await tester.pump();

    await tester.tap(find.byTooltip('Remove favorite'));
    await tester.pump();

    expect(find.text('No favorites yet'), findsOneWidget);
  });
}

Widget _favoritesApp() {
  return ProviderScope(
    overrides: testRepositoryOverrides(
      favoritesRepository: FakeFavoritesRepository(
        favorites: [
          fakeFavorite(type: FavoriteType.match, referenceId: '1'),
        ],
      ),
    ),
    child: const MaterialApp(home: FavoritesScreen()),
  );
}
