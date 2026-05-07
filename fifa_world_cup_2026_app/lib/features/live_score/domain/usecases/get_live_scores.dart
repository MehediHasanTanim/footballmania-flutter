import '../../../../core/utils/result.dart';
import '../entities/live_match.dart';
import '../repositories/live_score_repository.dart';

class GetLiveScores {
  const GetLiveScores(this._repository);

  final LiveScoreRepository _repository;

  Future<Result<List<LiveMatch>>> call({bool forceRefresh = false}) {
    return _repository.getLiveScores(forceRefresh: forceRefresh);
  }
}
