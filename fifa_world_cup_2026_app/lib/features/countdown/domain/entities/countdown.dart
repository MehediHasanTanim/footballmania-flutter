class Countdown {
  const Countdown({
    required this.targetUtc,
    required this.nowUtc,
    required this.days,
    required this.hours,
    required this.minutes,
    required this.seconds,
  });

  final DateTime targetUtc;
  final DateTime nowUtc;
  final int days;
  final int hours;
  final int minutes;
  final int seconds;

  bool get isExpired => !nowUtc.toUtc().isBefore(targetUtc.toUtc());
  DateTime get targetLocal => targetUtc.toLocal();
  Duration get remaining => isExpired
      ? Duration.zero
      : Duration(days: days, hours: hours, minutes: minutes, seconds: seconds);
}
