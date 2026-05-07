// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MatchDto _$MatchDtoFromJson(Map<String, dynamic> json) {
  return _MatchDto.fromJson(json);
}

/// @nodoc
mixin _$MatchDto {
  @JsonKey(fromJson: _nullableInt)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'fixture_id', fromJson: _nullableInt)
  int? get fixtureId => throw _privateConstructorUsedError;
  @JsonKey(name: 'home_team')
  String? get homeTeam => throw _privateConstructorUsedError;
  @JsonKey(name: 'away_team')
  String? get awayTeam => throw _privateConstructorUsedError;
  String? get score => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get venue => throw _privateConstructorUsedError;
  @DateTimeJsonConverter()
  @JsonKey(name: 'kickoff_time_utc')
  DateTime? get kickoffTimeUtc => throw _privateConstructorUsedError;
  List<MatchEventDto> get events => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchDtoCopyWith<MatchDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchDtoCopyWith<$Res> {
  factory $MatchDtoCopyWith(MatchDto value, $Res Function(MatchDto) then) =
      _$MatchDtoCopyWithImpl<$Res, MatchDto>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _nullableInt) int? id,
      @JsonKey(name: 'fixture_id', fromJson: _nullableInt) int? fixtureId,
      @JsonKey(name: 'home_team') String? homeTeam,
      @JsonKey(name: 'away_team') String? awayTeam,
      String? score,
      String? status,
      String? venue,
      @DateTimeJsonConverter()
      @JsonKey(name: 'kickoff_time_utc')
      DateTime? kickoffTimeUtc,
      List<MatchEventDto> events});
}

/// @nodoc
class _$MatchDtoCopyWithImpl<$Res, $Val extends MatchDto>
    implements $MatchDtoCopyWith<$Res> {
  _$MatchDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fixtureId = freezed,
    Object? homeTeam = freezed,
    Object? awayTeam = freezed,
    Object? score = freezed,
    Object? status = freezed,
    Object? venue = freezed,
    Object? kickoffTimeUtc = freezed,
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
      homeTeam: freezed == homeTeam
          ? _value.homeTeam
          : homeTeam // ignore: cast_nullable_to_non_nullable
              as String?,
      awayTeam: freezed == awayTeam
          ? _value.awayTeam
          : awayTeam // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      venue: freezed == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as String?,
      kickoffTimeUtc: freezed == kickoffTimeUtc
          ? _value.kickoffTimeUtc
          : kickoffTimeUtc // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<MatchEventDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchDtoImplCopyWith<$Res>
    implements $MatchDtoCopyWith<$Res> {
  factory _$$MatchDtoImplCopyWith(
          _$MatchDtoImpl value, $Res Function(_$MatchDtoImpl) then) =
      __$$MatchDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _nullableInt) int? id,
      @JsonKey(name: 'fixture_id', fromJson: _nullableInt) int? fixtureId,
      @JsonKey(name: 'home_team') String? homeTeam,
      @JsonKey(name: 'away_team') String? awayTeam,
      String? score,
      String? status,
      String? venue,
      @DateTimeJsonConverter()
      @JsonKey(name: 'kickoff_time_utc')
      DateTime? kickoffTimeUtc,
      List<MatchEventDto> events});
}

/// @nodoc
class __$$MatchDtoImplCopyWithImpl<$Res>
    extends _$MatchDtoCopyWithImpl<$Res, _$MatchDtoImpl>
    implements _$$MatchDtoImplCopyWith<$Res> {
  __$$MatchDtoImplCopyWithImpl(
      _$MatchDtoImpl _value, $Res Function(_$MatchDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fixtureId = freezed,
    Object? homeTeam = freezed,
    Object? awayTeam = freezed,
    Object? score = freezed,
    Object? status = freezed,
    Object? venue = freezed,
    Object? kickoffTimeUtc = freezed,
    Object? events = null,
  }) {
    return _then(_$MatchDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fixtureId: freezed == fixtureId
          ? _value.fixtureId
          : fixtureId // ignore: cast_nullable_to_non_nullable
              as int?,
      homeTeam: freezed == homeTeam
          ? _value.homeTeam
          : homeTeam // ignore: cast_nullable_to_non_nullable
              as String?,
      awayTeam: freezed == awayTeam
          ? _value.awayTeam
          : awayTeam // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      venue: freezed == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as String?,
      kickoffTimeUtc: freezed == kickoffTimeUtc
          ? _value.kickoffTimeUtc
          : kickoffTimeUtc // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<MatchEventDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchDtoImpl extends _MatchDto {
  const _$MatchDtoImpl(
      {@JsonKey(fromJson: _nullableInt) this.id,
      @JsonKey(name: 'fixture_id', fromJson: _nullableInt) this.fixtureId,
      @JsonKey(name: 'home_team') this.homeTeam,
      @JsonKey(name: 'away_team') this.awayTeam,
      this.score,
      this.status,
      this.venue,
      @DateTimeJsonConverter()
      @JsonKey(name: 'kickoff_time_utc')
      this.kickoffTimeUtc,
      final List<MatchEventDto> events = const <MatchEventDto>[]})
      : _events = events,
        super._();

  factory _$MatchDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchDtoImplFromJson(json);

  @override
  @JsonKey(fromJson: _nullableInt)
  final int? id;
  @override
  @JsonKey(name: 'fixture_id', fromJson: _nullableInt)
  final int? fixtureId;
  @override
  @JsonKey(name: 'home_team')
  final String? homeTeam;
  @override
  @JsonKey(name: 'away_team')
  final String? awayTeam;
  @override
  final String? score;
  @override
  final String? status;
  @override
  final String? venue;
  @override
  @DateTimeJsonConverter()
  @JsonKey(name: 'kickoff_time_utc')
  final DateTime? kickoffTimeUtc;
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
    return 'MatchDto(id: $id, fixtureId: $fixtureId, homeTeam: $homeTeam, awayTeam: $awayTeam, score: $score, status: $status, venue: $venue, kickoffTimeUtc: $kickoffTimeUtc, events: $events)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fixtureId, fixtureId) ||
                other.fixtureId == fixtureId) &&
            (identical(other.homeTeam, homeTeam) ||
                other.homeTeam == homeTeam) &&
            (identical(other.awayTeam, awayTeam) ||
                other.awayTeam == awayTeam) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.venue, venue) || other.venue == venue) &&
            (identical(other.kickoffTimeUtc, kickoffTimeUtc) ||
                other.kickoffTimeUtc == kickoffTimeUtc) &&
            const DeepCollectionEquality().equals(other._events, _events));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      fixtureId,
      homeTeam,
      awayTeam,
      score,
      status,
      venue,
      kickoffTimeUtc,
      const DeepCollectionEquality().hash(_events));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchDtoImplCopyWith<_$MatchDtoImpl> get copyWith =>
      __$$MatchDtoImplCopyWithImpl<_$MatchDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchDtoImplToJson(
      this,
    );
  }
}

abstract class _MatchDto extends MatchDto {
  const factory _MatchDto(
      {@JsonKey(fromJson: _nullableInt) final int? id,
      @JsonKey(name: 'fixture_id', fromJson: _nullableInt) final int? fixtureId,
      @JsonKey(name: 'home_team') final String? homeTeam,
      @JsonKey(name: 'away_team') final String? awayTeam,
      final String? score,
      final String? status,
      final String? venue,
      @DateTimeJsonConverter()
      @JsonKey(name: 'kickoff_time_utc')
      final DateTime? kickoffTimeUtc,
      final List<MatchEventDto> events}) = _$MatchDtoImpl;
  const _MatchDto._() : super._();

  factory _MatchDto.fromJson(Map<String, dynamic> json) =
      _$MatchDtoImpl.fromJson;

  @override
  @JsonKey(fromJson: _nullableInt)
  int? get id;
  @override
  @JsonKey(name: 'fixture_id', fromJson: _nullableInt)
  int? get fixtureId;
  @override
  @JsonKey(name: 'home_team')
  String? get homeTeam;
  @override
  @JsonKey(name: 'away_team')
  String? get awayTeam;
  @override
  String? get score;
  @override
  String? get status;
  @override
  String? get venue;
  @override
  @DateTimeJsonConverter()
  @JsonKey(name: 'kickoff_time_utc')
  DateTime? get kickoffTimeUtc;
  @override
  List<MatchEventDto> get events;
  @override
  @JsonKey(ignore: true)
  _$$MatchDtoImplCopyWith<_$MatchDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
