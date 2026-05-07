import '../../../../core/utils/result.dart';
import '../entities/fixture.dart';
import '../repositories/fixtures_repository.dart';

class GetFixtureById {
  const GetFixtureById(this._repository);

  final FixturesRepository _repository;

  Future<Result<Fixture>> call(int fixtureId, {bool forceRefresh = false}) {
    return _repository.getFixtureById(fixtureId, forceRefresh: forceRefresh);
  }
}
