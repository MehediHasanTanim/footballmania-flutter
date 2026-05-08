import 'package:fifa_world_cup_2026_app/core/domain/enums/favorite_type.dart';
import 'package:fifa_world_cup_2026_app/features/favorites/presentation/providers/favorites_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/test_data.dart';
import '../helpers/test_providers.dart';

void main() {
  test('test_favorites_provider_adds_and_removes_item', () async {
    final repository = FakeFavoritesRepository();
    final container = ProviderContainer(
      overrides: testRepositoryOverrides(favoritesRepository: repository),
    );
    addTearDown(container.dispose);

    await container.read(favoritesProvider.notifier).load();
    await container.read(favoritesProvider.notifier).addFavorite(fakeFavorite());
    expect(container.read(favoritesProvider).valueOrNull, hasLength(1));

    await container.read(favoritesProvider.notifier).removeFavorite(
          type: FavoriteType.match,
          referenceId: '1',
        );
    expect(container.read(favoritesProvider).valueOrNull, isEmpty);
  });

  test('test_favorites_provider_prevents_duplicates', () async {
    final repository = FakeFavoritesRepository();
    final container = ProviderContainer(
      overrides: testRepositoryOverrides(favoritesRepository: repository),
    );
    addTearDown(container.dispose);

    await container.read(favoritesProvider.notifier).load();
    await container.read(favoritesProvider.notifier).addFavorite(fakeFavorite());
    await container.read(favoritesProvider.notifier).addFavorite(fakeFavorite());

    expect(container.read(favoritesProvider).valueOrNull, hasLength(1));
  });

  test('favorites provider loads persisted favorites', () async {
    final container = ProviderContainer(
      overrides: testRepositoryOverrides(
        favoritesRepository: FakeFavoritesRepository(favorites: [fakeFavorite()]),
      ),
    );
    addTearDown(container.dispose);

    await container.read(favoritesProvider.notifier).load();

    expect(container.read(favoritesProvider).valueOrNull?.first.title, 'USA vs Canada');
  });
}
