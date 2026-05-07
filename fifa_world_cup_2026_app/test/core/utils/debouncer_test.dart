import 'package:fifa_world_cup_2026_app/core/utils/debouncer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('runs only the latest action', () async {
    var calls = 0;
    final debouncer = Debouncer(delay: const Duration(milliseconds: 20));

    debouncer(() => calls++);
    debouncer(() => calls += 2);

    await Future<void>.delayed(const Duration(milliseconds: 40));

    expect(calls, 2);
    debouncer.dispose();
  });
}
