import 'package:flutter/material.dart';

import '../../../../core/widgets/app_scaffold.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key, required this.newsId});

  final String newsId;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'News Details',
      body: Center(
        child: Text(
          'News ID: $newsId',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
