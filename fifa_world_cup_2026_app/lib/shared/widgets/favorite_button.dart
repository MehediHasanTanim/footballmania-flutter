import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/domain/enums/favorite_type.dart';
import '../../features/favorites/domain/entities/favorite_item.dart';
import '../../features/favorites/presentation/providers/favorites_provider.dart';

class FavoriteButton extends ConsumerWidget {
  const FavoriteButton({super.key, required this.favorite});

  final FavoriteItem favorite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(
      favoritesProvider.select(
        (value) =>
            value.valueOrNull?.any(
              (item) =>
                  item.type == favorite.type &&
                  item.referenceId == favorite.referenceId,
            ) ??
            false,
      ),
    );
    final label = favorite.type == FavoriteType.team ? 'team' : 'match';

    return IconButton.filledTonal(
      tooltip: isFavorite ? 'Remove favorite $label' : 'Favorite $label',
      onPressed: () =>
          ref.read(favoritesProvider.notifier).toggleFavorite(favorite),
      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
    );
  }
}
