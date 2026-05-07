import 'package:flutter/material.dart';

import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_scaffold.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: 'Settings',
      body: AppEmptyState(
        title: 'Settings',
        message: 'App preferences will appear here.',
        icon: Icons.settings,
      ),
    );
  }
}
