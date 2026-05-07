// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TeamDto _$TeamDtoFromJson(Map<String, dynamic> json) {
  return _TeamDto.fromJson(json);
}

/// @nodoc
mixin _$TeamDto {
  @JsonKey(fromJson: _nullableInt)
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_code')
  String? get countryCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'flag_url')
  String? get flagUrl => throw _privateConstructorUsedError;
  String? get group => throw _privateConstructorUsedError;
  String? get coach => throw _privateConstructorUsedError;
  @JsonKey(name: 'fifa_ranking', fromJson: _nullableInt)
  int? get fifaRanking => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamDtoCopyWith<TeamDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamDtoCopyWith<$Res> {
  factory $TeamDtoCopyWith(TeamDto value, $Res Function(TeamDto) then) =
      _$TeamDtoCopyWithImpl<$Res, TeamDto>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _nullableInt) int? id,
    String? name,
    @JsonKey(name: 'country_code') String? countryCode,
    @JsonKey(name: 'flag_url') String? flagUrl,
    String? group,
    String? coach,
    @JsonKey(name: 'fifa_ranking', fromJson: _nullableInt) int? fifaRanking,
  });
}

/// @nodoc
class _$TeamDtoCopyWithImpl<$Res, $Val extends TeamDto>
    implements $TeamDtoCopyWith<$Res> {
  _$TeamDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? countryCode = freezed,
    Object? flagUrl = freezed,
    Object? group = freezed,
    Object? coach = freezed,
    Object? fifaRanking = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            countryCode: freezed == countryCode
                ? _value.countryCode
                : countryCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            flagUrl: freezed == flagUrl
                ? _value.flagUrl
                : flagUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            group: freezed == group
                ? _value.group
                : group // ignore: cast_nullable_to_non_nullable
                      as String?,
            coach: freezed == coach
                ? _value.coach
                : coach // ignore: cast_nullable_to_non_nullable
                      as String?,
            fifaRanking: freezed == fifaRanking
                ? _value.fifaRanking
                : fifaRanking // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TeamDtoImplCopyWith<$Res> implements $TeamDtoCopyWith<$Res> {
  factory _$$TeamDtoImplCopyWith(
    _$TeamDtoImpl value,
    $Res Function(_$TeamDtoImpl) then,
  ) = __$$TeamDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _nullableInt) int? id,
    String? name,
    @JsonKey(name: 'country_code') String? countryCode,
    @JsonKey(name: 'flag_url') String? flagUrl,
    String? group,
    String? coach,
    @JsonKey(name: 'fifa_ranking', fromJson: _nullableInt) int? fifaRanking,
  });
}

/// @nodoc
class __$$TeamDtoImplCopyWithImpl<$Res>
    extends _$TeamDtoCopyWithImpl<$Res, _$TeamDtoImpl>
    implements _$$TeamDtoImplCopyWith<$Res> {
  __$$TeamDtoImplCopyWithImpl(
    _$TeamDtoImpl _value,
    $Res Function(_$TeamDtoImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? countryCode = freezed,
    Object? flagUrl = freezed,
    Object? group = freezed,
    Object? coach = freezed,
    Object? fifaRanking = freezed,
  }) {
    return _then(
      _$TeamDtoImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        countryCode: freezed == countryCode
            ? _value.countryCode
            : countryCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        flagUrl: freezed == flagUrl
            ? _value.flagUrl
            : flagUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        group: freezed == group
            ? _value.group
            : group // ignore: cast_nullable_to_non_nullable
                  as String?,
        coach: freezed == coach
            ? _value.coach
            : coach // ignore: cast_nullable_to_non_nullable
                  as String?,
        fifaRanking: freezed == fifaRanking
            ? _value.fifaRanking
            : fifaRanking // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TeamDtoImpl extends _TeamDto {
  const _$TeamDtoImpl({
    @JsonKey(fromJson: _nullableInt) this.id,
    this.name,
    @JsonKey(name: 'country_code') this.countryCode,
    @JsonKey(name: 'flag_url') this.flagUrl,
    this.group,
    this.coach,
    @JsonKey(name: 'fifa_ranking', fromJson: _nullableInt) this.fifaRanking,
  }) : super._();

  factory _$TeamDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeamDtoImplFromJson(json);

  @override
  @JsonKey(fromJson: _nullableInt)
  final int? id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'country_code')
  final String? countryCode;
  @override
  @JsonKey(name: 'flag_url')
  final String? flagUrl;
  @override
  final String? group;
  @override
  final String? coach;
  @override
  @JsonKey(name: 'fifa_ranking', fromJson: _nullableInt)
  final int? fifaRanking;

  @override
  String toString() {
    return 'TeamDto(id: $id, name: $name, countryCode: $countryCode, flagUrl: $flagUrl, group: $group, coach: $coach, fifaRanking: $fifaRanking)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeamDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.flagUrl, flagUrl) || other.flagUrl == flagUrl) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.coach, coach) || other.coach == coach) &&
            (identical(other.fifaRanking, fifaRanking) ||
                other.fifaRanking == fifaRanking));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    countryCode,
    flagUrl,
    group,
    coach,
    fifaRanking,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TeamDtoImplCopyWith<_$TeamDtoImpl> get copyWith =>
      __$$TeamDtoImplCopyWithImpl<_$TeamDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeamDtoImplToJson(this);
  }
}

abstract class _TeamDto extends TeamDto {
  const factory _TeamDto({
    @JsonKey(fromJson: _nullableInt) final int? id,
    final String? name,
    @JsonKey(name: 'country_code') final String? countryCode,
    @JsonKey(name: 'flag_url') final String? flagUrl,
    final String? group,
    final String? coach,
    @JsonKey(name: 'fifa_ranking', fromJson: _nullableInt)
    final int? fifaRanking,
  }) = _$TeamDtoImpl;
  const _TeamDto._() : super._();

  factory _TeamDto.fromJson(Map<String, dynamic> json) = _$TeamDtoImpl.fromJson;

  @override
  @JsonKey(fromJson: _nullableInt)
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'country_code')
  String? get countryCode;
  @override
  @JsonKey(name: 'flag_url')
  String? get flagUrl;
  @override
  String? get group;
  @override
  String? get coach;
  @override
  @JsonKey(name: 'fifa_ranking', fromJson: _nullableInt)
  int? get fifaRanking;
  @override
  @JsonKey(ignore: true)
  _$$TeamDtoImplCopyWith<_$TeamDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
