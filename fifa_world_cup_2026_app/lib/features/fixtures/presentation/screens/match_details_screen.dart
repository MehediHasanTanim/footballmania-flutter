import 'package:flutter/material.dart';

import '../../../../core/widgets/app_scaffold.dart';

class MatchDetailsScreen extends StatelessWidget {
  const MatchDetailsScreen({super.key, required this.matchId});

  final String matchId;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Match Details',
      body: Center(
        child: Text(
          'Match ID: $matchId',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
