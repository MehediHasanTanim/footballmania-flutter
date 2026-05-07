import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/providers/usecase_providers.dart';
import '../../domain/entities/recent_search.dart';

final recentSearchProvider =
    StateNotifierProvider.family<
      RecentSearchNotifier,
      List<RecentSearch>,
      SearchType
    >((ref, type) {
      return RecentSearchNotifier(ref, type)..load();
    });

class RecentSearchNotifier extends StateNotifier<List<RecentSearch>> {
  RecentSearchNotifier(this._ref, this._type) : super(const []);

  final Ref _ref;
  final SearchType _type;

  void load() {
    state = _ref.read(getRecentSearchesUseCaseProvider)(_type);
  }

  Future<void> add(String query) async {
    await _ref.read(addRecentSearchUseCaseProvider)(type: _type, query: query);
    load();
  }

  Future<void> remove(String query) async {
    await _ref.read(removeRecentSearchUseCaseProvider)(_type, query);
    load();
  }

  Future<void> clear() async {
    await _ref.read(clearRecentSearchesUseCaseProvider)(_type);
    load();
  }
}
