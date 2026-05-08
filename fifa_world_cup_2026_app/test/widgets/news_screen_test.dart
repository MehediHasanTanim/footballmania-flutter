import 'package:fifa_world_cup_2026_app/core/errors/failure.dart';
import 'package:fifa_world_cup_2026_app/features/news/presentation/screens/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/test_data.dart';
import '../helpers/test_providers.dart';

void main() {
  testWidgets('test_news_screen_renders_news_cards', (tester) async {
    await tester.pumpWidget(_newsApp());
    await tester.pump();

    expect(find.text('World Cup draw confirmed'), findsOneWidget);
    expect(find.text('2 articles'), findsOneWidget);
  });

  testWidgets('news screen search input works', (tester) async {
    await tester.pumpWidget(_newsApp());
    await tester.pump();

    await tester.enterText(find.byType(TextField), 'squad');
    await tester.pump(const Duration(milliseconds: 400));

    expect(find.text('USA announces squad'), findsOneWidget);
  });

  testWidgets('news screen error retry button renders', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: testRepositoryOverrides(
          newsRepository: FakeNewsRepository(
            failure: const Failure(message: 'news unavailable'),
          ),
        ),
        child: const MaterialApp(home: NewsScreen()),
      ),
    );
    await tester.pump();

    expect(find.textContaining('news unavailable'), findsOneWidget);
  });
}

Widget _newsApp() {
  return ProviderScope(
    overrides: testRepositoryOverrides(newsRepository: FakeNewsRepository(news: fakeNewsList)),
    child: const MaterialApp(home: NewsScreen()),
  );
}
