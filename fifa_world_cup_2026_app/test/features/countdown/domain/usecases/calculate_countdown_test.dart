import 'package:fifa_world_cup_2026_app/features/countdown/domain/usecases/calculate_countdown.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const useCase = CalculateCountdown();

  test('calculates countdown before tournament', () {
    final countdown = useCase(
      targetUtc: DateTime.utc(2026, 6, 11),
      nowUtc: DateTime.utc(2026, 6, 10, 22, 30, 15),
    );

    expect(countdown.isExpired, isFalse);
    expect(countdown.days, 0);
    expect(countdown.hours, 1);
    expect(countdown.minutes, 29);
    expect(countdown.seconds, 45);
  });

  test('returns zero countdown after expiry', () {
    final countdown = useCase(
      targetUtc: DateTime.utc(2026, 6, 11),
      nowUtc: DateTime.utc(2026, 6, 12),
    );

    expect(countdown.isExpired, isTrue);
    expect(countdown.remaining, Duration.zero);
  });

  test('calculates match countdown using UTC date', () {
    final countdown = useCase(
      targetUtc: DateTime.utc(2026, 6, 11, 20),
      nowUtc: DateTime.utc(2026, 6, 10, 20),
    );

    expect(countdown.days, 1);
    expect(countdown.hours, 0);
  });
}
