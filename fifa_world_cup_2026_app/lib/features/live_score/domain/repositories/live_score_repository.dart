import '../../../../core/utils/result.dart';
import '../entities/live_match.dart';
import '../entities/match_event.dart';

abstract class LiveScoreRepository {
  Future<Result<List<LiveMatch>>> getLiveScores({bool forceRefresh = false});

  Future<Result<List<MatchEvent>>> getMatchEvents(
    int fixtureId, {
    bool forceRefresh = false,
  });
}
