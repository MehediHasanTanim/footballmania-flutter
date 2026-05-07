// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_event_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchEventDtoImpl _$$MatchEventDtoImplFromJson(Map<String, dynamic> json) =>
    _$MatchEventDtoImpl(
      id: _nullableInt(json['id']),
      minute: _nullableInt(json['minute']),
      teamId: _nullableInt(json['team_id']),
      teamName: json['team_name'] as String?,
      playerName: json['player_name'] as String?,
      assistName: json['assist_name'] as String?,
      type: json['type'] as String?,
      detail: json['detail'] as String?,
    );

Map<String, dynamic> _$$MatchEventDtoImplToJson(_$MatchEventDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'minute': instance.minute,
      'team_id': instance.teamId,
      'team_name': instance.teamName,
      'player_name': instance.playerName,
      'assist_name': instance.assistName,
      'type': instance.type,
      'detail': instance.detail,
    };
