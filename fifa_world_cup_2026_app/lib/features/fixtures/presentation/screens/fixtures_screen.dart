import 'package:flutter/material.dart';

import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_scaffold.dart';

class FixturesScreen extends StatelessWidget {
  const FixturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: 'Fixtures',
      body: AppEmptyState(
        title: 'Fixtures',
        message: 'Match fixtures will appear here.',
        icon: Icons.event,
      ),
    );
  }
}
