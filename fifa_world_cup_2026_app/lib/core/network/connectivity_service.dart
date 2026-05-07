import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

typedef ConnectivityStatusReader = Future<List<ConnectivityResult>> Function();
typedef ConnectivityStatusStream = Stream<List<ConnectivityResult>> Function();

class ConnectivityService {
  ConnectivityService({
    Connectivity? connectivity,
    ConnectivityStatusReader? statusReader,
    ConnectivityStatusStream? statusStream,
  }) : _connectivity = connectivity,
       _statusReader = statusReader,
       _statusStream = statusStream;

  final Connectivity? _connectivity;
  final ConnectivityStatusReader? _statusReader;
  final ConnectivityStatusStream? _statusStream;

  Stream<bool> get onConnectivityChanged {
    return (_statusStream?.call() ?? _plugin.onConnectivityChanged)
        .map(_hasConnection)
        .distinct();
  }

  Future<bool> get isOnline async {
    final result = await (_statusReader?.call() ?? _plugin.checkConnectivity());
    return _hasConnection(result);
  }

  Connectivity get _plugin => _connectivity ?? Connectivity();

  Future<void> retryWhenOnline(FutureOr<void> Function() action) async {
    if (await isOnline) {
      await action();
      return;
    }

    await onConnectivityChanged.firstWhere((online) => online);
    await action();
  }

  bool _hasConnection(List<ConnectivityResult> results) {
    return results.any((result) => result != ConnectivityResult.none);
  }
}
