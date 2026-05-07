import 'package:fifa_world_cup_2026_app/core/domain/enums/favorite_type.dart';
import 'package:fifa_world_cup_2026_app/core/utils/result.dart';
import 'package:fifa_world_cup_2026_app/features/favorites/domain/entities/favorite_item.dart';
import 'package:fifa_world_cup_2026_app/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:fifa_world_cup_2026_app/features/favorites/presentation/providers/favorites_provider.dart';
import 'package:fifa_world_cup_2026_app/shared/providers/repository_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('favorites provider toggles favorite', () async {
    final container = ProviderContainer(
      overrides: [
        favoritesRepositoryProvider.overrideWithValue(_FavoritesRepository()),
      ],
    );
    addTearDown(container.dispose);

    await container.read(favoritesProvider.notifier).load();
    await container
        .read(favoritesProvider.notifier)
        .toggleFavorite(_favorite('1'));

    expect(container.read(favoritesProvider).valueOrNull, hasLength(1));
    expect(container.read(favoriteTeamsProvider), hasLength(1));

    await container
        .read(favoritesProvider.notifier)
        .toggleFavorite(_favorite('1'));

    expect(container.read(favoritesProvider).valueOrNull, isEmpty);
  });
}

class _FavoritesRepository implements FavoritesRepository {
  final Map<String, FavoriteItem> items = {};

  @override
  Future<Result<FavoriteItem>> addFavorite(FavoriteItem favorite) async {
    items[favorite.identityKey] = favorite;
    return Success(favorite);
  }

  @override
  Future<Result<List<FavoriteItem>>> getFavorites() async =>
      Success(items.values.toList(growable: false));

  @override
  Future<Result<bool>> isFavorite({
    required FavoriteType type,
    required String referenceId,
  }) async {
    return Success(items.containsKey('${type.name}:$referenceId'));
  }

  @override
  Future<Result<void>> removeFavorite({
    required FavoriteType type,
    required String referenceId,
  }) async {
    items.remove('${type.name}:$referenceId');
    return const Success(null);
  }
}

FavoriteItem _favorite(String referenceId) {
  return FavoriteItem(
    id: 'team-$referenceId',
    type: FavoriteType.team,
    referenceId: referenceId,
    title: 'Team $referenceId',
    createdAt: DateTime.utc(2026),
  );
}
