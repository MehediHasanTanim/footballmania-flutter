import 'package:fifa_world_cup_2026_app/core/utils/date_time_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('formats display date and time', () {
    final dateTime = DateTime(2026, 6, 11, 20, 30);

    expect(DateTimeFormatter.formatDate(dateTime), 'Jun 11, 2026');
    expect(DateTimeFormatter.formatTime(dateTime), '8:30 PM');
  });

  test('parses api date time safely', () {
    expect(
      DateTimeFormatter.tryParseApiDateTime('2026-06-11T20:30:00Z'),
      isA<DateTime>(),
    );
    expect(DateTimeFormatter.tryParseApiDateTime(''), isNull);
  });
}
