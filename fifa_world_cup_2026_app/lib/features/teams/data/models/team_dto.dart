import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/team.dart';
import 'cached_team.dart';

part 'team_dto.freezed.dart';
part 'team_dto.g.dart';

@freezed
class TeamDto with _$TeamDto {
  const factory TeamDto({
    @JsonKey(fromJson: _nullableInt) int? id,
    String? name,
    @JsonKey(name: 'country_code') String? countryCode,
    @JsonKey(name: 'flag_url') String? flagUrl,
    String? group,
    String? coach,
    @JsonKey(name: 'fifa_ranking', fromJson: _nullableInt) int? fifaRanking,
  }) = _TeamDto;

  const TeamDto._();

  factory TeamDto.fromJson(Map<String, dynamic> json) => _$TeamDtoFromJson(_normalize(json));

  Team toEntity() {
    return Team(
      id: id ?? 0,
      name: name ?? '',
      countryCode: countryCode ?? '',
      flagUrl: flagUrl,
      group: group,
      coach: coach,
      fifaRanking: fifaRanking,
    );
  }

  factory TeamDto.fromEntity(Team team) {
    return TeamDto(
      id: team.id,
      name: team.name,
      countryCode: team.countryCode,
      flagUrl: team.flagUrl,
      group: team.group,
      coach: team.coach,
      fifaRanking: team.fifaRanking,
    );
  }

  CachedTeam toCachedModel({Duration ttl = const Duration(hours: 24)}) {
    final now = DateTime.now().toUtc();
    return CachedTeam(
      id: (id ?? 0).toString(),
      name: name ?? '',
      countryCode: countryCode ?? '',
      flagUrl: flagUrl,
      group: group,
      coach: coach,
      fifaRanking: fifaRanking,
      createdAt: now,
      updatedAt: now,
      cachedAt: now,
      expiresAt: now.add(ttl),
    );
  }

  factory TeamDto.fromCachedModel(CachedTeam team) {
    return TeamDto(
      id: int.tryParse(team.id),
      name: team.name,
      countryCode: team.countryCode,
      flagUrl: team.flagUrl,
      group: team.group,
      coach: team.coach,
      fifaRanking: team.fifaRanking,
    );
  }
}

Map<String, dynamic> _normalize(Map<String, dynamic> json) => {
  ...json,
  'country_code': json['country_code'] ?? json['countryCode'],
  'flag_url': json['flag_url'] ?? json['flagUrl'],
  'fifa_ranking': json['fifa_ranking'] ?? json['fifaRanking'],
};

int? _nullableInt(Object? value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}
