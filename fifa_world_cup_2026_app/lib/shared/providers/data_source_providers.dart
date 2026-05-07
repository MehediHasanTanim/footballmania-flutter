import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/api_service.dart';
import '../../core/storage/cache_service.dart';
import '../../features/fixtures/data/datasources/fixtures_local_data_source.dart';
import '../../features/fixtures/data/datasources/fixtures_remote_data_source.dart';
import '../../features/favorites/data/datasources/favorites_local_data_source.dart';
import '../../features/groups/data/datasources/groups_local_data_source.dart';
import '../../features/groups/data/datasources/groups_remote_data_source.dart';
import '../../features/home/data/datasources/home_local_data_source.dart';
import '../../features/home/data/datasources/home_remote_data_source.dart';
import '../../features/live_score/data/datasources/live_score_local_data_source.dart';
import '../../features/live_score/data/datasources/live_score_remote_data_source.dart';
import '../../features/news/data/datasources/news_local_data_source.dart';
import '../../features/news/data/datasources/news_remote_data_source.dart';
import '../../features/teams/data/datasources/teams_local_data_source.dart';
import '../../features/teams/data/datasources/teams_remote_data_source.dart';
import 'core_providers.dart';

final cacheServiceProvider = Provider<CacheService>(
  (ref) => const CacheService(),
);

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService(
    dioClient: ref.watch(dioClientProvider),
    errorHandler: ref.watch(errorHandlerProvider),
  );
});

final fixturesRemoteDataSourceProvider = Provider<FixturesRemoteDataSource>((
  ref,
) {
  return FixturesRemoteDataSource(ref.watch(apiServiceProvider));
});

final fixturesLocalDataSourceProvider = Provider<FixturesLocalDataSource>((
  ref,
) {
  return FixturesLocalDataSource(ref.watch(cacheServiceProvider));
});

final liveScoreRemoteDataSourceProvider = Provider<LiveScoreRemoteDataSource>((
  ref,
) {
  return LiveScoreRemoteDataSource(ref.watch(apiServiceProvider));
});

final liveScoreLocalDataSourceProvider = Provider<LiveScoreLocalDataSource>((
  ref,
) {
  return LiveScoreLocalDataSource(ref.watch(cacheServiceProvider));
});

final teamsRemoteDataSourceProvider = Provider<TeamsRemoteDataSource>((ref) {
  return TeamsRemoteDataSource(ref.watch(apiServiceProvider));
});

final teamsLocalDataSourceProvider = Provider<TeamsLocalDataSource>((ref) {
  return TeamsLocalDataSource(ref.watch(cacheServiceProvider));
});

final groupsRemoteDataSourceProvider = Provider<GroupsRemoteDataSource>((ref) {
  return GroupsRemoteDataSource(ref.watch(apiServiceProvider));
});

final groupsLocalDataSourceProvider = Provider<GroupsLocalDataSource>((ref) {
  return GroupsLocalDataSource(ref.watch(cacheServiceProvider));
});

final newsRemoteDataSourceProvider = Provider<NewsRemoteDataSource>((ref) {
  return NewsRemoteDataSource(ref.watch(apiServiceProvider));
});

final newsLocalDataSourceProvider = Provider<NewsLocalDataSource>((ref) {
  return NewsLocalDataSource(ref.watch(cacheServiceProvider));
});

final homeRemoteDataSourceProvider = Provider<HomeRemoteDataSource>((ref) {
  return HomeRemoteDataSource(ref.watch(apiServiceProvider));
});

final homeLocalDataSourceProvider = Provider<HomeLocalDataSource>((ref) {
  return HomeLocalDataSource(ref.watch(cacheServiceProvider));
});

final favoritesLocalDataSourceProvider = Provider<FavoritesLocalDataSource>((
  ref,
) {
  return FavoritesLocalDataSource(ref.watch(cacheServiceProvider));
});
