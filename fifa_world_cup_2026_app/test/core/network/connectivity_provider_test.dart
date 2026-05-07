import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fifa_world_cup_2026_app/core/network/connectivity_provider.dart';
import 'package:fifa_world_cup_2026_app/core/network/connectivity_service.dart';
import 'package:fifa_world_cup_2026_app/shared/providers/core_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('connectivity service exposes current online state', () async {
    final service = ConnectivityService(
      statusReader: () async => [ConnectivityResult.wifi],
    );

    final isOnline = await service.isOnline.timeout(const Duration(seconds: 1));

    expect(isOnline, isTrue);
  });

  test('connectivityStatusProvider emits changes', () async {
    final controller = StreamController<List<ConnectivityResult>>();
    addTearDown(controller.close);
    final values = <bool>[];
    final service = ConnectivityService(
      statusReader: () async => [ConnectivityResult.none],
      statusStream: () => controller.stream,
    );

    final container = ProviderContainer(
      overrides: [connectivityServiceProvider.overrideWithValue(service)],
    );
    addTearDown(container.dispose);

    final subscription = container.listen(connectivityStatusProvider, (
      previous,
      next,
    ) {
      final value = next.valueOrNull;
      if (value != null) values.add(value);
    });
    addTearDown(subscription.close);

    controller.add([ConnectivityResult.none]);
    controller.add([ConnectivityResult.mobile]);

    await Future<void>.delayed(Duration.zero);

    expect(values, [false, true]);
  });
}
