import '../../../../core/utils/result.dart';
import '../entities/group_standing.dart';

abstract class GroupsRepository {
  Future<Result<List<GroupStanding>>> getGroups({bool forceRefresh = false});
}
