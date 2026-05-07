import '../../../../core/utils/result.dart';
import '../entities/fixture.dart';

abstract class FixturesRepository {
  Future<Result<List<Fixture>>> getFixtures({
    String? date,
    int? teamId,
    String? group,
    String? stage,
    bool forceRefresh = false,
  });

  Future<Result<Fixture>> getFixtureById(
    int fixtureId, {
    bool forceRefresh = false,
  });
}
