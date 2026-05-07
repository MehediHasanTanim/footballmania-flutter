import 'package:flutter/material.dart';

import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_scaffold.dart';

class TeamsScreen extends StatelessWidget {
  const TeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: 'Teams',
      body: AppEmptyState(
        title: 'Teams',
        message: 'Qualified teams will appear here.',
        icon: Icons.groups,
      ),
    );
  }
}
