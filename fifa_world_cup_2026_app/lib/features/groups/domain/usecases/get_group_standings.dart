import '../../../../core/utils/result.dart';
import '../entities/group_standing.dart';
import '../repositories/groups_repository.dart';

class GetGroupStandings {
  const GetGroupStandings(this._repository);

  final GroupsRepository _repository;

  Future<Result<List<GroupStanding>>> call({bool forceRefresh = false}) {
    return _repository.getGroups(forceRefresh: forceRefresh);
  }
}
