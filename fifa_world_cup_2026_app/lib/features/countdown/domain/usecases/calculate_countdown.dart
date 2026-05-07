import '../entities/countdown.dart';

class CalculateCountdown {
  const CalculateCountdown();

  Countdown call({required DateTime targetUtc, DateTime? nowUtc}) {
    final target = targetUtc.toUtc();
    final now = (nowUtc ?? DateTime.now().toUtc()).toUtc();
    final remaining = target.difference(now);

    if (remaining.isNegative || remaining == Duration.zero) {
      return Countdown(
        targetUtc: target,
        nowUtc: now,
        days: 0,
        hours: 0,
        minutes: 0,
        seconds: 0,
      );
    }

    return Countdown(
      targetUtc: target,
      nowUtc: now,
      days: remaining.inDays,
      hours: remaining.inHours.remainder(24),
      minutes: remaining.inMinutes.remainder(60),
      seconds: remaining.inSeconds.remainder(60),
    );
  }
}
