import '../../../../core/constants/hive_constants.dart';
import '../../../../core/domain/enums/favorite_type.dart';
import '../../../../core/storage/cache_service.dart';
import '../../domain/entities/favorite_item.dart';
import '../models/cached_favorite.dart';

class FavoritesLocalDataSource {
  const FavoritesLocalDataSource(this._cacheService);

  final CacheService _cacheService;

  List<FavoriteItem> getFavorites() {
    return _cacheService
        .values<CachedFavorite>(HiveConstants.favoritesBox)
        .map(_toEntity)
        .toList(growable: false);
  }

  Future<void> saveFavorite(FavoriteItem favorite) {
    return _cacheService.put<CachedFavorite>(
      HiveConstants.favoritesBox,
      favorite.identityKey,
      _toCached(favorite),
    );
  }

  Future<void> removeFavorite({required FavoriteType type, required String referenceId}) async {
    final existing = _cacheService.get<CachedFavorite>(HiveConstants.favoritesBox, _key(type, referenceId));
    if (existing != null) await existing.delete();
  }

  bool isFavorite({required FavoriteType type, required String referenceId}) {
    return _cacheService.get<CachedFavorite>(HiveConstants.favoritesBox, _key(type, referenceId)) != null;
  }

  String _key(FavoriteType type, String referenceId) => '${type.name}:$referenceId';

  FavoriteItem _toEntity(CachedFavorite favorite) {
    return FavoriteItem(
      id: favorite.id,
      type: FavoriteType.fromString(favorite.type),
      referenceId: favorite.referenceId,
      title: favorite.title,
      subtitle: favorite.subtitle,
      imageUrl: favorite.imageUrl,
      createdAt: favorite.createdAt,
    );
  }

  CachedFavorite _toCached(FavoriteItem favorite) {
    final now = DateTime.now().toUtc();
    return CachedFavorite(
      id: favorite.id,
      type: favorite.type.name,
      referenceId: favorite.referenceId,
      title: favorite.title,
      subtitle: favorite.subtitle,
      imageUrl: favorite.imageUrl,
      createdAt: favorite.createdAt,
      updatedAt: now,
    );
  }
}
