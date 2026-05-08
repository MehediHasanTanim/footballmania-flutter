import 'package:fifa_world_cup_2026_app/core/network/connectivity_provider.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/presentation/screens/fixtures_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/test_data.dart';
import '../helpers/test_providers.dart';

void main() {
  testWidgets('test_fixtures_screen_renders_fixture_list', (tester) async {
    await tester.pumpWidget(_fixtureApp());
    await tester.pump();

    expect(find.text('USA'), findsWidgets);
    expect(find.text('3 fixtures'), findsOneWidget);
  });

  testWidgets('test_fixtures_screen_filter_button_opens_filter_panel', (tester) async {
    await tester.pumpWidget(_fixtureApp());
    await tester.pump();

    await tester.tap(find.byTooltip('Filters'));
    await tester.pumpAndSettle();

    expect(find.textContaining('Filter'), findsWidgets);
  });

  testWidgets('fixtures screen search input filters list', (tester) async {
    await tester.pumpWidget(_fixtureApp());
    await tester.pump();

    await tester.enterText(find.byType(TextField), 'Mexico');
    await tester.pump(const Duration(milliseconds: 400));

    expect(find.textContaining('Mexico'), findsWidgets);
  });
}

Widget _fixtureApp() {
  return ProviderScope(
    overrides: [
      ...testRepositoryOverrides(fixturesRepository: FakeFixturesRepository(fixtures: fakeFixtures)),
      connectivityStatusProvider.overrideWith((ref) => Stream.value(true)),
    ],
    child: const MaterialApp(home: FixturesScreen()),
  );
}
