import '../../../../core/utils/result.dart';
import '../entities/fixture.dart';
import '../repositories/fixtures_repository.dart';

class GetFixtures {
  const GetFixtures(this._repository);

  final FixturesRepository _repository;

  Future<Result<List<Fixture>>> call({
    String? date,
    int? teamId,
    String? group,
    String? stage,
    bool forceRefresh = false,
  }) {
    return _repository.getFixtures(
      date: date,
      teamId: teamId,
      group: group,
      stage: stage,
      forceRefresh: forceRefresh,
    );
  }
}
