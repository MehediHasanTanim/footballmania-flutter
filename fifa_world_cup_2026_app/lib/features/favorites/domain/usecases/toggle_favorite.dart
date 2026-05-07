import '../../../../core/utils/result.dart';
import '../entities/favorite_item.dart';
import '../repositories/favorites_repository.dart';

class ToggleFavorite {
  const ToggleFavorite(this._repository);

  final FavoritesRepository _repository;

  Future<Result<bool>> call(FavoriteItem favorite) async {
    final existing = await _repository.isFavorite(type: favorite.type, referenceId: favorite.referenceId);
    if (existing is FailureResult<bool>) return FailureResult(existing.failure);

    final isFavorite = (existing as Success<bool>).data;
    if (isFavorite) {
      final removed = await _repository.removeFavorite(type: favorite.type, referenceId: favorite.referenceId);
      if (removed is FailureResult<void>) return FailureResult(removed.failure);
      return const Success(false);
    }

    final added = await _repository.addFavorite(favorite);
    if (added is FailureResult<FavoriteItem>) return FailureResult(added.failure);
    return const Success(true);
  }
}
