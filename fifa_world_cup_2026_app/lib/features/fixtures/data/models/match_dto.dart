import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/enums/match_status.dart';
import '../../../../core/utils/date_time_json_converter.dart';
import '../../../live_score/data/models/match_event_dto.dart';
import '../../../live_score/domain/entities/match.dart';

part 'match_dto.freezed.dart';
part 'match_dto.g.dart';

@freezed
class MatchDto with _$MatchDto {
  const factory MatchDto({
    @JsonKey(fromJson: _nullableInt) int? id,
    @JsonKey(name: 'fixture_id', fromJson: _nullableInt) int? fixtureId,
    @JsonKey(name: 'home_team') String? homeTeam,
    @JsonKey(name: 'away_team') String? awayTeam,
    String? score,
    String? status,
    String? venue,
    @DateTimeJsonConverter()
    @JsonKey(name: 'kickoff_time_utc')
    DateTime? kickoffTimeUtc,
    @Default(<MatchEventDto>[]) List<MatchEventDto> events,
  }) = _MatchDto;

  const MatchDto._();

  factory MatchDto.fromJson(Map<String, dynamic> json) =>
      _$MatchDtoFromJson(_normalize(json));

  Match toEntity() {
    return Match(
      id: id ?? 0,
      fixtureId: fixtureId ?? id ?? 0,
      homeTeam: homeTeam ?? '',
      awayTeam: awayTeam ?? '',
      score: score,
      status: MatchStatus.fromString(status),
      venue: venue ?? '',
      kickoffTimeUtc: kickoffTimeUtc,
      events: events.map((event) => event.toEntity()).toList(growable: false),
    );
  }
}

Map<String, dynamic> _normalize(Map<String, dynamic> json) => {
  ...json,
  'fixture_id': json['fixture_id'] ?? json['fixtureId'],
  'home_team': json['home_team'] ?? json['homeTeam'],
  'away_team': json['away_team'] ?? json['awayTeam'],
  'kickoff_time_utc': json['kickoff_time_utc'] ?? json['kickoffTimeUtc'],
};

int? _nullableInt(Object? value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}
