import 'package:fifa_world_cup_2026_app/core/domain/enums/favorite_type.dart';
import 'package:fifa_world_cup_2026_app/core/domain/enums/match_status.dart';
import 'package:fifa_world_cup_2026_app/features/countdown/domain/entities/countdown.dart';
import 'package:fifa_world_cup_2026_app/features/favorites/domain/entities/favorite_item.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/data/models/fixture_dto.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/domain/entities/fixture.dart';
import 'package:fifa_world_cup_2026_app/features/home/domain/entities/home_summary.dart';
import 'package:fifa_world_cup_2026_app/features/news/data/models/news_dto.dart';
import 'package:fifa_world_cup_2026_app/features/news/domain/entities/news.dart';

final fakeCountdownTargetUtc = DateTime.utc(2026, 6, 11, 19);
final fakeNowUtc = DateTime.utc(2026, 6, 10, 18, 30);

Countdown fakeCountdown({DateTime? nowUtc}) {
  final effectiveNowUtc = nowUtc ?? fakeNowUtc;
  return Countdown(
    targetUtc: fakeCountdownTargetUtc,
    nowUtc: effectiveNowUtc,
    days: 1,
    hours: 0,
    minutes: 30,
    seconds: 0,
  );
}

Fixture fakeFixture({
  int id = 1,
  int homeTeamId = 10,
  int awayTeamId = 20,
  String homeTeamName = 'USA',
  String awayTeamName = 'Canada',
  String venue = 'MetLife Stadium',
  String stage = 'Group Stage',
  String? group = 'A',
  MatchStatus status = MatchStatus.upcoming,
  DateTime? matchDateUtc,
}) {
  return Fixture(
    id: id,
    homeTeamId: homeTeamId,
    homeTeamName: homeTeamName,
    awayTeamId: awayTeamId,
    awayTeamName: awayTeamName,
    matchDateUtc: matchDateUtc ?? DateTime.utc(2026, 6, 11, 19),
    venue: venue,
    stage: stage,
    group: group,
    status: status,
  );
}

List<Fixture> fakeFixtures = [
  fakeFixture(),
  fakeFixture(
    id: 2,
    homeTeamId: 30,
    awayTeamId: 40,
    homeTeamName: 'Mexico',
    awayTeamName: 'Brazil',
    venue: 'Azteca Stadium',
    group: 'B',
    status: MatchStatus.live,
    matchDateUtc: DateTime.utc(2026, 6, 12, 20),
  ),
  fakeFixture(
    id: 3,
    homeTeamId: 50,
    awayTeamId: 60,
    homeTeamName: 'Argentina',
    awayTeamName: 'France',
    venue: 'SoFi Stadium',
    stage: 'Final',
    group: null,
    status: MatchStatus.completed,
    matchDateUtc: DateTime.utc(2026, 7, 19, 19),
  ),
];

FixtureDto fakeFixtureDto({int id = 1}) => FixtureDto.fromEntity(
  fakeFixture(id: id, homeTeamId: id * 10, awayTeamId: id * 10 + 1),
);

News fakeNews({
  int id = 1,
  String title = 'World Cup draw confirmed',
  String description = 'Tournament groups are set.',
  String content = 'Fixtures and teams are ready for 2026.',
  String sourceName = 'FIFA',
  DateTime? publishedAt,
}) {
  return News(
    id: id,
    title: title,
    description: description,
    content: content,
    sourceName: sourceName,
    publishedAt: publishedAt ?? DateTime.utc(2026, 1, 1),
    url: 'https://example.test/news/$id',
  );
}

List<News> fakeNewsList = [
  fakeNews(),
  fakeNews(
    id: 2,
    title: 'USA announces squad',
    description: 'The host nation names players.',
    content: 'The final roster includes experienced players.',
    sourceName: 'ESPN',
    publishedAt: DateTime.utc(2026, 1, 2),
  ),
];

NewsDto fakeNewsDto({int id = 1}) => NewsDto.fromEntity(fakeNews(id: id));

FavoriteItem fakeFavorite({
  FavoriteType type = FavoriteType.match,
  String referenceId = '1',
  String title = 'USA vs Canada',
}) {
  return FavoriteItem(
    id: '${type.name}:$referenceId',
    type: type,
    referenceId: referenceId,
    title: title,
    subtitle: type.name,
    createdAt: DateTime.utc(2026, 1, 1),
  );
}

HomeSummary fakeHomeSummary() => HomeSummary(
  countdownTargetDate: fakeCountdownTargetUtc,
  nextMatch: fakeFixtures.first,
  latestNews: fakeNewsList,
);
