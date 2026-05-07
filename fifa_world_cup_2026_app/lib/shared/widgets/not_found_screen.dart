import 'package:flutter/material.dart';

import '../../core/widgets/app_error_view.dart';
import '../../core/widgets/app_scaffold.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key, this.location});

  final String? location;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Page Not Found',
      body: AppErrorView(
        title: 'Route not found',
        message: location == null
            ? 'This page does not exist.'
            : 'No route matches $location.',
      ),
    );
  }
}
