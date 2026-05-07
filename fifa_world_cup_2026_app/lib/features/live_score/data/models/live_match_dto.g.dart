// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_match_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiveMatchDtoImpl _$$LiveMatchDtoImplFromJson(Map<String, dynamic> json) =>
    _$LiveMatchDtoImpl(
      id: _nullableInt(json['id']),
      fixtureId: _nullableInt(json['fixture_id']),
      homeTeamName: json['home_team_name'] as String?,
      awayTeamName: json['away_team_name'] as String?,
      homeScore: _nullableInt(json['home_score']),
      awayScore: _nullableInt(json['away_score']),
      status: json['status'] as String?,
      elapsed: _nullableInt(json['elapsed']),
      events:
          (json['events'] as List<dynamic>?)
              ?.map((e) => MatchEventDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <MatchEventDto>[],
    );

Map<String, dynamic> _$$LiveMatchDtoImplToJson(_$LiveMatchDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fixture_id': instance.fixtureId,
      'home_team_name': instance.homeTeamName,
      'away_team_name': instance.awayTeamName,
      'home_score': instance.homeScore,
      'away_score': instance.awayScore,
      'status': instance.status,
      'elapsed': instance.elapsed,
      'events': instance.events,
    };
