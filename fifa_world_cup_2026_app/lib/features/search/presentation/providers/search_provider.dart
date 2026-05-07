export '../../../fixtures/presentation/providers/fixture_filter_provider.dart';
export '../../../news/presentation/providers/news_search_provider.dart';
export '../../../teams/presentation/providers/team_search_provider.dart';
export 'recent_search_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/providers/usecase_providers.dart';

final savedFilterProvider = Provider((ref) {
  return (
    save: ref.watch(saveFilterUseCaseProvider),
    get: ref.watch(getSavedFilterUseCaseProvider),
    clear: ref.watch(clearSavedFilterUseCaseProvider),
  );
});
