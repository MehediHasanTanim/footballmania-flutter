import 'package:flutter/material.dart';

import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_scaffold.dart';

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: 'Groups',
      body: AppEmptyState(
        title: 'Groups',
        message: 'Tournament groups will appear here.',
        icon: Icons.view_module,
      ),
    );
  }
}
