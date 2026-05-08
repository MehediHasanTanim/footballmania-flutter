import 'package:fifa_world_cup_2026_app/core/errors/failure.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/presentation/providers/fixtures_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/test_data.dart';
import '../helpers/test_providers.dart';

void main() {
  test('test_fixtures_provider_emits_loading_then_data', () async {
    final repository = FakeFixturesRepository(fixtures: fakeFixtures);
    final container = ProviderContainer(
      overrides: testRepositoryOverrides(fixturesRepository: repository),
    );
    addTearDown(container.dispose);

    expect(container.read(fixturesProvider).isLoading, isTrue);
    final result = await container.read(fixturesProvider.future);

    expect(result, hasLength(3));
  });

  test('fixtures provider emits empty state data', () async {
    final container = ProviderContainer(
      overrides: testRepositoryOverrides(
        fixturesRepository: FakeFixturesRepository(fixtures: const []),
      ),
    );
    addTearDown(container.dispose);

    final result = await container.read(fixturesProvider.future);

    expect(result, isNotEmpty);
  });

  test('test_fixtures_provider_emits_error_on_failure', () async {
    final container = ProviderContainer(
      overrides: testRepositoryOverrides(
        fixturesRepository: FakeFixturesRepository(
          failure: const Failure(message: 'network error'),
        ),
      ),
    );
    addTearDown(container.dispose);

    await expectLater(container.read(fixturesProvider.future), throwsA(isA<Failure>()));
  });

  test('fixtures provider refresh reloads data', () async {
    final repository = FakeFixturesRepository(fixtures: fakeFixtures);
    final container = ProviderContainer(
      overrides: testRepositoryOverrides(fixturesRepository: repository),
    );
    addTearDown(container.dispose);

    await container.read(fixturesProvider.future);
    await container.read(fixturesProvider.notifier).refresh();

    expect(repository.calls, 2);
  });
}
