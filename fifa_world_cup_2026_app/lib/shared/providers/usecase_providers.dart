import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/countdown/domain/usecases/calculate_countdown.dart';
import '../../features/countdown/domain/usecases/get_match_countdown.dart';
import '../../features/countdown/domain/usecases/get_tournament_countdown.dart';
import '../../features/favorites/domain/usecases/add_favorite.dart';
import '../../features/favorites/domain/usecases/get_favorites.dart';
import '../../features/favorites/domain/usecases/is_favorite.dart';
import '../../features/favorites/domain/usecases/remove_favorite.dart';
import '../../features/favorites/domain/usecases/toggle_favorite.dart';
import '../../features/fixtures/domain/usecases/filter_fixtures.dart';
import '../../features/fixtures/domain/usecases/get_fixture_by_id.dart';
import '../../features/fixtures/domain/usecases/get_fixtures.dart';
import '../../features/fixtures/domain/usecases/sort_fixtures_by_date.dart';
import '../../features/groups/domain/usecases/get_group_standings.dart';
import '../../features/groups/domain/usecases/sort_group_standings.dart';
import '../../features/live_score/domain/usecases/get_live_scores.dart';
import '../../features/live_score/domain/usecases/get_match_events.dart';
import '../../features/news/domain/usecases/get_news.dart';
import '../../features/news/domain/usecases/search_news.dart';
import '../../features/news/domain/usecases/sort_news_by_published_date.dart';
import '../../features/teams/domain/usecases/get_team_by_id.dart';
import '../../features/teams/domain/usecases/get_teams.dart';
import 'repository_providers.dart';

final getFixturesUseCaseProvider = Provider<GetFixtures>((ref) => GetFixtures(ref.watch(fixturesRepositoryProvider)));
final getFixtureByIdUseCaseProvider = Provider<GetFixtureById>((ref) => GetFixtureById(ref.watch(fixturesRepositoryProvider)));
final filterFixturesUseCaseProvider = Provider<FilterFixtures>((ref) => const FilterFixtures());
final sortFixturesByDateUseCaseProvider = Provider<SortFixturesByDate>((ref) => const SortFixturesByDate());

final getLiveScoresUseCaseProvider = Provider<GetLiveScores>((ref) => GetLiveScores(ref.watch(liveScoreRepositoryProvider)));
final getMatchEventsUseCaseProvider = Provider<GetMatchEvents>((ref) => GetMatchEvents(ref.watch(liveScoreRepositoryProvider)));

final getTeamsUseCaseProvider = Provider<GetTeams>((ref) => GetTeams(ref.watch(teamsRepositoryProvider)));
final getTeamByIdUseCaseProvider = Provider<GetTeamById>((ref) => GetTeamById(ref.watch(teamsRepositoryProvider)));

final getGroupStandingsUseCaseProvider = Provider<GetGroupStandings>((ref) => GetGroupStandings(ref.watch(groupsRepositoryProvider)));
final sortGroupStandingsUseCaseProvider = Provider<SortGroupStandings>((ref) => const SortGroupStandings());

final getNewsUseCaseProvider = Provider<GetNews>((ref) => GetNews(ref.watch(newsRepositoryProvider)));
final searchNewsUseCaseProvider = Provider<SearchNews>((ref) => SearchNews(ref.watch(newsRepositoryProvider)));
final sortNewsByPublishedDateUseCaseProvider = Provider<SortNewsByPublishedDate>((ref) => const SortNewsByPublishedDate());

final getFavoritesUseCaseProvider = Provider<GetFavorites>((ref) => GetFavorites(ref.watch(favoritesRepositoryProvider)));
final addFavoriteUseCaseProvider = Provider<AddFavorite>((ref) => AddFavorite(ref.watch(favoritesRepositoryProvider)));
final removeFavoriteUseCaseProvider = Provider<RemoveFavorite>((ref) => RemoveFavorite(ref.watch(favoritesRepositoryProvider)));
final toggleFavoriteUseCaseProvider = Provider<ToggleFavorite>((ref) => ToggleFavorite(ref.watch(favoritesRepositoryProvider)));
final isFavoriteUseCaseProvider = Provider<IsFavorite>((ref) => IsFavorite(ref.watch(favoritesRepositoryProvider)));

final calculateCountdownUseCaseProvider = Provider<CalculateCountdown>((ref) => const CalculateCountdown());
final getTournamentCountdownUseCaseProvider = Provider<GetTournamentCountdown>((ref) {
  return GetTournamentCountdown(repository: ref.watch(countdownRepositoryProvider));
});
final getMatchCountdownUseCaseProvider = Provider<GetMatchCountdown>((ref) {
  return GetMatchCountdown(repository: ref.watch(countdownRepositoryProvider));
});
