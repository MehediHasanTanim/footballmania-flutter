import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/enums/match_status.dart';
import '../../domain/entities/match_event.dart';

part 'match_event_dto.freezed.dart';
part 'match_event_dto.g.dart';

@freezed
class MatchEventDto with _$MatchEventDto {
  const factory MatchEventDto({
    @JsonKey(fromJson: _nullableInt) int? id,
    @JsonKey(fromJson: _nullableInt) int? minute,
    @JsonKey(name: 'team_id', fromJson: _nullableInt) int? teamId,
    @JsonKey(name: 'team_name') String? teamName,
    @JsonKey(name: 'player_name') String? playerName,
    @JsonKey(name: 'assist_name') String? assistName,
    String? type,
    String? detail,
  }) = _MatchEventDto;

  const MatchEventDto._();

  factory MatchEventDto.fromJson(Map<String, dynamic> json) =>
      _$MatchEventDtoFromJson(_normalize(json));

  MatchEvent toEntity() {
    return MatchEvent(
      id: id ?? 0,
      minute: minute,
      teamId: teamId,
      teamName: teamName,
      playerName: playerName,
      assistName: assistName,
      type: MatchEventType.fromString(type),
      detail: detail,
    );
  }

  factory MatchEventDto.fromEntity(MatchEvent event) {
    return MatchEventDto(
      id: event.id,
      minute: event.minute,
      teamId: event.teamId,
      teamName: event.teamName,
      playerName: event.playerName,
      assistName: event.assistName,
      type: event.type.name,
      detail: event.detail,
    );
  }
}

Map<String, dynamic> _normalize(Map<String, dynamic> json) => {
  ...json,
  'team_id': json['team_id'] ?? json['teamId'],
  'team_name': json['team_name'] ?? json['teamName'],
  'player_name': json['player_name'] ?? json['playerName'],
  'assist_name': json['assist_name'] ?? json['assistName'],
};

int? _nullableInt(Object? value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}
