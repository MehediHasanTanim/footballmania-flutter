import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/result.dart';
import '../../../../shared/providers/usecase_providers.dart';
import '../../domain/entities/home_summary.dart';

final homeSummaryProvider =
    AutoDisposeAsyncNotifierProvider<HomeSummaryNotifier, HomeSummary>(
      HomeSummaryNotifier.new,
    );

class HomeSummaryNotifier extends AutoDisposeAsyncNotifier<HomeSummary> {
  @override
  Future<HomeSummary> build() => _load();

  Future<void> refresh() => _setState(forceRefresh: false);

  Future<void> forceRefresh() => _setState(forceRefresh: true);

  Future<void> reload() => refresh();

  Future<void> _setState({required bool forceRefresh}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _load(forceRefresh: forceRefresh));
  }

  Future<HomeSummary> _load({bool forceRefresh = false}) async {
    final result = await ref.read(getHomeSummaryUseCaseProvider)(
      forceRefresh: forceRefresh,
    );
    return switch (result) {
      Success<HomeSummary>(:final data) => data,
      FailureResult<HomeSummary>(:final failure) => throw failure,
    };
  }
}
