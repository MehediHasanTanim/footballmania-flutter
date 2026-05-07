// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_standing_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupStandingDtoImpl _$$GroupStandingDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$GroupStandingDtoImpl(
      group: json['group'] as String?,
      teamId: _nullableInt(json['team_id']),
      teamName: json['team_name'] as String?,
      teamFlag: json['team_flag'] as String?,
      played: _nullableInt(json['played']),
      won: _nullableInt(json['won']),
      drawn: _nullableInt(json['drawn']),
      lost: _nullableInt(json['lost']),
      goalsFor: _nullableInt(json['goals_for']),
      goalsAgainst: _nullableInt(json['goals_against']),
      goalDifference: _nullableInt(json['goal_difference']),
      points: _nullableInt(json['points']),
      rank: _nullableInt(json['rank']),
    );

Map<String, dynamic> _$$GroupStandingDtoImplToJson(
        _$GroupStandingDtoImpl instance) =>
    <String, dynamic>{
      'group': instance.group,
      'team_id': instance.teamId,
      'team_name': instance.teamName,
      'team_flag': instance.teamFlag,
      'played': instance.played,
      'won': instance.won,
      'drawn': instance.drawn,
      'lost': instance.lost,
      'goals_for': instance.goalsFor,
      'goals_against': instance.goalsAgainst,
      'goal_difference': instance.goalDifference,
      'points': instance.points,
      'rank': instance.rank,
    };
