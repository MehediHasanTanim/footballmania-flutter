import 'package:hive/hive.dart';

import '../../features/favorites/data/models/cached_favorite.dart';
import '../../features/fixtures/data/models/cached_fixture.dart';
import '../../features/news/data/models/cached_news.dart';
import '../../features/search/data/models/persisted_filter_model.dart';
import '../../features/search/data/models/recent_search_model.dart';
import '../../features/settings/data/models/cached_user_settings.dart';
import '../../features/teams/data/models/cached_team.dart';
import 'models/cache_metadata.dart';

class HiveAdapters {
  const HiveAdapters._();

  static void registerAdapters() {
    _register(1, CacheMetadataAdapter());
    _register(2, CachedFixtureAdapter());
    _register(3, CachedTeamAdapter());
    _register(4, CachedNewsAdapter());
    _register(5, CachedFavoriteAdapter());
    _register(6, CachedUserSettingsAdapter());
    _register(7, RecentSearchModelAdapter());
    _register(8, PersistedFilterModelAdapter());
  }

  static void _register<T>(int typeId, TypeAdapter<T> adapter) {
    if (!Hive.isAdapterRegistered(typeId)) {
      Hive.registerAdapter<T>(adapter);
    }
  }
}
