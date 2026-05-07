import '../../../../core/utils/result.dart';
import '../entities/favorite_item.dart';
import '../repositories/favorites_repository.dart';

class AddFavorite {
  const AddFavorite(this._repository);

  final FavoritesRepository _repository;

  Future<Result<FavoriteItem>> call(FavoriteItem favorite) =>
      _repository.addFavorite(favorite);
}
