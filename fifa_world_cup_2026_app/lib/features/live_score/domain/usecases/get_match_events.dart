import '../../../../core/utils/result.dart';
import '../entities/match_event.dart';
import '../repositories/live_score_repository.dart';

class GetMatchEvents {
  const GetMatchEvents(this._repository);

  final LiveScoreRepository _repository;

  Future<Result<List<MatchEvent>>> call(
    int fixtureId, {
    bool forceRefresh = false,
  }) {
    return _repository.getMatchEvents(fixtureId, forceRefresh: forceRefresh);
  }
}
