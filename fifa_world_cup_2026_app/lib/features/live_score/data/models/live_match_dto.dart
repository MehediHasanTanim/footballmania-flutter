import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/enums/match_status.dart';
import '../../domain/entities/live_match.dart';
import 'match_event_dto.dart';

part 'live_match_dto.freezed.dart';
part 'live_match_dto.g.dart';

@freezed
class LiveMatchDto with _$LiveMatchDto {
  const factory LiveMatchDto({
    @JsonKey(fromJson: _nullableInt) int? id,
    @JsonKey(name: 'fixture_id', fromJson: _nullableInt) int? fixtureId,
    @JsonKey(name: 'home_team_name') String? homeTeamName,
    @JsonKey(name: 'away_team_name') String? awayTeamName,
    @JsonKey(name: 'home_score', fromJson: _nullableInt) int? homeScore,
    @JsonKey(name: 'away_score', fromJson: _nullableInt) int? awayScore,
    String? status,
    @JsonKey(fromJson: _nullableInt) int? elapsed,
    @Default(<MatchEventDto>[]) List<MatchEventDto> events,
  }) = _LiveMatchDto;

  const LiveMatchDto._();

  factory LiveMatchDto.fromJson(Map<String, dynamic> json) =>
      _$LiveMatchDtoFromJson(_normalize(json));

  LiveMatch toEntity() {
    return LiveMatch(
      id: id ?? 0,
      fixtureId: fixtureId ?? id ?? 0,
      homeTeamName: homeTeamName ?? '',
      awayTeamName: awayTeamName ?? '',
      homeScore: homeScore,
      awayScore: awayScore,
      status: MatchStatus.fromString(status),
      elapsed: elapsed,
      events: events.map((event) => event.toEntity()).toList(growable: false),
    );
  }

  factory LiveMatchDto.fromEntity(LiveMatch match) {
    return LiveMatchDto(
      id: match.id,
      fixtureId: match.fixtureId,
      homeTeamName: match.homeTeamName,
      awayTeamName: match.awayTeamName,
      homeScore: match.homeScore,
      awayScore: match.awayScore,
      status: match.status.name,
      elapsed: match.elapsed,
      events: match.events
          .map(MatchEventDto.fromEntity)
          .toList(growable: false),
    );
  }
}

Map<String, dynamic> _normalize(Map<String, dynamic> json) => {
  ...json,
  'fixture_id': json['fixture_id'] ?? json['fixtureId'],
  'home_team_name': json['home_team_name'] ?? json['homeTeamName'],
  'away_team_name': json['away_team_name'] ?? json['awayTeamName'],
  'home_score': json['home_score'] ?? json['homeScore'],
  'away_score': json['away_score'] ?? json['awayScore'],
};

int? _nullableInt(Object? value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}
