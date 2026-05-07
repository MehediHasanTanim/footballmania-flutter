import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/domain/enums/favorite_type.dart';
import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loader.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../shared/widgets/section_header.dart';
import '../../domain/entities/favorite_item.dart';
import '../providers/favorites_provider.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);
    final teams = ref.watch(favoriteTeamsProvider);
    final matches = ref.watch(favoriteMatchesProvider);

    return AppScaffold(
      title: 'Favorites',
      body: favorites.when(
        loading: () => const AppLoader(label: 'Loading favorites'),
        error: (error, stackTrace) => AppErrorView(
          message: error.toString(),
          onRetry: () => ref.read(favoritesProvider.notifier).refresh(),
        ),
        data: (_) {
          if (teams.isEmpty && matches.isEmpty) {
            return const AppEmptyState(
              title: 'No favorites yet',
              message: 'Favorite teams and matches to build your personal World Cup hub.',
              icon: Icons.favorite_border,
            );
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(favoritesProvider.notifier).refresh(),
            child: ListView(
              children: [
                const SectionHeader(title: 'Favorite Teams'),
                if (teams.isEmpty)
                  const _EmptySection(message: 'No favorite teams')
                else
                  ...teams.map((favorite) => _FavoriteTile(favorite: favorite)),
                const SectionHeader(title: 'Favorite Matches'),
                if (matches.isEmpty)
                  const _EmptySection(message: 'No favorite matches')
                else
                  ...matches.map((favorite) => _FavoriteTile(favorite: favorite)),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _FavoriteTile extends ConsumerWidget {
  const _FavoriteTile({required this.favorite});

  final FavoriteItem favorite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final route = favorite.type == FavoriteType.team
        ? '/teams/${favorite.referenceId}'
        : '/fixtures/${favorite.referenceId}';
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: favorite.imageUrl == null ? null : NetworkImage(favorite.imageUrl!),
          child: favorite.imageUrl == null ? Icon(favorite.type == FavoriteType.team ? Icons.groups : Icons.event) : null,
        ),
        title: Text(favorite.title),
        subtitle: Text(favorite.subtitle ?? favorite.type.name),
        onTap: () => context.push(route),
        trailing: IconButton(
          tooltip: 'Remove favorite',
          onPressed: () => ref.read(favoritesProvider.notifier).removeFavorite(
                type: favorite.type,
                referenceId: favorite.referenceId,
              ),
          icon: const Icon(Icons.delete_outline),
        ),
      ),
    );
  }
}

class _EmptySection extends StatelessWidget {
  const _EmptySection({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(message),
      ),
    );
  }
}
