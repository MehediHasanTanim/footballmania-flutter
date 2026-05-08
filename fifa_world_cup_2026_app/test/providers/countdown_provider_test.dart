import 'package:fifa_world_cup_2026_app/core/errors/failure.dart';
import 'package:fifa_world_cup_2026_app/features/countdown/presentation/providers/countdown_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/test_data.dart';
import '../helpers/test_providers.dart';

void main() {
  test('countdown provider emits countdown value', () async {
    final container = ProviderContainer(overrides: testRepositoryOverrides());
    addTearDown(container.dispose);

    final result = await container.read(countdownProvider.future);

    expect(result.days, 1);
    expect(result.minutes, 30);
  });

  test('countdown provider handles completed countdown', () async {
    final expired = fakeCountdown(nowUtc: DateTime.utc(2026, 6, 12));
    final container = ProviderContainer(
      overrides: testRepositoryOverrides(
        countdownRepository: FakeCountdownRepository(countdown: expired),
      ),
    );
    addTearDown(container.dispose);

    final result = await container.read(countdownProvider.future);

    expect(result.isExpired, isTrue);
  });

  test('countdown provider emits error state', () async {
    final container = ProviderContainer(
      overrides: testRepositoryOverrides(
        countdownRepository: FakeCountdownRepository(
          failure: const Failure(message: 'countdown unavailable'),
        ),
      ),
    );
    addTearDown(container.dispose);

    await expectLater(container.read(countdownProvider.future), throwsA(isA<Failure>()));
  });
}
