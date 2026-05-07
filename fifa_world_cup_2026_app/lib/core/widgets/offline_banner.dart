import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class OfflineBanner extends StatelessWidget {
  const OfflineBanner({super.key, this.isOnline = true});

  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    if (isOnline) return const SizedBox.shrink();

    return Material(
      color: AppColors.warning,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.wifi_off, size: 18, color: Colors.black),
              const SizedBox(width: 8),
              Text(
                'You are offline',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
