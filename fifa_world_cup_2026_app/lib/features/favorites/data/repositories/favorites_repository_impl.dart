import '../../../../core/domain/enums/favorite_type.dart';
import '../../../../core/errors/error_handler.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/favorite_item.dart';
import '../../domain/repositories/favorites_repository.dart';
import '../datasources/favorites_local_data_source.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  const FavoritesRepositoryImpl({required FavoritesLocalDataSource localDataSource, required ErrorHandler errorHandler})
    : _localDataSource = localDataSource,
      _errorHandler = errorHandler;

  final FavoritesLocalDataSource _localDataSource;
  final ErrorHandler _errorHandler;

  @override
  Future<Result<List<FavoriteItem>>> getFavorites() async {
    try {
      return Success(_localDataSource.getFavorites());
    } catch (error, stackTrace) {
      return FailureResult(_errorHandler.failureFromException(error, stackTrace));
    }
  }

  @override
  Future<Result<FavoriteItem>> addFavorite(FavoriteItem favorite) async {
    try {
      if (_localDataSource.isFavorite(type: favorite.type, referenceId: favorite.referenceId)) {
        return Success(favorite);
      }
      await _localDataSource.saveFavorite(favorite);
      return Success(favorite);
    } catch (error, stackTrace) {
      return FailureResult(_errorHandler.failureFromException(error, stackTrace));
    }
  }

  @override
  Future<Result<bool>> isFavorite({required FavoriteType type, required String referenceId}) async {
    try {
      return Success(_localDataSource.isFavorite(type: type, referenceId: referenceId));
    } catch (error, stackTrace) {
      return FailureResult(_errorHandler.failureFromException(error, stackTrace));
    }
  }

  @override
  Future<Result<void>> removeFavorite({required FavoriteType type, required String referenceId}) async {
    try {
      await _localDataSource.removeFavorite(type: type, referenceId: referenceId);
      return const Success(null);
    } catch (error, stackTrace) {
      return FailureResult(_errorHandler.failureFromException(error, stackTrace));
    }
  }
}
