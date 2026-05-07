import 'package:flutter/material.dart';

import '../../../../core/widgets/app_scaffold.dart';

class TeamDetailsScreen extends StatelessWidget {
  const TeamDetailsScreen({super.key, required this.teamId});

  final String teamId;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Team Details',
      body: Center(
        child: Text(
          'Team ID: $teamId',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
