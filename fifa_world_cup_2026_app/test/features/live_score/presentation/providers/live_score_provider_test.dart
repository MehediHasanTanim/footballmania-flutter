import 'package:fifa_world_cup_2026_app/core/domain/enums/match_status.dart';
import 'package:fifa_world_cup_2026_app/core/utils/result.dart';
import 'package:fifa_world_cup_2026_app/features/live_score/domain/entities/live_match.dart';
import 'package:fifa_world_cup_2026_app/features/live_score/domain/entities/match_event.dart';
import 'package:fifa_world_cup_2026_app/features/live_score/domain/repositories/live_score_repository.dart';
import 'package:fifa_world_cup_2026_app/features/live_score/presentation/providers/live_score_provider.dart';
import 'package:fifa_world_cup_2026_app/shared/providers/repository_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('live score stream emits data', () async {
    final container = ProviderContainer(
      overrides: [
        liveScoreRepositoryProvider.overrideWithValue(_LiveScoreRepository()),
      ],
    );
    addTearDown(container.dispose);

    final result = await container.read(liveScoreStreamProvider.future);

    expect(result, hasLength(1));
    expect(container.read(hasLiveMatchProvider), isTrue);
  });
}

class _LiveScoreRepository implements LiveScoreRepository {
  @override
  Future<Result<List<LiveMatch>>> getLiveScores({
    bool forceRefresh = false,
  }) async {
    return const Success([
      LiveMatch(
        id: 1,
        fixtureId: 1,
        homeTeamName: 'A',
        awayTeamName: 'B',
        status: MatchStatus.live,
      ),
    ]);
  }

  @override
  Future<Result<List<MatchEvent>>> getMatchEvents(
    int fixtureId, {
    bool forceRefresh = false,
  }) async {
    return const Success([]);
  }
}
