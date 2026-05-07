import '../../../../core/domain/enums/favorite_type.dart';
import '../../../../core/utils/result.dart';
import '../repositories/favorites_repository.dart';

class IsFavorite {
  const IsFavorite(this._repository);

  final FavoritesRepository _repository;

  Future<Result<bool>> call({required FavoriteType type, required String referenceId}) {
    return _repository.isFavorite(type: type, referenceId: referenceId);
  }
}
