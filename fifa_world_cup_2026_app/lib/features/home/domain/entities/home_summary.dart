import '../../../fixtures/domain/entities/fixture.dart';
import '../../../groups/domain/entities/group_standing.dart';
import '../../../live_score/domain/entities/live_match.dart';
import '../../../news/domain/entities/news.dart';

class HomeSummary {
  const HomeSummary({
    this.countdownTargetDate,
    this.nextMatch,
    this.liveMatches = const [],
    this.latestNews = const [],
    this.groupHighlights = const [],
  });

  final DateTime? countdownTargetDate;
  final Fixture? nextMatch;
  final List<LiveMatch> liveMatches;
  final List<News> latestNews;
  final List<GroupStanding> groupHighlights;
}
