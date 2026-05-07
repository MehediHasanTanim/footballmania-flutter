// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fixture_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FixtureDto _$FixtureDtoFromJson(Map<String, dynamic> json) {
  return _FixtureDto.fromJson(json);
}

/// @nodoc
mixin _$FixtureDto {
  @JsonKey(fromJson: _nullableInt)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'home_team_id', fromJson: _nullableInt)
  int? get homeTeamId => throw _privateConstructorUsedError;
  @JsonKey(name: 'home_team_name')
  String? get homeTeamName => throw _privateConstructorUsedError;
  @JsonKey(name: 'away_team_id', fromJson: _nullableInt)
  int? get awayTeamId => throw _privateConstructorUsedError;
  @JsonKey(name: 'away_team_name')
  String? get awayTeamName => throw _privateConstructorUsedError;
  @JsonKey(name: 'home_team_flag')
  String? get homeTeamFlag => throw _privateConstructorUsedError;
  @JsonKey(name: 'away_team_flag')
  String? get awayTeamFlag => throw _privateConstructorUsedError;
  @DateTimeJsonConverter()
  @JsonKey(name: 'match_date_utc')
  DateTime? get matchDateUtc => throw _privateConstructorUsedError;
  String? get venue => throw _privateConstructorUsedError;
  String? get stage => throw _privateConstructorUsedError;
  String? get group => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'home_score', fromJson: _nullableInt)
  int? get homeScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'away_score', fromJson: _nullableInt)
  int? get awayScore => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FixtureDtoCopyWith<FixtureDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FixtureDtoCopyWith<$Res> {
  factory $FixtureDtoCopyWith(
    FixtureDto value,
    $Res Function(FixtureDto) then,
  ) = _$FixtureDtoCopyWithImpl<$Res, FixtureDto>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _nullableInt) int? id,
    @JsonKey(name: 'home_team_id', fromJson: _nullableInt) int? homeTeamId,
    @JsonKey(name: 'home_team_name') String? homeTeamName,
    @JsonKey(name: 'away_team_id', fromJson: _nullableInt) int? awayTeamId,
    @JsonKey(name: 'away_team_name') String? awayTeamName,
    @JsonKey(name: 'home_team_flag') String? homeTeamFlag,
    @JsonKey(name: 'away_team_flag') String? awayTeamFlag,
    @DateTimeJsonConverter()
    @JsonKey(name: 'match_date_utc')
    DateTime? matchDateUtc,
    String? venue,
    String? stage,
    String? group,
    String? status,
    @JsonKey(name: 'home_score', fromJson: _nullableInt) int? homeScore,
    @JsonKey(name: 'away_score', fromJson: _nullableInt) int? awayScore,
  });
}

/// @nodoc
class _$FixtureDtoCopyWithImpl<$Res, $Val extends FixtureDto>
    implements $FixtureDtoCopyWith<$Res> {
  _$FixtureDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? homeTeamId = freezed,
    Object? homeTeamName = freezed,
    Object? awayTeamId = freezed,
    Object? awayTeamName = freezed,
    Object? homeTeamFlag = freezed,
    Object? awayTeamFlag = freezed,
    Object? matchDateUtc = freezed,
    Object? venue = freezed,
    Object? stage = freezed,
    Object? group = freezed,
    Object? status = freezed,
    Object? homeScore = freezed,
    Object? awayScore = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            homeTeamId: freezed == homeTeamId
                ? _value.homeTeamId
                : homeTeamId // ignore: cast_nullable_to_non_nullable
                      as int?,
            homeTeamName: freezed == homeTeamName
                ? _value.homeTeamName
                : homeTeamName // ignore: cast_nullable_to_non_nullable
                      as String?,
            awayTeamId: freezed == awayTeamId
                ? _value.awayTeamId
                : awayTeamId // ignore: cast_nullable_to_non_nullable
                      as int?,
            awayTeamName: freezed == awayTeamName
                ? _value.awayTeamName
                : awayTeamName // ignore: cast_nullable_to_non_nullable
                      as String?,
            homeTeamFlag: freezed == homeTeamFlag
                ? _value.homeTeamFlag
                : homeTeamFlag // ignore: cast_nullable_to_non_nullable
                      as String?,
            awayTeamFlag: freezed == awayTeamFlag
                ? _value.awayTeamFlag
                : awayTeamFlag // ignore: cast_nullable_to_non_nullable
                      as String?,
            matchDateUtc: freezed == matchDateUtc
                ? _value.matchDateUtc
                : matchDateUtc // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            venue: freezed == venue
                ? _value.venue
                : venue // ignore: cast_nullable_to_non_nullable
                      as String?,
            stage: freezed == stage
                ? _value.stage
                : stage // ignore: cast_nullable_to_non_nullable
                      as String?,
            group: freezed == group
                ? _value.group
                : group // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            homeScore: freezed == homeScore
                ? _value.homeScore
                : homeScore // ignore: cast_nullable_to_non_nullable
                      as int?,
            awayScore: freezed == awayScore
                ? _value.awayScore
                : awayScore // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FixtureDtoImplCopyWith<$Res>
    implements $FixtureDtoCopyWith<$Res> {
  factory _$$FixtureDtoImplCopyWith(
    _$FixtureDtoImpl value,
    $Res Function(_$FixtureDtoImpl) then,
  ) = __$$FixtureDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _nullableInt) int? id,
    @JsonKey(name: 'home_team_id', fromJson: _nullableInt) int? homeTeamId,
    @JsonKey(name: 'home_team_name') String? homeTeamName,
    @JsonKey(name: 'away_team_id', fromJson: _nullableInt) int? awayTeamId,
    @JsonKey(name: 'away_team_name') String? awayTeamName,
    @JsonKey(name: 'home_team_flag') String? homeTeamFlag,
    @JsonKey(name: 'away_team_flag') String? awayTeamFlag,
    @DateTimeJsonConverter()
    @JsonKey(name: 'match_date_utc')
    DateTime? matchDateUtc,
    String? venue,
    String? stage,
    String? group,
    String? status,
    @JsonKey(name: 'home_score', fromJson: _nullableInt) int? homeScore,
    @JsonKey(name: 'away_score', fromJson: _nullableInt) int? awayScore,
  });
}

/// @nodoc
class __$$FixtureDtoImplCopyWithImpl<$Res>
    extends _$FixtureDtoCopyWithImpl<$Res, _$FixtureDtoImpl>
    implements _$$FixtureDtoImplCopyWith<$Res> {
  __$$FixtureDtoImplCopyWithImpl(
    _$FixtureDtoImpl _value,
    $Res Function(_$FixtureDtoImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? homeTeamId = freezed,
    Object? homeTeamName = freezed,
    Object? awayTeamId = freezed,
    Object? awayTeamName = freezed,
    Object? homeTeamFlag = freezed,
    Object? awayTeamFlag = freezed,
    Object? matchDateUtc = freezed,
    Object? venue = freezed,
    Object? stage = freezed,
    Object? group = freezed,
    Object? status = freezed,
    Object? homeScore = freezed,
    Object? awayScore = freezed,
  }) {
    return _then(
      _$FixtureDtoImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        homeTeamId: freezed == homeTeamId
            ? _value.homeTeamId
            : homeTeamId // ignore: cast_nullable_to_non_nullable
                  as int?,
        homeTeamName: freezed == homeTeamName
            ? _value.homeTeamName
            : homeTeamName // ignore: cast_nullable_to_non_nullable
                  as String?,
        awayTeamId: freezed == awayTeamId
            ? _value.awayTeamId
            : awayTeamId // ignore: cast_nullable_to_non_nullable
                  as int?,
        awayTeamName: freezed == awayTeamName
            ? _value.awayTeamName
            : awayTeamName // ignore: cast_nullable_to_non_nullable
                  as String?,
        homeTeamFlag: freezed == homeTeamFlag
            ? _value.homeTeamFlag
            : homeTeamFlag // ignore: cast_nullable_to_non_nullable
                  as String?,
        awayTeamFlag: freezed == awayTeamFlag
            ? _value.awayTeamFlag
            : awayTeamFlag // ignore: cast_nullable_to_non_nullable
                  as String?,
        matchDateUtc: freezed == matchDateUtc
            ? _value.matchDateUtc
            : matchDateUtc // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        venue: freezed == venue
            ? _value.venue
            : venue // ignore: cast_nullable_to_non_nullable
                  as String?,
        stage: freezed == stage
            ? _value.stage
            : stage // ignore: cast_nullable_to_non_nullable
                  as String?,
        group: freezed == group
            ? _value.group
            : group // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        homeScore: freezed == homeScore
            ? _value.homeScore
            : homeScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        awayScore: freezed == awayScore
            ? _value.awayScore
            : awayScore // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FixtureDtoImpl extends _FixtureDto {
  const _$FixtureDtoImpl({
    @JsonKey(fromJson: _nullableInt) this.id,
    @JsonKey(name: 'home_team_id', fromJson: _nullableInt) this.homeTeamId,
    @JsonKey(name: 'home_team_name') this.homeTeamName,
    @JsonKey(name: 'away_team_id', fromJson: _nullableInt) this.awayTeamId,
    @JsonKey(name: 'away_team_name') this.awayTeamName,
    @JsonKey(name: 'home_team_flag') this.homeTeamFlag,
    @JsonKey(name: 'away_team_flag') this.awayTeamFlag,
    @DateTimeJsonConverter() @JsonKey(name: 'match_date_utc') this.matchDateUtc,
    this.venue,
    this.stage,
    this.group,
    this.status,
    @JsonKey(name: 'home_score', fromJson: _nullableInt) this.homeScore,
    @JsonKey(name: 'away_score', fromJson: _nullableInt) this.awayScore,
  }) : super._();

  factory _$FixtureDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FixtureDtoImplFromJson(json);

  @override
  @JsonKey(fromJson: _nullableInt)
  final int? id;
  @override
  @JsonKey(name: 'home_team_id', fromJson: _nullableInt)
  final int? homeTeamId;
  @override
  @JsonKey(name: 'home_team_name')
  final String? homeTeamName;
  @override
  @JsonKey(name: 'away_team_id', fromJson: _nullableInt)
  final int? awayTeamId;
  @override
  @JsonKey(name: 'away_team_name')
  final String? awayTeamName;
  @override
  @JsonKey(name: 'home_team_flag')
  final String? homeTeamFlag;
  @override
  @JsonKey(name: 'away_team_flag')
  final String? awayTeamFlag;
  @override
  @DateTimeJsonConverter()
  @JsonKey(name: 'match_date_utc')
  final DateTime? matchDateUtc;
  @override
  final String? venue;
  @override
  final String? stage;
  @override
  final String? group;
  @override
  final String? status;
  @override
  @JsonKey(name: 'home_score', fromJson: _nullableInt)
  final int? homeScore;
  @override
  @JsonKey(name: 'away_score', fromJson: _nullableInt)
  final int? awayScore;

  @override
  String toString() {
    return 'FixtureDto(id: $id, homeTeamId: $homeTeamId, homeTeamName: $homeTeamName, awayTeamId: $awayTeamId, awayTeamName: $awayTeamName, homeTeamFlag: $homeTeamFlag, awayTeamFlag: $awayTeamFlag, matchDateUtc: $matchDateUtc, venue: $venue, stage: $stage, group: $group, status: $status, homeScore: $homeScore, awayScore: $awayScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FixtureDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.homeTeamId, homeTeamId) ||
                other.homeTeamId == homeTeamId) &&
            (identical(other.homeTeamName, homeTeamName) ||
                other.homeTeamName == homeTeamName) &&
            (identical(other.awayTeamId, awayTeamId) ||
                other.awayTeamId == awayTeamId) &&
            (identical(other.awayTeamName, awayTeamName) ||
                other.awayTeamName == awayTeamName) &&
            (identical(other.homeTeamFlag, homeTeamFlag) ||
                other.homeTeamFlag == homeTeamFlag) &&
            (identical(other.awayTeamFlag, awayTeamFlag) ||
                other.awayTeamFlag == awayTeamFlag) &&
            (identical(other.matchDateUtc, matchDateUtc) ||
                other.matchDateUtc == matchDateUtc) &&
            (identical(other.venue, venue) || other.venue == venue) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.homeScore, homeScore) ||
                other.homeScore == homeScore) &&
            (identical(other.awayScore, awayScore) ||
                other.awayScore == awayScore));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    homeTeamId,
    homeTeamName,
    awayTeamId,
    awayTeamName,
    homeTeamFlag,
    awayTeamFlag,
    matchDateUtc,
    venue,
    stage,
    group,
    status,
    homeScore,
    awayScore,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FixtureDtoImplCopyWith<_$FixtureDtoImpl> get copyWith =>
      __$$FixtureDtoImplCopyWithImpl<_$FixtureDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FixtureDtoImplToJson(this);
  }
}

abstract class _FixtureDto extends FixtureDto {
  const factory _FixtureDto({
    @JsonKey(fromJson: _nullableInt) final int? id,
    @JsonKey(name: 'home_team_id', fromJson: _nullableInt)
    final int? homeTeamId,
    @JsonKey(name: 'home_team_name') final String? homeTeamName,
    @JsonKey(name: 'away_team_id', fromJson: _nullableInt)
    final int? awayTeamId,
    @JsonKey(name: 'away_team_name') final String? awayTeamName,
    @JsonKey(name: 'home_team_flag') final String? homeTeamFlag,
    @JsonKey(name: 'away_team_flag') final String? awayTeamFlag,
    @DateTimeJsonConverter()
    @JsonKey(name: 'match_date_utc')
    final DateTime? matchDateUtc,
    final String? venue,
    final String? stage,
    final String? group,
    final String? status,
    @JsonKey(name: 'home_score', fromJson: _nullableInt) final int? homeScore,
    @JsonKey(name: 'away_score', fromJson: _nullableInt) final int? awayScore,
  }) = _$FixtureDtoImpl;
  const _FixtureDto._() : super._();

  factory _FixtureDto.fromJson(Map<String, dynamic> json) =
      _$FixtureDtoImpl.fromJson;

  @override
  @JsonKey(fromJson: _nullableInt)
  int? get id;
  @override
  @JsonKey(name: 'home_team_id', fromJson: _nullableInt)
  int? get homeTeamId;
  @override
  @JsonKey(name: 'home_team_name')
  String? get homeTeamName;
  @override
  @JsonKey(name: 'away_team_id', fromJson: _nullableInt)
  int? get awayTeamId;
  @override
  @JsonKey(name: 'away_team_name')
  String? get awayTeamName;
  @override
  @JsonKey(name: 'home_team_flag')
  String? get homeTeamFlag;
  @override
  @JsonKey(name: 'away_team_flag')
  String? get awayTeamFlag;
  @override
  @DateTimeJsonConverter()
  @JsonKey(name: 'match_date_utc')
  DateTime? get matchDateUtc;
  @override
  String? get venue;
  @override
  String? get stage;
  @override
  String? get group;
  @override
  String? get status;
  @override
  @JsonKey(name: 'home_score', fromJson: _nullableInt)
  int? get homeScore;
  @override
  @JsonKey(name: 'away_score', fromJson: _nullableInt)
  int? get awayScore;
  @override
  @JsonKey(ignore: true)
  _$$FixtureDtoImplCopyWith<_$FixtureDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
