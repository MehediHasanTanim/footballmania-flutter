import '../../../../core/constants/hive_constants.dart';
import '../../../../core/storage/cache_service.dart';
import '../models/cached_team.dart';
import '../models/team_dto.dart';

class TeamsLocalDataSource {
  const TeamsLocalDataSource(this._cacheService);

  final CacheService _cacheService;

  Future<void> cacheTeams(List<TeamDto> teams) async {
    await _cacheService.clear(HiveConstants.teamsBox);
    await _cacheService.putAll<CachedTeam>(HiveConstants.teamsBox, {
      for (final team in teams) (team.id ?? 0).toString(): team.toCachedModel(),
    });
  }

  Future<void> cacheTeam(TeamDto team) {
    return _cacheService.put<CachedTeam>(
      HiveConstants.teamsBox,
      (team.id ?? 0).toString(),
      team.toCachedModel(),
    );
  }

  List<TeamDto> getTeams() {
    return _cacheService
        .values<CachedTeam>(HiveConstants.teamsBox)
        .where((team) => !team.isExpired)
        .map(TeamDto.fromCachedModel)
        .toList(growable: false);
  }

  TeamDto? getTeamById(int teamId) {
    final cached = _cacheService.get<CachedTeam>(
      HiveConstants.teamsBox,
      teamId.toString(),
    );
    if (cached == null || cached.isExpired) return null;
    return TeamDto.fromCachedModel(cached);
  }
}
