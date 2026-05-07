// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_summary_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HomeSummaryDto _$HomeSummaryDtoFromJson(Map<String, dynamic> json) {
  return _HomeSummaryDto.fromJson(json);
}

/// @nodoc
mixin _$HomeSummaryDto {
  @DateTimeJsonConverter()
  @JsonKey(name: 'countdown_target_date')
  DateTime? get countdownTargetDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_match')
  FixtureDto? get nextMatch => throw _privateConstructorUsedError;
  @JsonKey(name: 'live_matches')
  List<LiveMatchDto> get liveMatches => throw _privateConstructorUsedError;
  @JsonKey(name: 'latest_news')
  List<NewsDto> get latestNews => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_highlights')
  List<GroupStandingDto> get groupHighlights =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeSummaryDtoCopyWith<HomeSummaryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeSummaryDtoCopyWith<$Res> {
  factory $HomeSummaryDtoCopyWith(
          HomeSummaryDto value, $Res Function(HomeSummaryDto) then) =
      _$HomeSummaryDtoCopyWithImpl<$Res, HomeSummaryDto>;
  @useResult
  $Res call(
      {@DateTimeJsonConverter()
      @JsonKey(name: 'countdown_target_date')
      DateTime? countdownTargetDate,
      @JsonKey(name: 'next_match') FixtureDto? nextMatch,
      @JsonKey(name: 'live_matches') List<LiveMatchDto> liveMatches,
      @JsonKey(name: 'latest_news') List<NewsDto> latestNews,
      @JsonKey(name: 'group_highlights')
      List<GroupStandingDto> groupHighlights});

  $FixtureDtoCopyWith<$Res>? get nextMatch;
}

/// @nodoc
class _$HomeSummaryDtoCopyWithImpl<$Res, $Val extends HomeSummaryDto>
    implements $HomeSummaryDtoCopyWith<$Res> {
  _$HomeSummaryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countdownTargetDate = freezed,
    Object? nextMatch = freezed,
    Object? liveMatches = null,
    Object? latestNews = null,
    Object? groupHighlights = null,
  }) {
    return _then(_value.copyWith(
      countdownTargetDate: freezed == countdownTargetDate
          ? _value.countdownTargetDate
          : countdownTargetDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nextMatch: freezed == nextMatch
          ? _value.nextMatch
          : nextMatch // ignore: cast_nullable_to_non_nullable
              as FixtureDto?,
      liveMatches: null == liveMatches
          ? _value.liveMatches
          : liveMatches // ignore: cast_nullable_to_non_nullable
              as List<LiveMatchDto>,
      latestNews: null == latestNews
          ? _value.latestNews
          : latestNews // ignore: cast_nullable_to_non_nullable
              as List<NewsDto>,
      groupHighlights: null == groupHighlights
          ? _value.groupHighlights
          : groupHighlights // ignore: cast_nullable_to_non_nullable
              as List<GroupStandingDto>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FixtureDtoCopyWith<$Res>? get nextMatch {
    if (_value.nextMatch == null) {
      return null;
    }

    return $FixtureDtoCopyWith<$Res>(_value.nextMatch!, (value) {
      return _then(_value.copyWith(nextMatch: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeSummaryDtoImplCopyWith<$Res>
    implements $HomeSummaryDtoCopyWith<$Res> {
  factory _$$HomeSummaryDtoImplCopyWith(_$HomeSummaryDtoImpl value,
          $Res Function(_$HomeSummaryDtoImpl) then) =
      __$$HomeSummaryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@DateTimeJsonConverter()
      @JsonKey(name: 'countdown_target_date')
      DateTime? countdownTargetDate,
      @JsonKey(name: 'next_match') FixtureDto? nextMatch,
      @JsonKey(name: 'live_matches') List<LiveMatchDto> liveMatches,
      @JsonKey(name: 'latest_news') List<NewsDto> latestNews,
      @JsonKey(name: 'group_highlights')
      List<GroupStandingDto> groupHighlights});

  @override
  $FixtureDtoCopyWith<$Res>? get nextMatch;
}

/// @nodoc
class __$$HomeSummaryDtoImplCopyWithImpl<$Res>
    extends _$HomeSummaryDtoCopyWithImpl<$Res, _$HomeSummaryDtoImpl>
    implements _$$HomeSummaryDtoImplCopyWith<$Res> {
  __$$HomeSummaryDtoImplCopyWithImpl(
      _$HomeSummaryDtoImpl _value, $Res Function(_$HomeSummaryDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countdownTargetDate = freezed,
    Object? nextMatch = freezed,
    Object? liveMatches = null,
    Object? latestNews = null,
    Object? groupHighlights = null,
  }) {
    return _then(_$HomeSummaryDtoImpl(
      countdownTargetDate: freezed == countdownTargetDate
          ? _value.countdownTargetDate
          : countdownTargetDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nextMatch: freezed == nextMatch
          ? _value.nextMatch
          : nextMatch // ignore: cast_nullable_to_non_nullable
              as FixtureDto?,
      liveMatches: null == liveMatches
          ? _value._liveMatches
          : liveMatches // ignore: cast_nullable_to_non_nullable
              as List<LiveMatchDto>,
      latestNews: null == latestNews
          ? _value._latestNews
          : latestNews // ignore: cast_nullable_to_non_nullable
              as List<NewsDto>,
      groupHighlights: null == groupHighlights
          ? _value._groupHighlights
          : groupHighlights // ignore: cast_nullable_to_non_nullable
              as List<GroupStandingDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeSummaryDtoImpl extends _HomeSummaryDto {
  const _$HomeSummaryDtoImpl(
      {@DateTimeJsonConverter()
      @JsonKey(name: 'countdown_target_date')
      this.countdownTargetDate,
      @JsonKey(name: 'next_match') this.nextMatch,
      @JsonKey(name: 'live_matches')
      final List<LiveMatchDto> liveMatches = const <LiveMatchDto>[],
      @JsonKey(name: 'latest_news')
      final List<NewsDto> latestNews = const <NewsDto>[],
      @JsonKey(name: 'group_highlights')
      final List<GroupStandingDto> groupHighlights =
          const <GroupStandingDto>[]})
      : _liveMatches = liveMatches,
        _latestNews = latestNews,
        _groupHighlights = groupHighlights,
        super._();

  factory _$HomeSummaryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeSummaryDtoImplFromJson(json);

  @override
  @DateTimeJsonConverter()
  @JsonKey(name: 'countdown_target_date')
  final DateTime? countdownTargetDate;
  @override
  @JsonKey(name: 'next_match')
  final FixtureDto? nextMatch;
  final List<LiveMatchDto> _liveMatches;
  @override
  @JsonKey(name: 'live_matches')
  List<LiveMatchDto> get liveMatches {
    if (_liveMatches is EqualUnmodifiableListView) return _liveMatches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_liveMatches);
  }

  final List<NewsDto> _latestNews;
  @override
  @JsonKey(name: 'latest_news')
  List<NewsDto> get latestNews {
    if (_latestNews is EqualUnmodifiableListView) return _latestNews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_latestNews);
  }

  final List<GroupStandingDto> _groupHighlights;
  @override
  @JsonKey(name: 'group_highlights')
  List<GroupStandingDto> get groupHighlights {
    if (_groupHighlights is EqualUnmodifiableListView) return _groupHighlights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groupHighlights);
  }

  @override
  String toString() {
    return 'HomeSummaryDto(countdownTargetDate: $countdownTargetDate, nextMatch: $nextMatch, liveMatches: $liveMatches, latestNews: $latestNews, groupHighlights: $groupHighlights)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeSummaryDtoImpl &&
            (identical(other.countdownTargetDate, countdownTargetDate) ||
                other.countdownTargetDate == countdownTargetDate) &&
            (identical(other.nextMatch, nextMatch) ||
                other.nextMatch == nextMatch) &&
            const DeepCollectionEquality()
                .equals(other._liveMatches, _liveMatches) &&
            const DeepCollectionEquality()
                .equals(other._latestNews, _latestNews) &&
            const DeepCollectionEquality()
                .equals(other._groupHighlights, _groupHighlights));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      countdownTargetDate,
      nextMatch,
      const DeepCollectionEquality().hash(_liveMatches),
      const DeepCollectionEquality().hash(_latestNews),
      const DeepCollectionEquality().hash(_groupHighlights));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeSummaryDtoImplCopyWith<_$HomeSummaryDtoImpl> get copyWith =>
      __$$HomeSummaryDtoImplCopyWithImpl<_$HomeSummaryDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeSummaryDtoImplToJson(
      this,
    );
  }
}

abstract class _HomeSummaryDto extends HomeSummaryDto {
  const factory _HomeSummaryDto(
      {@DateTimeJsonConverter()
      @JsonKey(name: 'countdown_target_date')
      final DateTime? countdownTargetDate,
      @JsonKey(name: 'next_match') final FixtureDto? nextMatch,
      @JsonKey(name: 'live_matches') final List<LiveMatchDto> liveMatches,
      @JsonKey(name: 'latest_news') final List<NewsDto> latestNews,
      @JsonKey(name: 'group_highlights')
      final List<GroupStandingDto> groupHighlights}) = _$HomeSummaryDtoImpl;
  const _HomeSummaryDto._() : super._();

  factory _HomeSummaryDto.fromJson(Map<String, dynamic> json) =
      _$HomeSummaryDtoImpl.fromJson;

  @override
  @DateTimeJsonConverter()
  @JsonKey(name: 'countdown_target_date')
  DateTime? get countdownTargetDate;
  @override
  @JsonKey(name: 'next_match')
  FixtureDto? get nextMatch;
  @override
  @JsonKey(name: 'live_matches')
  List<LiveMatchDto> get liveMatches;
  @override
  @JsonKey(name: 'latest_news')
  List<NewsDto> get latestNews;
  @override
  @JsonKey(name: 'group_highlights')
  List<GroupStandingDto> get groupHighlights;
  @override
  @JsonKey(ignore: true)
  _$$HomeSummaryDtoImplCopyWith<_$HomeSummaryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
