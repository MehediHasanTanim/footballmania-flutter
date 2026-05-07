import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/result.dart';
import '../../../../shared/providers/usecase_providers.dart';
import '../../domain/entities/live_match.dart';

final liveScoreRefreshTriggerProvider = StateProvider<int>((ref) => 0);

final liveScoreProvider =
    AutoDisposeAsyncNotifierProvider<LiveScoreNotifier, List<LiveMatch>>(
      LiveScoreNotifier.new,
    );

final liveScoreStreamProvider = StreamProvider.autoDispose<List<LiveMatch>>((
  ref,
) async* {
  ref.watch(liveScoreRefreshTriggerProvider);
  var lastValue = const <LiveMatch>[];

  while (true) {
    final result = await ref.read(getLiveScoresUseCaseProvider)(
      forceRefresh: true,
    );
    final matches = switch (result) {
      Success<List<LiveMatch>>(:final data) => data,
      FailureResult<List<LiveMatch>>() => lastValue,
    };

    lastValue = matches;
    yield matches;

    final hasLiveMatch = matches.any((match) => match.isLive);
    await Future<void>.delayed(Duration(seconds: hasLiveMatch ? 30 : 60));
  }
});

final liveMatchesProvider = Provider<AsyncValue<List<LiveMatch>>>((ref) {
  return ref.watch(liveScoreStreamProvider).whenData((matches) {
    return matches.where((match) => match.isLive).toList(growable: false);
  });
});

final hasLiveMatchProvider = Provider<bool>((ref) {
  return ref.watch(
    liveMatchesProvider.select(
      (value) => value.valueOrNull?.isNotEmpty ?? false,
    ),
  );
});

class LiveScoreNotifier extends AutoDisposeAsyncNotifier<List<LiveMatch>> {
  @override
  Future<List<LiveMatch>> build() => _load();

  Future<void> refresh() => _setState(forceRefresh: false);

  Future<void> forceRefresh() => _setState(forceRefresh: true);

  Future<void> reload() => refresh();

  void refreshStream() {
    ref.read(liveScoreRefreshTriggerProvider.notifier).state++;
  }

  Future<void> _setState({required bool forceRefresh}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _load(forceRefresh: forceRefresh));
  }

  Future<List<LiveMatch>> _load({bool forceRefresh = false}) async {
    final result = await ref.read(getLiveScoresUseCaseProvider)(
      forceRefresh: forceRefresh,
    );
    return switch (result) {
      Success<List<LiveMatch>>(:final data) => data,
      FailureResult<List<LiveMatch>>(:final failure) => throw failure,
    };
  }
}
