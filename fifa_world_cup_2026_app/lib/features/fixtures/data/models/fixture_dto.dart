import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/enums/match_status.dart';
import '../../../../core/utils/date_time_json_converter.dart';
import '../../domain/entities/fixture.dart';
import 'cached_fixture.dart';

part 'fixture_dto.freezed.dart';
part 'fixture_dto.g.dart';

@freezed
class FixtureDto with _$FixtureDto {
  const factory FixtureDto({
    @JsonKey(fromJson: _nullableInt) int? id,
    @JsonKey(name: 'home_team_id', fromJson: _nullableInt) int? homeTeamId,
    @JsonKey(name: 'home_team_name') String? homeTeamName,
    @JsonKey(name: 'away_team_id', fromJson: _nullableInt) int? awayTeamId,
    @JsonKey(name: 'away_team_name') String? awayTeamName,
    @JsonKey(name: 'home_team_flag') String? homeTeamFlag,
    @JsonKey(name: 'away_team_flag') String? awayTeamFlag,
    @DateTimeJsonConverter() @JsonKey(name: 'match_date_utc') DateTime? matchDateUtc,
    String? venue,
    String? stage,
    String? group,
    String? status,
    @JsonKey(name: 'home_score', fromJson: _nullableInt) int? homeScore,
    @JsonKey(name: 'away_score', fromJson: _nullableInt) int? awayScore,
  }) = _FixtureDto;

  const FixtureDto._();

  factory FixtureDto.fromJson(Map<String, dynamic> json) => _$FixtureDtoFromJson(_normalize(json));

  Fixture toEntity() {
    return Fixture(
      id: id ?? 0,
      homeTeamId: homeTeamId ?? 0,
      homeTeamName: homeTeamName ?? '',
      awayTeamId: awayTeamId ?? 0,
      awayTeamName: awayTeamName ?? '',
      homeTeamFlag: homeTeamFlag,
      awayTeamFlag: awayTeamFlag,
      matchDateUtc: matchDateUtc,
      venue: venue ?? '',
      stage: stage ?? '',
      group: group,
      status: MatchStatus.fromString(status),
      homeScore: homeScore,
      awayScore: awayScore,
    );
  }

  factory FixtureDto.fromEntity(Fixture fixture) {
    return FixtureDto(
      id: fixture.id,
      homeTeamId: fixture.homeTeamId,
      homeTeamName: fixture.homeTeamName,
      awayTeamId: fixture.awayTeamId,
      awayTeamName: fixture.awayTeamName,
      homeTeamFlag: fixture.homeTeamFlag,
      awayTeamFlag: fixture.awayTeamFlag,
      matchDateUtc: fixture.matchDateUtc,
      venue: fixture.venue,
      stage: fixture.stage,
      group: fixture.group,
      status: fixture.status.name,
      homeScore: fixture.homeScore,
      awayScore: fixture.awayScore,
    );
  }

  CachedFixture toCachedModel({Duration ttl = const Duration(hours: 6)}) {
    final now = DateTime.now().toUtc();
    return CachedFixture(
      id: (id ?? 0).toString(),
      homeTeamId: (homeTeamId ?? 0).toString(),
      homeTeamName: homeTeamName ?? '',
      awayTeamId: (awayTeamId ?? 0).toString(),
      awayTeamName: awayTeamName ?? '',
      homeTeamFlag: homeTeamFlag,
      awayTeamFlag: awayTeamFlag,
      matchDateUtc: matchDateUtc ?? now,
      venue: venue ?? '',
      stage: stage ?? '',
      group: group,
      status: status ?? 'unknown',
      homeScore: homeScore,
      awayScore: awayScore,
      createdAt: now,
      updatedAt: now,
      cachedAt: now,
      expiresAt: now.add(ttl),
    );
  }

  factory FixtureDto.fromCachedModel(CachedFixture fixture) {
    return FixtureDto(
      id: int.tryParse(fixture.id),
      homeTeamId: int.tryParse(fixture.homeTeamId),
      homeTeamName: fixture.homeTeamName,
      awayTeamId: int.tryParse(fixture.awayTeamId),
      awayTeamName: fixture.awayTeamName,
      homeTeamFlag: fixture.homeTeamFlag,
      awayTeamFlag: fixture.awayTeamFlag,
      matchDateUtc: fixture.matchDateUtc,
      venue: fixture.venue,
      stage: fixture.stage,
      group: fixture.group,
      status: fixture.status,
      homeScore: fixture.homeScore,
      awayScore: fixture.awayScore,
    );
  }
}

Map<String, dynamic> _normalize(Map<String, dynamic> json) => {
  ...json,
  'home_team_id': json['home_team_id'] ?? json['homeTeamId'],
  'home_team_name': json['home_team_name'] ?? json['homeTeamName'],
  'away_team_id': json['away_team_id'] ?? json['awayTeamId'],
  'away_team_name': json['away_team_name'] ?? json['awayTeamName'],
  'home_team_flag': json['home_team_flag'] ?? json['homeTeamFlag'],
  'away_team_flag': json['away_team_flag'] ?? json['awayTeamFlag'],
  'match_date_utc': json['match_date_utc'] ?? json['matchDateUtc'],
  'home_score': json['home_score'] ?? json['homeScore'],
  'away_score': json['away_score'] ?? json['awayScore'],
};

int? _nullableInt(Object? value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}
