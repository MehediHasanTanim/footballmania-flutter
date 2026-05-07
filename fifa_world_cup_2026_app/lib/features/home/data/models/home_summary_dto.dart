import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/date_time_json_converter.dart';
import '../../../fixtures/data/models/fixture_dto.dart';
import '../../../groups/data/models/group_standing_dto.dart';
import '../../../live_score/data/models/live_match_dto.dart';
import '../../../news/data/models/news_dto.dart';
import '../../domain/entities/home_summary.dart';

part 'home_summary_dto.freezed.dart';
part 'home_summary_dto.g.dart';

@freezed
class HomeSummaryDto with _$HomeSummaryDto {
  const factory HomeSummaryDto({
    @DateTimeJsonConverter()
    @JsonKey(name: 'countdown_target_date')
    DateTime? countdownTargetDate,
    @JsonKey(name: 'next_match') FixtureDto? nextMatch,
    @JsonKey(name: 'live_matches')
    @Default(<LiveMatchDto>[])
    List<LiveMatchDto> liveMatches,
    @JsonKey(name: 'latest_news')
    @Default(<NewsDto>[])
    List<NewsDto> latestNews,
    @JsonKey(name: 'group_highlights')
    @Default(<GroupStandingDto>[])
    List<GroupStandingDto> groupHighlights,
  }) = _HomeSummaryDto;

  const HomeSummaryDto._();

  factory HomeSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$HomeSummaryDtoFromJson(_normalize(json));

  HomeSummary toEntity() {
    return HomeSummary(
      countdownTargetDate: countdownTargetDate,
      nextMatch: nextMatch?.toEntity(),
      liveMatches: liveMatches
          .map((match) => match.toEntity())
          .toList(growable: false),
      latestNews: latestNews
          .map((news) => news.toEntity())
          .toList(growable: false),
      groupHighlights: groupHighlights
          .map((group) => group.toEntity())
          .toList(growable: false),
    );
  }

  factory HomeSummaryDto.fromEntity(HomeSummary summary) {
    return HomeSummaryDto(
      countdownTargetDate: summary.countdownTargetDate,
      nextMatch: summary.nextMatch == null
          ? null
          : FixtureDto.fromEntity(summary.nextMatch!),
      liveMatches: summary.liveMatches
          .map(LiveMatchDto.fromEntity)
          .toList(growable: false),
      latestNews: summary.latestNews
          .map(NewsDto.fromEntity)
          .toList(growable: false),
      groupHighlights: summary.groupHighlights
          .map(GroupStandingDto.fromEntity)
          .toList(growable: false),
    );
  }
}

Map<String, dynamic> _normalize(Map<String, dynamic> json) => {
  ...json,
  'countdown_target_date':
      json['countdown_target_date'] ?? json['countdownTargetDate'],
  'next_match': json['next_match'] ?? json['nextMatch'],
  'live_matches': json['live_matches'] ?? json['liveMatches'],
  'latest_news': json['latest_news'] ?? json['latestNews'],
  'group_highlights': json['group_highlights'] ?? json['groupHighlights'],
};
