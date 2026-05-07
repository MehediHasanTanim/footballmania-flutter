// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_summary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeSummaryDtoImpl _$$HomeSummaryDtoImplFromJson(Map<String, dynamic> json) =>
    _$HomeSummaryDtoImpl(
      countdownTargetDate: const DateTimeJsonConverter().fromJson(
        json['countdown_target_date'],
      ),
      nextMatch: json['next_match'] == null
          ? null
          : FixtureDto.fromJson(json['next_match'] as Map<String, dynamic>),
      liveMatches:
          (json['live_matches'] as List<dynamic>?)
              ?.map((e) => LiveMatchDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <LiveMatchDto>[],
      latestNews:
          (json['latest_news'] as List<dynamic>?)
              ?.map((e) => NewsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <NewsDto>[],
      groupHighlights:
          (json['group_highlights'] as List<dynamic>?)
              ?.map((e) => GroupStandingDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <GroupStandingDto>[],
    );

Map<String, dynamic> _$$HomeSummaryDtoImplToJson(
  _$HomeSummaryDtoImpl instance,
) => <String, dynamic>{
  'countdown_target_date': const DateTimeJsonConverter().toJson(
    instance.countdownTargetDate,
  ),
  'next_match': instance.nextMatch,
  'live_matches': instance.liveMatches,
  'latest_news': instance.latestNews,
  'group_highlights': instance.groupHighlights,
};
