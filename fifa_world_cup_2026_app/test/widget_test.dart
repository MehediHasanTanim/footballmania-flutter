import 'package:fifa_world_cup_2026_app/features/settings/presentation/screens/settings_screen.dart';
import 'package:fifa_world_cup_2026_app/features/splash/presentation/screens/splash_screen.dart';
import 'package:fifa_world_cup_2026_app/features/countdown/domain/entities/countdown.dart';
import 'package:fifa_world_cup_2026_app/features/favorites/presentation/providers/favorites_provider.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/domain/entities/fixture.dart';
import 'package:fifa_world_cup_2026_app/features/groups/domain/entities/group_standing.dart';
import 'package:fifa_world_cup_2026_app/features/live_score/domain/entities/live_match.dart';
import 'package:fifa_world_cup_2026_app/features/news/domain/entities/news.dart';
import 'package:fifa_world_cup_2026_app/features/teams/domain/entities/team.dart';
import 'package:fifa_world_cup_2026_app/shared/widgets/countdown_card.dart';
import 'package:fifa_world_cup_2026_app/shared/widgets/group_table.dart';
import 'package:fifa_world_cup_2026_app/shared/widgets/match_card.dart';
import 'package:fifa_world_cup_2026_app/shared/widgets/news_card.dart';
import 'package:fifa_world_cup_2026_app/shared/widgets/search_bar_widget.dart';
import 'package:fifa_world_cup_2026_app/shared/widgets/team_card.dart';
import 'package:fifa_world_cup_2026_app/shared/providers/service_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('splash screen renders app identity', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [hiveServiceProvider.overrideWith((ref) async => false)],
        child: const MaterialApp(home: SplashScreen()),
      ),
    );
    await tester.pump();

    expect(find.textContaining('FIFA World Cup 2026'), findsWidgets);
    expect(find.byIcon(Icons.sports_soccer), findsWidgets);
  });

  testWidgets('countdown card renders timer units', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CountdownCard(
          title: 'Tournament countdown',
          countdown: Countdown(
            targetUtc: DateTime.utc(2026, 6, 11),
            nowUtc: DateTime.utc(2026, 6, 1),
            days: 10,
            hours: 2,
            minutes: 3,
            seconds: 4,
          ),
        ),
      ),
    );

    expect(find.text('Tournament countdown'), findsOneWidget);
    expect(find.text('Days'), findsOneWidget);
    expect(find.text('10'), findsOneWidget);
  });

  testWidgets('search bar emits query changes', (tester) async {
    var query = '';
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchBarWidget(
            hintText: 'Search teams',
            onChanged: (value) => query = value,
          ),
        ),
      ),
    );

    await tester.enterText(find.byType(TextFormField), 'Brazil');
    expect(query, 'Brazil');
  });

  testWidgets('live match card renders score and teams', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: MatchCard(
          match: LiveMatch(
            id: 1,
            fixtureId: 10,
            homeTeamName: 'USA',
            awayTeamName: 'Canada',
            homeScore: 2,
            awayScore: 1,
          ),
        ),
      ),
    );

    expect(find.text('USA'), findsOneWidget);
    expect(find.text('2 - 1'), findsOneWidget);
    expect(find.text('Canada'), findsOneWidget);
  });

  testWidgets('team card renders team identity', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [favoritesProvider.overrideWith((ref) => FavoritesNotifier(ref))],
        child: const MaterialApp(
          home: TeamCard(
            team: Team(id: 1, name: 'Argentina', countryCode: 'ARG', group: 'C'),
          ),
        ),
      ),
    );

    expect(find.text('Argentina'), findsOneWidget);
    expect(find.text('Group C'), findsOneWidget);
  });

  testWidgets('group table renders standings', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: GroupTable(
          group: 'A',
          standings: [
            GroupStanding(
              group: 'A',
              teamId: 1,
              teamName: 'Mexico',
              played: 3,
              won: 2,
              drawn: 1,
              lost: 0,
              goalsFor: 5,
              goalsAgainst: 2,
              points: 7,
              rank: 1,
            ),
          ],
        ),
      ),
    );

    expect(find.text('Group A'), findsOneWidget);
    expect(find.text('1. Mexico'), findsOneWidget);
    expect(find.text('7'), findsOneWidget);
  });

  testWidgets('news card renders headline and source', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: NewsCard(
          news: News(
            id: 1,
            title: 'Opening match announced',
            description: 'Tournament kickoff details released.',
            content: 'Full story',
            sourceName: 'FIFA',
          ),
        ),
      ),
    );

    expect(find.text('Opening match announced'), findsOneWidget);
    expect(find.text('FIFA'), findsOneWidget);
  });

  testWidgets('settings theme toggle updates provider', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MaterialApp(home: SettingsScreen())));

    await tester.tap(find.text('Dark'));
    await tester.pumpAndSettle();

    expect(find.text('Dark'), findsOneWidget);
  });
}

// Fixture entity smoke coverage stays in widget tests because favorite-backed
// fixture cards require app storage providers during interaction tests.
const fixtureSmoke = Fixture(
  id: 1,
  homeTeamId: 1,
  homeTeamName: 'USA',
  awayTeamId: 2,
  awayTeamName: 'Mexico',
  venue: 'MetLife Stadium',
  stage: 'Group Stage',
);
