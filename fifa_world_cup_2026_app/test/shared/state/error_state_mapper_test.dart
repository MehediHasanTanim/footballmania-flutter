import 'package:fifa_world_cup_2026_app/core/errors/failure.dart';
import 'package:fifa_world_cup_2026_app/shared/state/error_state_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('error mapper converts Failure to UI error message', () {
    final network = ErrorStateMapper.fromFailure<void>(
      const Failure(message: 'Network error'),
    );
    final api = ErrorStateMapper.fromFailure<void>(
      const Failure(message: 'API error'),
    );
    final cache = ErrorStateMapper.fromFailure<void>(
      const Failure(message: 'No cached fixtures available.'),
    );
    final unknown = ErrorStateMapper.fromFailure<void>(
      const Failure(message: 'Unexpected'),
    );

    expect(
      network.message,
      'You are offline. Check your connection and try again.',
    );
    expect(api.message, 'The server is unavailable. Please try again later.');
    expect(cache.message, 'Saved data is unavailable right now.');
    expect(unknown.message, 'Unexpected');
  });
}
