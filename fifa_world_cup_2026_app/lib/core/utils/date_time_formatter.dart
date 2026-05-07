import 'package:intl/intl.dart';

import '../constants/date_time_constants.dart';

class DateTimeFormatter {
  const DateTimeFormatter._();

  static String formatDate(DateTime dateTime) {
    return DateFormat(DateTimeConstants.displayDateFormat).format(dateTime);
  }

  static String formatTime(DateTime dateTime) {
    return DateFormat(DateTimeConstants.displayTimeFormat).format(dateTime);
  }

  static String formatDateTime(DateTime dateTime) {
    return DateFormat(DateTimeConstants.displayDateTimeFormat).format(dateTime);
  }

  static String formatApiDate(DateTime dateTime) {
    return DateFormat(DateTimeConstants.apiDateFormat).format(dateTime.toUtc());
  }

  static String formatMatchCountdown(DateTime dateTime) {
    return DateFormat(DateTimeConstants.matchCountdownFormat).format(dateTime);
  }

  static DateTime? tryParseApiDateTime(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    return DateTime.tryParse(value)?.toLocal();
  }
}
