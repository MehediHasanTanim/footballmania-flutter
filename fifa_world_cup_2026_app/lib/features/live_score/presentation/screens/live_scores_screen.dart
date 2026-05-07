import 'package:flutter/material.dart';

import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_scaffold.dart';

class LiveScoresScreen extends StatelessWidget {
  const LiveScoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: 'Live Scores',
      body: AppEmptyState(
        title: 'Live Scores',
        message: 'Live match updates will appear here.',
        icon: Icons.scoreboard,
      ),
    );
  }
}
