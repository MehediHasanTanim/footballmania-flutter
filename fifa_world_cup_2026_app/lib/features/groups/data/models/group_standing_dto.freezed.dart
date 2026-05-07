// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_standing_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupStandingDto _$GroupStandingDtoFromJson(Map<String, dynamic> json) {
  return _GroupStandingDto.fromJson(json);
}

/// @nodoc
mixin _$GroupStandingDto {
  String? get group => throw _privateConstructorUsedError;
  @JsonKey(name: 'team_id', fromJson: _nullableInt)
  int? get teamId => throw _privateConstructorUsedError;
  @JsonKey(name: 'team_name')
  String? get teamName => throw _privateConstructorUsedError;
  @JsonKey(name: 'team_flag')
  String? get teamFlag => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _nullableInt)
  int? get played => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _nullableInt)
  int? get won => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _nullableInt)
  int? get drawn => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _nullableInt)
  int? get lost => throw _privateConstructorUsedError;
  @JsonKey(name: 'goals_for', fromJson: _nullableInt)
  int? get goalsFor => throw _privateConstructorUsedError;
  @JsonKey(name: 'goals_against', fromJson: _nullableInt)
  int? get goalsAgainst => throw _privateConstructorUsedError;
  @JsonKey(name: 'goal_difference', fromJson: _nullableInt)
  int? get goalDifference => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _nullableInt)
  int? get points => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _nullableInt)
  int? get rank => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupStandingDtoCopyWith<GroupStandingDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupStandingDtoCopyWith<$Res> {
  factory $GroupStandingDtoCopyWith(
          GroupStandingDto value, $Res Function(GroupStandingDto) then) =
      _$GroupStandingDtoCopyWithImpl<$Res, GroupStandingDto>;
  @useResult
  $Res call(
      {String? group,
      @JsonKey(name: 'team_id', fromJson: _nullableInt) int? teamId,
      @JsonKey(name: 'team_name') String? teamName,
      @JsonKey(name: 'team_flag') String? teamFlag,
      @JsonKey(fromJson: _nullableInt) int? played,
      @JsonKey(fromJson: _nullableInt) int? won,
      @JsonKey(fromJson: _nullableInt) int? drawn,
      @JsonKey(fromJson: _nullableInt) int? lost,
      @JsonKey(name: 'goals_for', fromJson: _nullableInt) int? goalsFor,
      @JsonKey(name: 'goals_against', fromJson: _nullableInt) int? goalsAgainst,
      @JsonKey(name: 'goal_difference', fromJson: _nullableInt)
      int? goalDifference,
      @JsonKey(fromJson: _nullableInt) int? points,
      @JsonKey(fromJson: _nullableInt) int? rank});
}

/// @nodoc
class _$GroupStandingDtoCopyWithImpl<$Res, $Val extends GroupStandingDto>
    implements $GroupStandingDtoCopyWith<$Res> {
  _$GroupStandingDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? group = freezed,
    Object? teamId = freezed,
    Object? teamName = freezed,
    Object? teamFlag = freezed,
    Object? played = freezed,
    Object? won = freezed,
    Object? drawn = freezed,
    Object? lost = freezed,
    Object? goalsFor = freezed,
    Object? goalsAgainst = freezed,
    Object? goalDifference = freezed,
    Object? points = freezed,
    Object? rank = freezed,
  }) {
    return _then(_value.copyWith(
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String?,
      teamId: freezed == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int?,
      teamName: freezed == teamName
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String?,
      teamFlag: freezed == teamFlag
          ? _value.teamFlag
          : teamFlag // ignore: cast_nullable_to_non_nullable
              as String?,
      played: freezed == played
          ? _value.played
          : played // ignore: cast_nullable_to_non_nullable
              as int?,
      won: freezed == won
          ? _value.won
          : won // ignore: cast_nullable_to_non_nullable
              as int?,
      drawn: freezed == drawn
          ? _value.drawn
          : drawn // ignore: cast_nullable_to_non_nullable
              as int?,
      lost: freezed == lost
          ? _value.lost
          : lost // ignore: cast_nullable_to_non_nullable
              as int?,
      goalsFor: freezed == goalsFor
          ? _value.goalsFor
          : goalsFor // ignore: cast_nullable_to_non_nullable
              as int?,
      goalsAgainst: freezed == goalsAgainst
          ? _value.goalsAgainst
          : goalsAgainst // ignore: cast_nullable_to_non_nullable
              as int?,
      goalDifference: freezed == goalDifference
          ? _value.goalDifference
          : goalDifference // ignore: cast_nullable_to_non_nullable
              as int?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupStandingDtoImplCopyWith<$Res>
    implements $GroupStandingDtoCopyWith<$Res> {
  factory _$$GroupStandingDtoImplCopyWith(_$GroupStandingDtoImpl value,
          $Res Function(_$GroupStandingDtoImpl) then) =
      __$$GroupStandingDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? group,
      @JsonKey(name: 'team_id', fromJson: _nullableInt) int? teamId,
      @JsonKey(name: 'team_name') String? teamName,
      @JsonKey(name: 'team_flag') String? teamFlag,
      @JsonKey(fromJson: _nullableInt) int? played,
      @JsonKey(fromJson: _nullableInt) int? won,
      @JsonKey(fromJson: _nullableInt) int? drawn,
      @JsonKey(fromJson: _nullableInt) int? lost,
      @JsonKey(name: 'goals_for', fromJson: _nullableInt) int? goalsFor,
      @JsonKey(name: 'goals_against', fromJson: _nullableInt) int? goalsAgainst,
      @JsonKey(name: 'goal_difference', fromJson: _nullableInt)
      int? goalDifference,
      @JsonKey(fromJson: _nullableInt) int? points,
      @JsonKey(fromJson: _nullableInt) int? rank});
}

/// @nodoc
class __$$GroupStandingDtoImplCopyWithImpl<$Res>
    extends _$GroupStandingDtoCopyWithImpl<$Res, _$GroupStandingDtoImpl>
    implements _$$GroupStandingDtoImplCopyWith<$Res> {
  __$$GroupStandingDtoImplCopyWithImpl(_$GroupStandingDtoImpl _value,
      $Res Function(_$GroupStandingDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? group = freezed,
    Object? teamId = freezed,
    Object? teamName = freezed,
    Object? teamFlag = freezed,
    Object? played = freezed,
    Object? won = freezed,
    Object? drawn = freezed,
    Object? lost = freezed,
    Object? goalsFor = freezed,
    Object? goalsAgainst = freezed,
    Object? goalDifference = freezed,
    Object? points = freezed,
    Object? rank = freezed,
  }) {
    return _then(_$GroupStandingDtoImpl(
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String?,
      teamId: freezed == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int?,
      teamName: freezed == teamName
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String?,
      teamFlag: freezed == teamFlag
          ? _value.teamFlag
          : teamFlag // ignore: cast_nullable_to_non_nullable
              as String?,
      played: freezed == played
          ? _value.played
          : played // ignore: cast_nullable_to_non_nullable
              as int?,
      won: freezed == won
          ? _value.won
          : won // ignore: cast_nullable_to_non_nullable
              as int?,
      drawn: freezed == drawn
          ? _value.drawn
          : drawn // ignore: cast_nullable_to_non_nullable
              as int?,
      lost: freezed == lost
          ? _value.lost
          : lost // ignore: cast_nullable_to_non_nullable
              as int?,
      goalsFor: freezed == goalsFor
          ? _value.goalsFor
          : goalsFor // ignore: cast_nullable_to_non_nullable
              as int?,
      goalsAgainst: freezed == goalsAgainst
          ? _value.goalsAgainst
          : goalsAgainst // ignore: cast_nullable_to_non_nullable
              as int?,
      goalDifference: freezed == goalDifference
          ? _value.goalDifference
          : goalDifference // ignore: cast_nullable_to_non_nullable
              as int?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupStandingDtoImpl extends _GroupStandingDto {
  const _$GroupStandingDtoImpl(
      {this.group,
      @JsonKey(name: 'team_id', fromJson: _nullableInt) this.teamId,
      @JsonKey(name: 'team_name') this.teamName,
      @JsonKey(name: 'team_flag') this.teamFlag,
      @JsonKey(fromJson: _nullableInt) this.played,
      @JsonKey(fromJson: _nullableInt) this.won,
      @JsonKey(fromJson: _nullableInt) this.drawn,
      @JsonKey(fromJson: _nullableInt) this.lost,
      @JsonKey(name: 'goals_for', fromJson: _nullableInt) this.goalsFor,
      @JsonKey(name: 'goals_against', fromJson: _nullableInt) this.goalsAgainst,
      @JsonKey(name: 'goal_difference', fromJson: _nullableInt)
      this.goalDifference,
      @JsonKey(fromJson: _nullableInt) this.points,
      @JsonKey(fromJson: _nullableInt) this.rank})
      : super._();

  factory _$GroupStandingDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupStandingDtoImplFromJson(json);

  @override
  final String? group;
  @override
  @JsonKey(name: 'team_id', fromJson: _nullableInt)
  final int? teamId;
  @override
  @JsonKey(name: 'team_name')
  final String? teamName;
  @override
  @JsonKey(name: 'team_flag')
  final String? teamFlag;
  @override
  @JsonKey(fromJson: _nullableInt)
  final int? played;
  @override
  @JsonKey(fromJson: _nullableInt)
  final int? won;
  @override
  @JsonKey(fromJson: _nullableInt)
  final int? drawn;
  @override
  @JsonKey(fromJson: _nullableInt)
  final int? lost;
  @override
  @JsonKey(name: 'goals_for', fromJson: _nullableInt)
  final int? goalsFor;
  @override
  @JsonKey(name: 'goals_against', fromJson: _nullableInt)
  final int? goalsAgainst;
  @override
  @JsonKey(name: 'goal_difference', fromJson: _nullableInt)
  final int? goalDifference;
  @override
  @JsonKey(fromJson: _nullableInt)
  final int? points;
  @override
  @JsonKey(fromJson: _nullableInt)
  final int? rank;

  @override
  String toString() {
    return 'GroupStandingDto(group: $group, teamId: $teamId, teamName: $teamName, teamFlag: $teamFlag, played: $played, won: $won, drawn: $drawn, lost: $lost, goalsFor: $goalsFor, goalsAgainst: $goalsAgainst, goalDifference: $goalDifference, points: $points, rank: $rank)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupStandingDtoImpl &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.teamName, teamName) ||
                other.teamName == teamName) &&
            (identical(other.teamFlag, teamFlag) ||
                other.teamFlag == teamFlag) &&
            (identical(other.played, played) || other.played == played) &&
            (identical(other.won, won) || other.won == won) &&
            (identical(other.drawn, drawn) || other.drawn == drawn) &&
            (identical(other.lost, lost) || other.lost == lost) &&
            (identical(other.goalsFor, goalsFor) ||
                other.goalsFor == goalsFor) &&
            (identical(other.goalsAgainst, goalsAgainst) ||
                other.goalsAgainst == goalsAgainst) &&
            (identical(other.goalDifference, goalDifference) ||
                other.goalDifference == goalDifference) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.rank, rank) || other.rank == rank));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      group,
      teamId,
      teamName,
      teamFlag,
      played,
      won,
      drawn,
      lost,
      goalsFor,
      goalsAgainst,
      goalDifference,
      points,
      rank);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupStandingDtoImplCopyWith<_$GroupStandingDtoImpl> get copyWith =>
      __$$GroupStandingDtoImplCopyWithImpl<_$GroupStandingDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupStandingDtoImplToJson(
      this,
    );
  }
}

abstract class _GroupStandingDto extends GroupStandingDto {
  const factory _GroupStandingDto(
      {final String? group,
      @JsonKey(name: 'team_id', fromJson: _nullableInt) final int? teamId,
      @JsonKey(name: 'team_name') final String? teamName,
      @JsonKey(name: 'team_flag') final String? teamFlag,
      @JsonKey(fromJson: _nullableInt) final int? played,
      @JsonKey(fromJson: _nullableInt) final int? won,
      @JsonKey(fromJson: _nullableInt) final int? drawn,
      @JsonKey(fromJson: _nullableInt) final int? lost,
      @JsonKey(name: 'goals_for', fromJson: _nullableInt) final int? goalsFor,
      @JsonKey(name: 'goals_against', fromJson: _nullableInt)
      final int? goalsAgainst,
      @JsonKey(name: 'goal_difference', fromJson: _nullableInt)
      final int? goalDifference,
      @JsonKey(fromJson: _nullableInt) final int? points,
      @JsonKey(fromJson: _nullableInt)
      final int? rank}) = _$GroupStandingDtoImpl;
  const _GroupStandingDto._() : super._();

  factory _GroupStandingDto.fromJson(Map<String, dynamic> json) =
      _$GroupStandingDtoImpl.fromJson;

  @override
  String? get group;
  @override
  @JsonKey(name: 'team_id', fromJson: _nullableInt)
  int? get teamId;
  @override
  @JsonKey(name: 'team_name')
  String? get teamName;
  @override
  @JsonKey(name: 'team_flag')
  String? get teamFlag;
  @override
  @JsonKey(fromJson: _nullableInt)
  int? get played;
  @override
  @JsonKey(fromJson: _nullableInt)
  int? get won;
  @override
  @JsonKey(fromJson: _nullableInt)
  int? get drawn;
  @override
  @JsonKey(fromJson: _nullableInt)
  int? get lost;
  @override
  @JsonKey(name: 'goals_for', fromJson: _nullableInt)
  int? get goalsFor;
  @override
  @JsonKey(name: 'goals_against', fromJson: _nullableInt)
  int? get goalsAgainst;
  @override
  @JsonKey(name: 'goal_difference', fromJson: _nullableInt)
  int? get goalDifference;
  @override
  @JsonKey(fromJson: _nullableInt)
  int? get points;
  @override
  @JsonKey(fromJson: _nullableInt)
  int? get rank;
  @override
  @JsonKey(ignore: true)
  _$$GroupStandingDtoImplCopyWith<_$GroupStandingDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
