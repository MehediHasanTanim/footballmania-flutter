// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_match_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LiveMatchDto _$LiveMatchDtoFromJson(Map<String, dynamic> json) {
  return _LiveMatchDto.fromJson(json);
}

/// @nodoc
mixin _$LiveMatchDto {
  @JsonKey(fromJson: _nullableInt)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'fixture_id', fromJson: _nullableInt)
  int? get fixtureId => throw _privateConstructorUsedError;
  @JsonKey(name: 'home_team_name')
  String? get homeTeamName => throw _privateConstructorUsedError;
  @JsonKey(name: 'away_team_name')
  String? get awayTeamName => throw _privateConstructorUsedError;
  @JsonKey(name: 'home_score', fromJson: _nullableInt)
  int? get homeScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'away_score', fromJson: _nullableInt)
  int? get awayScore => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _nullableInt)
  int? get elapsed => throw _privateConstructorUsedError;
  List<MatchEventDto> get events => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiveMatchDtoCopyWith<LiveMatchDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveMatchDtoCopyWith<$Res> {
  factory $LiveMatchDtoCopyWith(
          LiveMatchDto value, $Res Function(LiveMatchDto) then) =
      _$LiveMatchDtoCopyWithImpl<$Res, LiveMatchDto>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _nullableInt) int? id,
      @JsonKey(name: 'fixture_id', fromJson: _nullableInt) int? fixtureId,
      @JsonKey(name: 'home_team_name') String? homeTeamName,
      @JsonKey(name: 'away_team_name') String? awayTeamName,
      @JsonKey(name: 'home_score', fromJson: _nullableInt) int? homeScore,
      @JsonKey(name: 'away_score', fromJson: _nullableInt) int? awayScore,
      String? status,
      @JsonKey(fromJson: _nullableInt) int? elapsed,
      List<MatchEventDto> events});
}

/// @nodoc
class _$LiveMatchDtoCopyWithImpl<$Res, $Val extends LiveMatchDto>
    implements $LiveMatchDtoCopyWith<$Res> {
  _$LiveMatchDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fixtureId = freezed,
    Object? homeTeamName = freezed,
    Object? awayTeamName = freezed,
    Object? homeScore = freezed,
    Object? awayScore = freezed,
    Object? status = freezed,
    Object? elapsed = freezed,
    Object? events = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fixtureId: freezed == fixtureId
          ? _value.fixtureId
          : fixtureId // ignore: cast_nullable_to_non_nullable
              as int?,
      homeTeamName: freezed == homeTeamName
          ? _value.homeTeamName
          : homeTeamName // ignore: cast_nullable_to_non_nullable
              as String?,
      awayTeamName: freezed == awayTeamName
          ? _value.awayTeamName
          : awayTeamName // ignore: cast_nullable_to_non_nullable
              as String?,
      homeScore: freezed == homeScore
          ? _value.homeScore
          : homeScore // ignore: cast_nullable_to_non_nullable
              as int?,
      awayScore: freezed == awayScore
          ? _value.awayScore
          : awayScore // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      elapsed: freezed == elapsed
          ? _value.elapsed
          : elapsed // ignore: cast_nullable_to_non_nullable
              as int?,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<MatchEventDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiveMatchDtoImplCopyWith<$Res>
    implements $LiveMatchDtoCopyWith<$Res> {
  factory _$$LiveMatchDtoImplCopyWith(
          _$LiveMatchDtoImpl value, $Res Function(_$LiveMatchDtoImpl) then) =
      __$$LiveMatchDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _nullableInt) int? id,
      @JsonKey(name: 'fixture_id', fromJson: _nullableInt) int? fixtureId,
      @JsonKey(name: 'home_team_name') String? homeTeamName,
      @JsonKey(name: 'away_team_name') String? awayTeamName,
      @JsonKey(name: 'home_score', fromJson: _nullableInt) int? homeScore,
      @JsonKey(name: 'away_score', fromJson: _nullableInt) int? awayScore,
      String? status,
      @JsonKey(fromJson: _nullableInt) int? elapsed,
      List<MatchEventDto> events});
}

/// @nodoc
class __$$LiveMatchDtoImplCopyWithImpl<$Res>
    extends _$LiveMatchDtoCopyWithImpl<$Res, _$LiveMatchDtoImpl>
    implements _$$LiveMatchDtoImplCopyWith<$Res> {
  __$$LiveMatchDtoImplCopyWithImpl(
      _$LiveMatchDtoImpl _value, $Res Function(_$LiveMatchDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fixtureId = freezed,
    Object? homeTeamName = freezed,
    Object? awayTeamName = freezed,
    Object? homeScore = freezed,
    Object? awayScore = freezed,
    Object? status = freezed,
    Object? elapsed = freezed,
    Object? events = null,
  }) {
    return _then(_$LiveMatchDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fixtureId: freezed == fixtureId
          ? _value.fixtureId
          : fixtureId // ignore: cast_nullable_to_non_nullable
              as int?,
      homeTeamName: freezed == homeTeamName
          ? _value.homeTeamName
          : homeTeamName // ignore: cast_nullable_to_non_nullable
              as String?,
      awayTeamName: freezed == awayTeamName
          ? _value.awayTeamName
          : awayTeamName // ignore: cast_nullable_to_non_nullable
              as String?,
      homeScore: freezed == homeScore
          ? _value.homeScore
          : homeScore // ignore: cast_nullable_to_non_nullable
              as int?,
      awayScore: freezed == awayScore
          ? _value.awayScore
          : awayScore // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      elapsed: freezed == elapsed
          ? _value.elapsed
          : elapsed // ignore: cast_nullable_to_non_nullable
              as int?,
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<MatchEventDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveMatchDtoImpl extends _LiveMatchDto {
  const _$LiveMatchDtoImpl(
      {@JsonKey(fromJson: _nullableInt) this.id,
      @JsonKey(name: 'fixture_id', fromJson: _nullableInt) this.fixtureId,
      @JsonKey(name: 'home_team_name') this.homeTeamName,
      @JsonKey(name: 'away_team_name') this.awayTeamName,
      @JsonKey(name: 'home_score', fromJson: _nullableInt) this.homeScore,
      @JsonKey(name: 'away_score', fromJson: _nullableInt) this.awayScore,
      this.status,
      @JsonKey(fromJson: _nullableInt) this.elapsed,
      final List<MatchEventDto> events = const <MatchEventDto>[]})
      : _events = events,
        super._();

  factory _$LiveMatchDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveMatchDtoImplFromJson(json);

  @override
  @JsonKey(fromJson: _nullableInt)
  final int? id;
  @override
  @JsonKey(name: 'fixture_id', fromJson: _nullableInt)
  final int? fixtureId;
  @override
  @JsonKey(name: 'home_team_name')
  final String? homeTeamName;
  @override
  @JsonKey(name: 'away_team_name')
  final String? awayTeamName;
  @override
  @JsonKey(name: 'home_score', fromJson: _nullableInt)
  final int? homeScore;
  @override
  @JsonKey(name: 'away_score', fromJson: _nullableInt)
  final int? awayScore;
  @override
  final String? status;
  @override
  @JsonKey(fromJson: _nullableInt)
  final int? elapsed;
  final List<MatchEventDto> _events;
  @override
  @JsonKey()
  List<MatchEventDto> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  String toString() {
    return 'LiveMatchDto(id: $id, fixtureId: $fixtureId, homeTeamName: $homeTeamName, awayTeamName: $awayTeamName, homeScore: $homeScore, awayScore: $awayScore, status: $status, elapsed: $elapsed, events: $events)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveMatchDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fixtureId, fixtureId) ||
                other.fixtureId == fixtureId) &&
            (identical(other.homeTeamName, homeTeamName) ||
                other.homeTeamName == homeTeamName) &&
            (identical(other.awayTeamName, awayTeamName) ||
                other.awayTeamName == awayTeamName) &&
            (identical(other.homeScore, homeScore) ||
                other.homeScore == homeScore) &&
            (identical(other.awayScore, awayScore) ||
                other.awayScore == awayScore) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.elapsed, elapsed) || other.elapsed == elapsed) &&
            const DeepCollectionEquality().equals(other._events, _events));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      fixtureId,
      homeTeamName,
      awayTeamName,
      homeScore,
      awayScore,
      status,
      elapsed,
      const DeepCollectionEquality().hash(_events));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveMatchDtoImplCopyWith<_$LiveMatchDtoImpl> get copyWith =>
      __$$LiveMatchDtoImplCopyWithImpl<_$LiveMatchDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveMatchDtoImplToJson(
      this,
    );
  }
}

abstract class _LiveMatchDto extends LiveMatchDto {
  const factory _LiveMatchDto(
      {@JsonKey(fromJson: _nullableInt) final int? id,
      @JsonKey(name: 'fixture_id', fromJson: _nullableInt) final int? fixtureId,
      @JsonKey(name: 'home_team_name') final String? homeTeamName,
      @JsonKey(name: 'away_team_name') final String? awayTeamName,
      @JsonKey(name: 'home_score', fromJson: _nullableInt) final int? homeScore,
      @JsonKey(name: 'away_score', fromJson: _nullableInt) final int? awayScore,
      final String? status,
      @JsonKey(fromJson: _nullableInt) final int? elapsed,
      final List<MatchEventDto> events}) = _$LiveMatchDtoImpl;
  const _LiveMatchDto._() : super._();

  factory _LiveMatchDto.fromJson(Map<String, dynamic> json) =
      _$LiveMatchDtoImpl.fromJson;

  @override
  @JsonKey(fromJson: _nullableInt)
  int? get id;
  @override
  @JsonKey(name: 'fixture_id', fromJson: _nullableInt)
  int? get fixtureId;
  @override
  @JsonKey(name: 'home_team_name')
  String? get homeTeamName;
  @override
  @JsonKey(name: 'away_team_name')
  String? get awayTeamName;
  @override
  @JsonKey(name: 'home_score', fromJson: _nullableInt)
  int? get homeScore;
  @override
  @JsonKey(name: 'away_score', fromJson: _nullableInt)
  int? get awayScore;
  @override
  String? get status;
  @override
  @JsonKey(fromJson: _nullableInt)
  int? get elapsed;
  @override
  List<MatchEventDto> get events;
  @override
  @JsonKey(ignore: true)
  _$$LiveMatchDtoImplCopyWith<_$LiveMatchDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
