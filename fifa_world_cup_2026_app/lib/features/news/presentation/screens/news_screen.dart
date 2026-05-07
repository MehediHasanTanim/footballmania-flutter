import 'package:flutter/material.dart';

import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_scaffold.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: 'News',
      body: AppEmptyState(
        title: 'News',
        message: 'World Cup news will appear here.',
        icon: Icons.article,
      ),
    );
  }
}
