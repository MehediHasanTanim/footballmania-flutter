import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/domain/enums/favorite_type.dart';
import '../../../../core/utils/result.dart';
import '../../../../shared/providers/usecase_providers.dart';
import '../../domain/entities/favorite_item.dart';

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, AsyncValue<List<FavoriteItem>>>((
      ref,
    ) {
      return FavoritesNotifier(ref)..load();
    });

final favoriteTeamsProvider = Provider<List<FavoriteItem>>((ref) {
  final favorites = ref.watch(
    favoritesProvider.select(
      (value) => value.valueOrNull ?? const <FavoriteItem>[],
    ),
  );
  return favorites
      .where((item) => item.type == FavoriteType.team)
      .toList(growable: false);
});

final favoriteMatchesProvider = Provider<List<FavoriteItem>>((ref) {
  final favorites = ref.watch(
    favoritesProvider.select(
      (value) => value.valueOrNull ?? const <FavoriteItem>[],
    ),
  );
  return favorites
      .where((item) => item.type == FavoriteType.match)
      .toList(growable: false);
});

class FavoritesNotifier extends StateNotifier<AsyncValue<List<FavoriteItem>>> {
  FavoritesNotifier(this._ref) : super(const AsyncLoading());

  final Ref _ref;

  Future<void> load() async {
    state = const AsyncLoading();
    final result = await _ref.read(getFavoritesUseCaseProvider)();
    state = switch (result) {
      Success<List<FavoriteItem>>(:final data) => AsyncData(data),
      FailureResult<List<FavoriteItem>>(:final failure) => AsyncError(
        failure,
        StackTrace.current,
      ),
    };
  }

  Future<void> refresh() => load();

  Future<void> addFavorite(FavoriteItem favorite) async {
    final previous = state.valueOrNull ?? const <FavoriteItem>[];
    state = AsyncData([
      ...previous.where((item) => item.identityKey != favorite.identityKey),
      favorite,
    ]);
    final result = await _ref.read(addFavoriteUseCaseProvider)(favorite);
    if (result is FailureResult<FavoriteItem>) {
      state = AsyncData(previous);
      state = AsyncError(result.failure, StackTrace.current);
      return;
    }
    await load();
  }

  Future<void> removeFavorite({
    required FavoriteType type,
    required String referenceId,
  }) async {
    final previous = state.valueOrNull ?? const <FavoriteItem>[];
    state = AsyncData(
      previous
          .where((item) => item.type != type || item.referenceId != referenceId)
          .toList(growable: false),
    );
    final result = await _ref.read(removeFavoriteUseCaseProvider)(
      type: type,
      referenceId: referenceId,
    );
    if (result is FailureResult<void>) {
      state = AsyncData(previous);
      state = AsyncError(result.failure, StackTrace.current);
      return;
    }
    await load();
  }

  Future<void> toggleFavorite(FavoriteItem favorite) async {
    final previous = state.valueOrNull ?? const <FavoriteItem>[];
    final exists = previous.any(
      (item) => item.identityKey == favorite.identityKey,
    );
    state = AsyncData(
      exists
          ? previous
                .where((item) => item.identityKey != favorite.identityKey)
                .toList(growable: false)
          : [...previous, favorite],
    );

    final result = await _ref.read(toggleFavoriteUseCaseProvider)(favorite);
    if (result is FailureResult<bool>) {
      state = AsyncData(previous);
      state = AsyncError(result.failure, StackTrace.current);
      return;
    }
    await load();
  }

  bool isFavorite({required FavoriteType type, required String referenceId}) {
    return state.valueOrNull?.any(
          (item) => item.type == type && item.referenceId == referenceId,
        ) ??
        false;
  }

  Future<bool> checkFavoriteStatus({
    required FavoriteType type,
    required String referenceId,
  }) async {
    final result = await _ref.read(isFavoriteUseCaseProvider)(
      type: type,
      referenceId: referenceId,
    );
    return switch (result) {
      Success<bool>(:final data) => data,
      FailureResult<bool>(:final failure) => throw failure,
    };
  }
}
