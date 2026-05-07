import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/result.dart';
import '../../../../shared/providers/usecase_providers.dart';
import '../../domain/entities/countdown.dart';

final countdownProvider = StreamProvider.autoDispose<Countdown>((ref) async* {
  while (true) {
    final result = await ref.read(getTournamentCountdownUseCaseProvider)(
      nowUtc: DateTime.now().toUtc(),
    );
    switch (result) {
      case Success<Countdown>(:final data):
        yield data;
      case FailureResult<Countdown>(:final failure):
        throw failure;
    }
    await Future<void>.delayed(const Duration(seconds: 1));
  }
});

final matchCountdownProvider = StreamProvider.autoDispose
    .family<Countdown, DateTime>((ref, kickoffUtc) async* {
      while (true) {
        final result = await ref.read(getMatchCountdownUseCaseProvider)(
          kickoffUtc,
          nowUtc: DateTime.now().toUtc(),
        );
        switch (result) {
          case Success<Countdown>(:final data):
            yield data;
          case FailureResult<Countdown>(:final failure):
            throw failure;
        }
        await Future<void>.delayed(const Duration(seconds: 1));
      }
    });
