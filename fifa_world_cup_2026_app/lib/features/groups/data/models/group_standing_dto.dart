import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/group_standing.dart';

part 'group_standing_dto.freezed.dart';
part 'group_standing_dto.g.dart';

@freezed
class GroupStandingDto with _$GroupStandingDto {
  const factory GroupStandingDto({
    String? group,
    @JsonKey(name: 'team_id', fromJson: _nullableInt) int? teamId,
    @JsonKey(name: 'team_name') String? teamName,
    @JsonKey(name: 'team_flag') String? teamFlag,
    @JsonKey(fromJson: _nullableInt) int? played,
    @JsonKey(fromJson: _nullableInt) int? won,
    @JsonKey(fromJson: _nullableInt) int? drawn,
    @JsonKey(fromJson: _nullableInt) int? lost,
    @JsonKey(name: 'goals_for', fromJson: _nullableInt) int? goalsFor,
    @JsonKey(name: 'goals_against', fromJson: _nullableInt) int? goalsAgainst,
    @JsonKey(name: 'goal_difference', fromJson: _nullableInt) int? goalDifference,
    @JsonKey(fromJson: _nullableInt) int? points,
    @JsonKey(fromJson: _nullableInt) int? rank,
  }) = _GroupStandingDto;

  const GroupStandingDto._();

  factory GroupStandingDto.fromJson(Map<String, dynamic> json) => _$GroupStandingDtoFromJson(_normalize(json));

  GroupStanding toEntity() {
    return GroupStanding(
      group: group ?? '',
      teamId: teamId ?? 0,
      teamName: teamName ?? '',
      teamFlag: teamFlag,
      played: played ?? 0,
      won: won ?? 0,
      drawn: drawn ?? 0,
      lost: lost ?? 0,
      goalsFor: goalsFor ?? 0,
      goalsAgainst: goalsAgainst ?? 0,
      points: points ?? 0,
      rank: rank ?? 0,
    );
  }

  factory GroupStandingDto.fromEntity(GroupStanding standing) {
    return GroupStandingDto(
      group: standing.group,
      teamId: standing.teamId,
      teamName: standing.teamName,
      teamFlag: standing.teamFlag,
      played: standing.played,
      won: standing.won,
      drawn: standing.drawn,
      lost: standing.lost,
      goalsFor: standing.goalsFor,
      goalsAgainst: standing.goalsAgainst,
      goalDifference: standing.goalDifference,
      points: standing.points,
      rank: standing.rank,
    );
  }
}

Map<String, dynamic> _normalize(Map<String, dynamic> json) => {
  ...json,
  'team_id': json['team_id'] ?? json['teamId'],
  'team_name': json['team_name'] ?? json['teamName'],
  'team_flag': json['team_flag'] ?? json['teamFlag'],
  'goals_for': json['goals_for'] ?? json['goalsFor'],
  'goals_against': json['goals_against'] ?? json['goalsAgainst'],
  'goal_difference': json['goal_difference'] ?? json['goalDifference'],
};

int? _nullableInt(Object? value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}
