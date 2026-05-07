import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_loader.dart';
import '../../../../routes/route_names.dart';
import '../../../../shared/providers/service_providers.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    ref.listenManual(hiveServiceProvider, (previous, next) {
      next.whenData((ready) {
        if (ready && mounted) context.go(RoutePaths.home);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final initState = ref.watch(hiveServiceProvider);
    final appName = AppConfig.current.appName;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: initState.when(
            loading: () => _SplashContent(appName: appName),
            data: (_) => _SplashContent(appName: appName, isReady: true),
            error: (error, stackTrace) => AppErrorView(
              title: 'Initialization failed',
              message: error.toString(),
              onRetry: () => ref.invalidate(hiveServiceProvider),
            ),
          ),
        ),
      ),
      bottomNavigationBar: initState.isLoading
          ? const Padding(
              padding: EdgeInsets.all(24),
              child: AppLoader(label: 'Preparing match data cache'),
            )
          : null,
    );
  }
}

class _SplashContent extends StatelessWidget {
  const _SplashContent({required this.appName, this.isReady = false});

  final String appName;
  final bool isReady;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 112,
          height: 112,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ],
            ),
          ),
          child: const Icon(Icons.sports_soccer, size: 64, color: Colors.white),
        ),
        const SizedBox(height: 28),
        Text(
          appName,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w900,
              ),
        ),
        const SizedBox(height: 10),
        Text(
          isReady ? 'Ready for kickoff' : 'Loading tournament experience',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        if (isReady) ...[
          const SizedBox(height: 24),
          AppButton(
            label: 'Enter app',
            icon: Icons.arrow_forward,
            onPressed: () => context.go(RoutePaths.home),
          ),
        ],
      ],
    );
  }
}
