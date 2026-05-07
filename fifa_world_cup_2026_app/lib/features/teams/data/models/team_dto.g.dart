// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeamDtoImpl _$$TeamDtoImplFromJson(Map<String, dynamic> json) =>
    _$TeamDtoImpl(
      id: _nullableInt(json['id']),
      name: json['name'] as String?,
      countryCode: json['country_code'] as String?,
      flagUrl: json['flag_url'] as String?,
      group: json['group'] as String?,
      coach: json['coach'] as String?,
      fifaRanking: _nullableInt(json['fifa_ranking']),
    );

Map<String, dynamic> _$$TeamDtoImplToJson(_$TeamDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country_code': instance.countryCode,
      'flag_url': instance.flagUrl,
      'group': instance.group,
      'coach': instance.coach,
      'fifa_ranking': instance.fifaRanking,
    };
