import 'package:fifa_world_cup_2026_app/core/domain/enums/favorite_type.dart';
import 'package:fifa_world_cup_2026_app/core/utils/result.dart';
import 'package:fifa_world_cup_2026_app/features/favorites/domain/entities/favorite_item.dart';
import 'package:fifa_world_cup_2026_app/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:fifa_world_cup_2026_app/features/favorites/domain/usecases/add_favorite.dart';
import 'package:fifa_world_cup_2026_app/features/favorites/domain/usecases/toggle_favorite.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late _InMemoryFavoritesRepository repository;
  late ToggleFavorite toggleFavorite;
  late AddFavorite addFavorite;

  setUp(() {
    repository = _InMemoryFavoritesRepository();
    toggleFavorite = ToggleFavorite(repository);
    addFavorite = AddFavorite(repository);
  });

  test('adds favorite', () async {
    final result = await toggleFavorite(_favorite('1'));

    expect(result, isA<Success<bool>>());
    expect((result as Success<bool>).data, isTrue);
    expect(repository.items.length, 1);
  });

  test('removes favorite', () async {
    await toggleFavorite(_favorite('1'));
    final result = await toggleFavorite(_favorite('1'));

    expect((result as Success<bool>).data, isFalse);
    expect(repository.items, isEmpty);
  });

  test('prevents duplicate favorite', () async {
    await addFavorite(_favorite('1'));
    await addFavorite(_favorite('1'));

    expect(repository.items.length, 1);
  });
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

class _InMemoryFavoritesRepository implements FavoritesRepository {
  final Map<String, FavoriteItem> items = {};

  @override
  Future<Result<FavoriteItem>> addFavorite(FavoriteItem favorite) async {
    items.putIfAbsent(favorite.identityKey, () => favorite);
    return Success(items[favorite.identityKey]!);
  }

  @override
  Future<Result<List<FavoriteItem>>> getFavorites() async => Success(items.values.toList(growable: false));

  @override
  Future<Result<bool>> isFavorite({required FavoriteType type, required String referenceId}) async {
    return Success(items.containsKey('${type.name}:$referenceId'));
  }

  @override
  Future<Result<void>> removeFavorite({required FavoriteType type, required String referenceId}) async {
    items.remove('${type.name}:$referenceId');
    return const Success(null);
  }
}
