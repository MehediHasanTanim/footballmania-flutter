// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixture_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FixtureDtoImpl _$$FixtureDtoImplFromJson(Map<String, dynamic> json) =>
    _$FixtureDtoImpl(
      id: _nullableInt(json['id']),
      homeTeamId: _nullableInt(json['home_team_id']),
      homeTeamName: json['home_team_name'] as String?,
      awayTeamId: _nullableInt(json['away_team_id']),
      awayTeamName: json['away_team_name'] as String?,
      homeTeamFlag: json['home_team_flag'] as String?,
      awayTeamFlag: json['away_team_flag'] as String?,
      matchDateUtc: const DateTimeJsonConverter().fromJson(
        json['match_date_utc'],
      ),
      venue: json['venue'] as String?,
      stage: json['stage'] as String?,
      group: json['group'] as String?,
      status: json['status'] as String?,
      homeScore: _nullableInt(json['home_score']),
      awayScore: _nullableInt(json['away_score']),
    );

Map<String, dynamic> _$$FixtureDtoImplToJson(
  _$FixtureDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'home_team_id': instance.homeTeamId,
  'home_team_name': instance.homeTeamName,
  'away_team_id': instance.awayTeamId,
  'away_team_name': instance.awayTeamName,
  'home_team_flag': instance.homeTeamFlag,
  'away_team_flag': instance.awayTeamFlag,
  'match_date_utc': const DateTimeJsonConverter().toJson(instance.matchDateUtc),
  'venue': instance.venue,
  'stage': instance.stage,
  'group': instance.group,
  'status': instance.status,
  'home_score': instance.homeScore,
  'away_score': instance.awayScore,
};
