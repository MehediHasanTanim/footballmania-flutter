import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/fixtures/data/repositories/fixtures_repository_impl.dart';
import '../../features/fixtures/domain/repositories/fixtures_repository.dart';
import '../../features/countdown/data/repositories/countdown_repository_impl.dart';
import '../../features/countdown/domain/repositories/countdown_repository.dart';
import '../../features/favorites/data/repositories/favorites_repository_impl.dart';
import '../../features/favorites/domain/repositories/favorites_repository.dart';
import '../../features/groups/data/repositories/groups_repository_impl.dart';
import '../../features/groups/domain/repositories/groups_repository.dart';
import '../../features/home/data/repositories/home_repository_impl.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../features/live_score/data/repositories/live_score_repository_impl.dart';
import '../../features/live_score/domain/repositories/live_score_repository.dart';
import '../../features/news/data/repositories/news_repository_impl.dart';
import '../../features/news/domain/repositories/news_repository.dart';
import '../../features/search/data/repositories/recent_search_repository_impl.dart';
import '../../features/search/domain/repositories/recent_search_repository.dart';
import '../../features/teams/data/repositories/teams_repository_impl.dart';
import '../../features/teams/domain/repositories/teams_repository.dart';
import 'core_providers.dart';
import 'data_source_providers.dart';

final fixturesRepositoryProvider = Provider<FixturesRepository>((ref) {
  return FixturesRepositoryImpl(
    remoteDataSource: ref.watch(fixturesRemoteDataSourceProvider),
    localDataSource: ref.watch(fixturesLocalDataSourceProvider),
    networkInfo: ref.watch(networkInfoProvider),
    errorHandler: ref.watch(errorHandlerProvider),
  );
});

final liveScoreRepositoryProvider = Provider<LiveScoreRepository>((ref) {
  return LiveScoreRepositoryImpl(
    remoteDataSource: ref.watch(liveScoreRemoteDataSourceProvider),
    localDataSource: ref.watch(liveScoreLocalDataSourceProvider),
    networkInfo: ref.watch(networkInfoProvider),
    errorHandler: ref.watch(errorHandlerProvider),
  );
});

final teamsRepositoryProvider = Provider<TeamsRepository>((ref) {
  return TeamsRepositoryImpl(
    remoteDataSource: ref.watch(teamsRemoteDataSourceProvider),
    localDataSource: ref.watch(teamsLocalDataSourceProvider),
    networkInfo: ref.watch(networkInfoProvider),
    errorHandler: ref.watch(errorHandlerProvider),
  );
});

final groupsRepositoryProvider = Provider<GroupsRepository>((ref) {
  return GroupsRepositoryImpl(
    remoteDataSource: ref.watch(groupsRemoteDataSourceProvider),
    localDataSource: ref.watch(groupsLocalDataSourceProvider),
    networkInfo: ref.watch(networkInfoProvider),
    errorHandler: ref.watch(errorHandlerProvider),
  );
});

final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  return NewsRepositoryImpl(
    remoteDataSource: ref.watch(newsRemoteDataSourceProvider),
    localDataSource: ref.watch(newsLocalDataSourceProvider),
    networkInfo: ref.watch(networkInfoProvider),
    errorHandler: ref.watch(errorHandlerProvider),
  );
});

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepositoryImpl(
    remoteDataSource: ref.watch(homeRemoteDataSourceProvider),
    localDataSource: ref.watch(homeLocalDataSourceProvider),
    networkInfo: ref.watch(networkInfoProvider),
    errorHandler: ref.watch(errorHandlerProvider),
  );
});

final favoritesRepositoryProvider = Provider<FavoritesRepository>((ref) {
  return FavoritesRepositoryImpl(
    localDataSource: ref.watch(favoritesLocalDataSourceProvider),
    errorHandler: ref.watch(errorHandlerProvider),
  );
});

final recentSearchRepositoryProvider = Provider<RecentSearchRepository>((ref) {
  return RecentSearchRepositoryImpl(
    ref.watch(recentSearchLocalDataSourceProvider),
  );
});

final countdownRepositoryProvider = Provider<CountdownRepository>((ref) {
  return const CountdownRepositoryImpl();
});
