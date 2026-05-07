import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/result.dart';
import '../../../../shared/providers/usecase_providers.dart';
import '../../domain/entities/group_standing.dart';

final groupsProvider =
    AutoDisposeAsyncNotifierProvider<GroupsNotifier, List<GroupStanding>>(
      GroupsNotifier.new,
    );

final selectedGroupProvider =
    StateNotifierProvider<SelectedGroupNotifier, String?>(
      (ref) => SelectedGroupNotifier(),
    );

final selectedGroupStandingsProvider =
    Provider<AsyncValue<List<GroupStanding>>>((ref) {
      final selectedGroup = ref.watch(selectedGroupProvider);
      return ref.watch(groupsProvider).whenData((standings) {
        if (selectedGroup == null || selectedGroup.trim().isEmpty) {
          return standings;
        }
        return standings
            .where((standing) => standing.group == selectedGroup)
            .toList(growable: false);
      });
    });

class GroupsNotifier extends AutoDisposeAsyncNotifier<List<GroupStanding>> {
  @override
  Future<List<GroupStanding>> build() => _load();

  Future<void> refresh() => _setState(forceRefresh: false);

  Future<void> forceRefresh() => _setState(forceRefresh: true);

  Future<void> reload() => refresh();

  Future<void> _setState({required bool forceRefresh}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _load(forceRefresh: forceRefresh));
  }

  Future<List<GroupStanding>> _load({bool forceRefresh = false}) async {
    final result = await ref.read(getGroupStandingsUseCaseProvider)(
      forceRefresh: forceRefresh,
    );
    return switch (result) {
      Success<List<GroupStanding>>(:final data) => ref.read(
        sortGroupStandingsUseCaseProvider,
      )(data),
      FailureResult<List<GroupStanding>>(:final failure) => throw failure,
    };
  }
}

class SelectedGroupNotifier extends StateNotifier<String?> {
  SelectedGroupNotifier() : super(null);

  void select(String? group) => state = group;

  void clear() => state = null;
}
