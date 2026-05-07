class DateRange {
  const DateRange({this.startUtc, this.endUtc});

  final DateTime? startUtc;
  final DateTime? endUtc;

  bool contains(DateTime dateTime) {
    final value = dateTime.toUtc();
    final startsBeforeEnd =
        startUtc == null || !value.isBefore(startUtc!.toUtc());
    final endsAfterStart = endUtc == null || !value.isAfter(endUtc!.toUtc());
    return startsBeforeEnd && endsAfterStart;
  }

  bool get isEmpty => startUtc == null && endUtc == null;
}
