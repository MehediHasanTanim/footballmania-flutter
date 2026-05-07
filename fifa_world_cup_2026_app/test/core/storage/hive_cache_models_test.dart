import 'package:fifa_world_cup_2026_app/core/constants/hive_constants.dart';
import 'package:fifa_world_cup_2026_app/core/storage/hive_adapters.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/data/models/cached_fixture.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

void main() {
  test('registers Hive adapters only once', () {
    HiveAdapters.registerAdapters();
    HiveAdapters.registerAdapters();

    expect(Hive.isAdapterRegistered(1), isTrue);
    expect(Hive.isAdapterRegistered(2), isTrue);
    expect(Hive.isAdapterRegistered(3), isTrue);
    expect(Hive.isAdapterRegistered(4), isTrue);
    expect(Hive.isAdapterRegistered(5), isTrue);
    expect(Hive.isAdapterRegistered(6), isTrue);
    expect(Hive.isAdapterRegistered(7), isTrue);
    expect(Hive.isAdapterRegistered(8), isTrue);
  });

  test('contains all required box names', () {
    expect(HiveConstants.allBoxes, contains(HiveConstants.fixturesBox));
    expect(HiveConstants.allBoxes, contains(HiveConstants.teamsBox));
    expect(HiveConstants.allBoxes, contains(HiveConstants.newsBox));
    expect(HiveConstants.allBoxes, contains(HiveConstants.favoritesBox));
    expect(HiveConstants.allBoxes, contains(HiveConstants.settingsBox));
    expect(HiveConstants.allBoxes, contains(HiveConstants.cacheMetadataBox));
    expect(HiveConstants.allBoxes, contains(HiveConstants.recentSearchesBox));
    expect(HiveConstants.allBoxes, contains(HiveConstants.persistedFiltersBox));
  });

  test('cached fixture round-trips through dto map', () {
    final now = DateTime.utc(2026, 6, 11, 20, 0);
    final fixture = CachedFixture(
      id: 'match-1',
      homeTeamId: 'usa',
      homeTeamName: 'USA',
      awayTeamId: 'can',
      awayTeamName: 'Canada',
      matchDateUtc: now,
      venue: 'MetLife Stadium',
      stage: 'Group Stage',
      group: 'A',
      status: 'scheduled',
      createdAt: now,
      updatedAt: now,
      cachedAt: now,
      expiresAt: now.add(const Duration(hours: 6)),
    );

    final restored = CachedFixture.fromDto(fixture.toDto());

    expect(restored.id, fixture.id);
    expect(restored.createdAt, fixture.createdAt);
    expect(restored.updatedAt, fixture.updatedAt);
    expect(restored.isExpired, isFalse);
  });
}
