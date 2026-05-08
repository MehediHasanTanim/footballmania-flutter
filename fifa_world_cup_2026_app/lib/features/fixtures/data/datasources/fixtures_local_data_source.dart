import '../../../../core/constants/hive_constants.dart';
import '../../../../core/storage/cache_service.dart';
import '../models/cached_fixture.dart';
import '../models/fixture_dto.dart';

class FixturesLocalDataSource {
  const FixturesLocalDataSource(this._cacheService);

  final CacheService _cacheService;

  Future<void> cacheFixtures(List<FixtureDto> fixtures) async {
    await _cacheService.clear(HiveConstants.fixturesBox);
    await _cacheService.putAll<CachedFixture>(HiveConstants.fixturesBox, {
      for (final fixture in fixtures)
        (fixture.id ?? 0).toString(): fixture.toCachedModel(),
    });
  }

  Future<void> cacheFixture(FixtureDto fixture) {
    return _cacheService.put<CachedFixture>(
      HiveConstants.fixturesBox,
      (fixture.id ?? 0).toString(),
      fixture.toCachedModel(),
    );
  }

  List<FixtureDto> getFixtures({
    String? date,
    int? teamId,
    String? group,
    String? stage,
    bool includeExpired = false,
  }) {
    final fixtures = _cacheService
        .values<CachedFixture>(HiveConstants.fixturesBox)
        .where((fixture) => includeExpired || !fixture.isExpired)
        .map(FixtureDto.fromCachedModel)
        .where(
          (fixture) => _matchesFilter(
            fixture,
            date: date,
            teamId: teamId,
            group: group,
            stage: stage,
          ),
        )
        .toList(growable: false);
    return fixtures;
  }

  FixtureDto? getFixtureById(int fixtureId, {bool includeExpired = false}) {
    final cached = _cacheService.get<CachedFixture>(
      HiveConstants.fixturesBox,
      fixtureId.toString(),
    );
    if (cached == null || (!includeExpired && cached.isExpired)) return null;
    return FixtureDto.fromCachedModel(cached);
  }

  bool _matchesFilter(
    FixtureDto fixture, {
    String? date,
    int? teamId,
    String? group,
    String? stage,
  }) {
    final matchesDate =
        date == null ||
        fixture.matchDateUtc?.toIso8601String().startsWith(date) == true;
    final matchesTeam =
        teamId == null ||
        fixture.homeTeamId == teamId ||
        fixture.awayTeamId == teamId;
    final matchesGroup = group == null || fixture.group == group;
    final matchesStage = stage == null || fixture.stage == stage;
    return matchesDate && matchesTeam && matchesGroup && matchesStage;
  }
}
