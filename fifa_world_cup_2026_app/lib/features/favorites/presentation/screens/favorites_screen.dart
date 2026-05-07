import 'package:flutter/material.dart';

import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_scaffold.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: 'Favorites',
      body: AppEmptyState(
        title: 'Favorites',
        message: 'Saved teams, matches, and news will appear here.',
        icon: Icons.favorite,
      ),
    );
  }
}
