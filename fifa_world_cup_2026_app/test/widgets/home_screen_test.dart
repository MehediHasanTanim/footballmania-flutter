import 'package:fifa_world_cup_2026_app/core/errors/failure.dart';
import 'package:fifa_world_cup_2026_app/features/countdown/presentation/providers/countdown_provider.dart';
import 'package:fifa_world_cup_2026_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/test_data.dart';
import '../helpers/test_providers.dart';

void main() {
  testWidgets('test_home_screen_renders_countdown_and_sections', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          ...testRepositoryOverrides(),
          countdownProvider.overrideWith((ref) => Stream.value(fakeCountdown())),
        ],
        child: const MaterialApp(home: HomeScreen()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Tournament countdown'), findsOneWidget);
    expect(find.text('Next Match'), findsOneWidget);
    await tester.drag(find.byType(ListView), const Offset(0, -600));
    await tester.pumpAndSettle();
    expect(find.text('Latest News'), findsOneWidget);
  });

  testWidgets('test_home_screen_shows_loading_state', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: testRepositoryOverrides(),
        child: const MaterialApp(home: HomeScreen()),
      ),
    );

    expect(find.text('Loading home feed'), findsOneWidget);
  });

  testWidgets('home screen renders error state', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: testRepositoryOverrides(
          homeRepository: FakeHomeRepository(
            failure: const Failure(message: 'home unavailable'),
          ),
        ),
        child: const MaterialApp(home: HomeScreen()),
      ),
    );
    await tester.pump();

    expect(find.textContaining('home unavailable'), findsOneWidget);
  });
}
