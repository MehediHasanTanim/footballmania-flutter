import '../../../../core/domain/enums/favorite_type.dart';
import '../../../../core/utils/result.dart';
import '../entities/favorite_item.dart';

abstract class FavoritesRepository {
  Future<Result<List<FavoriteItem>>> getFavorites();

  Future<Result<FavoriteItem>> addFavorite(FavoriteItem favorite);

  Future<Result<void>> removeFavorite({required FavoriteType type, required String referenceId});

  Future<Result<bool>> isFavorite({required FavoriteType type, required String referenceId});
}
