import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fifa_world_cup_2026_app/shared/providers/core_providers.dart';

final connectivityStatusProvider = StreamProvider<bool>((ref) {
  return ref.watch(connectivityServiceProvider).onConnectivityChanged;
});

final isOnlineProvider = FutureProvider<bool>((ref) {
  return ref.watch(connectivityServiceProvider).isOnline;
});
