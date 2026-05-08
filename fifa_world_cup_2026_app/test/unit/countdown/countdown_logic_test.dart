import 'package:fifa_world_cup_2026_app/features/countdown/domain/usecases/calculate_countdown.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const useCase = CalculateCountdown();

  test('test_countdown_before_event_returns_remaining_time', () {
    final result = useCase(
      targetUtc: DateTime.utc(2026, 6, 11, 19),
      nowUtc: DateTime.utc(2026, 6, 10, 18, 30),
    );

    expect(result.days, 1);
    expect(result.hours, 0);
    expect(result.minutes, 30);
    expect(result.isExpired, isFalse);
  });

  test('test_countdown_after_event_returns_zero', () {
    final result = useCase(
      targetUtc: DateTime.utc(2026, 6, 11, 19),
      nowUtc: DateTime.utc(2026, 6, 12),
    );

    expect(result.remaining, Duration.zero);
    expect(result.isExpired, isTrue);
  });

  test('test_countdown_same_day_formats_hours_minutes', () {
    final result = useCase(
      targetUtc: DateTime.utc(2026, 6, 11, 19),
      nowUtc: DateTime.utc(2026, 6, 11, 17, 15),
    );
    final displayText = '${result.hours}h ${result.minutes}m';

    expect(displayText, '1h 45m');
  });

  test('test_countdown_handles_utc_and_local_time', () {
    final localNow = DateTime(2026, 6, 11, 12);
    final result = useCase(
      targetUtc: DateTime.utc(2026, 6, 11, 19),
      nowUtc: localNow,
    );

    expect(result.remaining, DateTime.utc(2026, 6, 11, 19).difference(localNow.toUtc()));
  });
}
