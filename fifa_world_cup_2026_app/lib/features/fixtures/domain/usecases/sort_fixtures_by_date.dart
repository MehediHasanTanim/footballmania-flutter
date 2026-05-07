import '../entities/fixture.dart';

class SortFixturesByDate {
  const SortFixturesByDate();

  List<Fixture> call(
    List<Fixture> fixtures, {
    bool completedLast = false,
    bool prioritizeLive = false,
  }) {
    final sorted = List<Fixture>.of(fixtures);
    sorted.sort((a, b) {
      if (prioritizeLive && a.isLive != b.isLive) return a.isLive ? -1 : 1;
      if (completedLast && a.isCompleted != b.isCompleted) {
        return a.isCompleted ? 1 : -1;
      }
      return _dateValue(a).compareTo(_dateValue(b));
    });
    return List.unmodifiable(sorted);
  }

  DateTime _dateValue(Fixture fixture) =>
      fixture.matchDateUtc ??
      DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
}
