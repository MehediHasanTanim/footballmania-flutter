// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchDtoImpl _$$MatchDtoImplFromJson(Map<String, dynamic> json) =>
    _$MatchDtoImpl(
      id: _nullableInt(json['id']),
      fixtureId: _nullableInt(json['fixture_id']),
      homeTeam: json['home_team'] as String?,
      awayTeam: json['away_team'] as String?,
      score: json['score'] as String?,
      status: json['status'] as String?,
      venue: json['venue'] as String?,
      kickoffTimeUtc: const DateTimeJsonConverter().fromJson(
        json['kickoff_time_utc'],
      ),
      events:
          (json['events'] as List<dynamic>?)
              ?.map((e) => MatchEventDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <MatchEventDto>[],
    );

Map<String, dynamic> _$$MatchDtoImplToJson(_$MatchDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fixture_id': instance.fixtureId,
      'home_team': instance.homeTeam,
      'away_team': instance.awayTeam,
      'score': instance.score,
      'status': instance.status,
      'venue': instance.venue,
      'kickoff_time_utc': const DateTimeJsonConverter().toJson(
        instance.kickoffTimeUtc,
      ),
      'events': instance.events,
    };
