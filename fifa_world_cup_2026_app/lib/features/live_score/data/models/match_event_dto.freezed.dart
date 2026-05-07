// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_event_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MatchEventDto _$MatchEventDtoFromJson(Map<String, dynamic> json) {
  return _MatchEventDto.fromJson(json);
}

/// @nodoc
mixin _$MatchEventDto {
  @JsonKey(fromJson: _nullableInt)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _nullableInt)
  int? get minute => throw _privateConstructorUsedError;
  @JsonKey(name: 'team_id', fromJson: _nullableInt)
  int? get teamId => throw _privateConstructorUsedError;
  @JsonKey(name: 'team_name')
  String? get teamName => throw _privateConstructorUsedError;
  @JsonKey(name: 'player_name')
  String? get playerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'assist_name')
  String? get assistName => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get detail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchEventDtoCopyWith<MatchEventDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchEventDtoCopyWith<$Res> {
  factory $MatchEventDtoCopyWith(
          MatchEventDto value, $Res Function(MatchEventDto) then) =
      _$MatchEventDtoCopyWithImpl<$Res, MatchEventDto>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _nullableInt) int? id,
      @JsonKey(fromJson: _nullableInt) int? minute,
      @JsonKey(name: 'team_id', fromJson: _nullableInt) int? teamId,
      @JsonKey(name: 'team_name') String? teamName,
      @JsonKey(name: 'player_name') String? playerName,
      @JsonKey(name: 'assist_name') String? assistName,
      String? type,
      String? detail});
}

/// @nodoc
class _$MatchEventDtoCopyWithImpl<$Res, $Val extends MatchEventDto>
    implements $MatchEventDtoCopyWith<$Res> {
  _$MatchEventDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? minute = freezed,
    Object? teamId = freezed,
    Object? teamName = freezed,
    Object? playerName = freezed,
    Object? assistName = freezed,
    Object? type = freezed,
    Object? detail = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      minute: freezed == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int?,
      teamId: freezed == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int?,
      teamName: freezed == teamName
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String?,
      playerName: freezed == playerName
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String?,
      assistName: freezed == assistName
          ? _value.assistName
          : assistName // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchEventDtoImplCopyWith<$Res>
    implements $MatchEventDtoCopyWith<$Res> {
  factory _$$MatchEventDtoImplCopyWith(
          _$MatchEventDtoImpl value, $Res Function(_$MatchEventDtoImpl) then) =
      __$$MatchEventDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _nullableInt) int? id,
      @JsonKey(fromJson: _nullableInt) int? minute,
      @JsonKey(name: 'team_id', fromJson: _nullableInt) int? teamId,
      @JsonKey(name: 'team_name') String? teamName,
      @JsonKey(name: 'player_name') String? playerName,
      @JsonKey(name: 'assist_name') String? assistName,
      String? type,
      String? detail});
}

/// @nodoc
class __$$MatchEventDtoImplCopyWithImpl<$Res>
    extends _$MatchEventDtoCopyWithImpl<$Res, _$MatchEventDtoImpl>
    implements _$$MatchEventDtoImplCopyWith<$Res> {
  __$$MatchEventDtoImplCopyWithImpl(
      _$MatchEventDtoImpl _value, $Res Function(_$MatchEventDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? minute = freezed,
    Object? teamId = freezed,
    Object? teamName = freezed,
    Object? playerName = freezed,
    Object? assistName = freezed,
    Object? type = freezed,
    Object? detail = freezed,
  }) {
    return _then(_$MatchEventDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      minute: freezed == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int?,
      teamId: freezed == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int?,
      teamName: freezed == teamName
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String?,
      playerName: freezed == playerName
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String?,
      assistName: freezed == assistName
          ? _value.assistName
          : assistName // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchEventDtoImpl extends _MatchEventDto {
  const _$MatchEventDtoImpl(
      {@JsonKey(fromJson: _nullableInt) this.id,
      @JsonKey(fromJson: _nullableInt) this.minute,
      @JsonKey(name: 'team_id', fromJson: _nullableInt) this.teamId,
      @JsonKey(name: 'team_name') this.teamName,
      @JsonKey(name: 'player_name') this.playerName,
      @JsonKey(name: 'assist_name') this.assistName,
      this.type,
      this.detail})
      : super._();

  factory _$MatchEventDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchEventDtoImplFromJson(json);

  @override
  @JsonKey(fromJson: _nullableInt)
  final int? id;
  @override
  @JsonKey(fromJson: _nullableInt)
  final int? minute;
  @override
  @JsonKey(name: 'team_id', fromJson: _nullableInt)
  final int? teamId;
  @override
  @JsonKey(name: 'team_name')
  final String? teamName;
  @override
  @JsonKey(name: 'player_name')
  final String? playerName;
  @override
  @JsonKey(name: 'assist_name')
  final String? assistName;
  @override
  final String? type;
  @override
  final String? detail;

  @override
  String toString() {
    return 'MatchEventDto(id: $id, minute: $minute, teamId: $teamId, teamName: $teamName, playerName: $playerName, assistName: $assistName, type: $type, detail: $detail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchEventDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.minute, minute) || other.minute == minute) &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.teamName, teamName) ||
                other.teamName == teamName) &&
            (identical(other.playerName, playerName) ||
                other.playerName == playerName) &&
            (identical(other.assistName, assistName) ||
                other.assistName == assistName) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.detail, detail) || other.detail == detail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, minute, teamId, teamName,
      playerName, assistName, type, detail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchEventDtoImplCopyWith<_$MatchEventDtoImpl> get copyWith =>
      __$$MatchEventDtoImplCopyWithImpl<_$MatchEventDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchEventDtoImplToJson(
      this,
    );
  }
}

abstract class _MatchEventDto extends MatchEventDto {
  const factory _MatchEventDto(
      {@JsonKey(fromJson: _nullableInt) final int? id,
      @JsonKey(fromJson: _nullableInt) final int? minute,
      @JsonKey(name: 'team_id', fromJson: _nullableInt) final int? teamId,
      @JsonKey(name: 'team_name') final String? teamName,
      @JsonKey(name: 'player_name') final String? playerName,
      @JsonKey(name: 'assist_name') final String? assistName,
      final String? type,
      final String? detail}) = _$MatchEventDtoImpl;
  const _MatchEventDto._() : super._();

  factory _MatchEventDto.fromJson(Map<String, dynamic> json) =
      _$MatchEventDtoImpl.fromJson;

  @override
  @JsonKey(fromJson: _nullableInt)
  int? get id;
  @override
  @JsonKey(fromJson: _nullableInt)
  int? get minute;
  @override
  @JsonKey(name: 'team_id', fromJson: _nullableInt)
  int? get teamId;
  @override
  @JsonKey(name: 'team_name')
  String? get teamName;
  @override
  @JsonKey(name: 'player_name')
  String? get playerName;
  @override
  @JsonKey(name: 'assist_name')
  String? get assistName;
  @override
  String? get type;
  @override
  String? get detail;
  @override
  @JsonKey(ignore: true)
  _$$MatchEventDtoImplCopyWith<_$MatchEventDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
