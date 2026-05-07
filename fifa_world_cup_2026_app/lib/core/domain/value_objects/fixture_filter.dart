import '../enums/match_status.dart';
import 'date_range.dart';

class FixtureFilter {
  const FixtureFilter({
    this.date,
    this.dateRange,
    this.teamId,
    this.group,
    this.stage,
    this.status,
  });

  final DateTime? date;
  final DateRange? dateRange;
  final int? teamId;
  final String? group;
  final String? stage;
  final MatchStatus? status;

  bool get isEmpty =>
      date == null && dateRange == null && teamId == null && group == null && stage == null && status == null;
}
