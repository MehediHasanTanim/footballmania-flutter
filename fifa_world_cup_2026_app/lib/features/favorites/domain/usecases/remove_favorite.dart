import '../../../../core/domain/enums/favorite_type.dart';
import '../../../../core/utils/result.dart';
import '../repositories/favorites_repository.dart';

class RemoveFavorite {
  const RemoveFavorite(this._repository);

  final FavoritesRepository _repository;

  Future<Result<void>> call({required FavoriteType type, required String referenceId}) {
    return _repository.removeFavorite(type: type, referenceId: referenceId);
  }
}
