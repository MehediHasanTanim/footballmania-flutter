// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

NewsDto _$NewsDtoFromJson(Map<String, dynamic> json) {
  return _NewsDto.fromJson(json);
}

/// @nodoc
mixin _$NewsDto {
  @JsonKey(fromJson: _nullableInt)
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'source_name')
  String? get sourceName => throw _privateConstructorUsedError;
  @JsonKey(name: 'source_url')
  String? get sourceUrl => throw _privateConstructorUsedError;
  @DateTimeJsonConverter()
  @JsonKey(name: 'published_at')
  DateTime? get publishedAt => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsDtoCopyWith<NewsDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsDtoCopyWith<$Res> {
  factory $NewsDtoCopyWith(NewsDto value, $Res Function(NewsDto) then) =
      _$NewsDtoCopyWithImpl<$Res, NewsDto>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _nullableInt) int? id,
    String? title,
    String? description,
    String? content,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'source_name') String? sourceName,
    @JsonKey(name: 'source_url') String? sourceUrl,
    @DateTimeJsonConverter()
    @JsonKey(name: 'published_at')
    DateTime? publishedAt,
    String? url,
  });
}

/// @nodoc
class _$NewsDtoCopyWithImpl<$Res, $Val extends NewsDto>
    implements $NewsDtoCopyWith<$Res> {
  _$NewsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? content = freezed,
    Object? imageUrl = freezed,
    Object? sourceName = freezed,
    Object? sourceUrl = freezed,
    Object? publishedAt = freezed,
    Object? url = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            content: freezed == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String?,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            sourceName: freezed == sourceName
                ? _value.sourceName
                : sourceName // ignore: cast_nullable_to_non_nullable
                      as String?,
            sourceUrl: freezed == sourceUrl
                ? _value.sourceUrl
                : sourceUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            publishedAt: freezed == publishedAt
                ? _value.publishedAt
                : publishedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            url: freezed == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NewsDtoImplCopyWith<$Res> implements $NewsDtoCopyWith<$Res> {
  factory _$$NewsDtoImplCopyWith(
    _$NewsDtoImpl value,
    $Res Function(_$NewsDtoImpl) then,
  ) = __$$NewsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _nullableInt) int? id,
    String? title,
    String? description,
    String? content,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'source_name') String? sourceName,
    @JsonKey(name: 'source_url') String? sourceUrl,
    @DateTimeJsonConverter()
    @JsonKey(name: 'published_at')
    DateTime? publishedAt,
    String? url,
  });
}

/// @nodoc
class __$$NewsDtoImplCopyWithImpl<$Res>
    extends _$NewsDtoCopyWithImpl<$Res, _$NewsDtoImpl>
    implements _$$NewsDtoImplCopyWith<$Res> {
  __$$NewsDtoImplCopyWithImpl(
    _$NewsDtoImpl _value,
    $Res Function(_$NewsDtoImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? content = freezed,
    Object? imageUrl = freezed,
    Object? sourceName = freezed,
    Object? sourceUrl = freezed,
    Object? publishedAt = freezed,
    Object? url = freezed,
  }) {
    return _then(
      _$NewsDtoImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        content: freezed == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        sourceName: freezed == sourceName
            ? _value.sourceName
            : sourceName // ignore: cast_nullable_to_non_nullable
                  as String?,
        sourceUrl: freezed == sourceUrl
            ? _value.sourceUrl
            : sourceUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        publishedAt: freezed == publishedAt
            ? _value.publishedAt
            : publishedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        url: freezed == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsDtoImpl extends _NewsDto {
  const _$NewsDtoImpl({
    @JsonKey(fromJson: _nullableInt) this.id,
    this.title,
    this.description,
    this.content,
    @JsonKey(name: 'image_url') this.imageUrl,
    @JsonKey(name: 'source_name') this.sourceName,
    @JsonKey(name: 'source_url') this.sourceUrl,
    @DateTimeJsonConverter() @JsonKey(name: 'published_at') this.publishedAt,
    this.url,
  }) : super._();

  factory _$NewsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsDtoImplFromJson(json);

  @override
  @JsonKey(fromJson: _nullableInt)
  final int? id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? content;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'source_name')
  final String? sourceName;
  @override
  @JsonKey(name: 'source_url')
  final String? sourceUrl;
  @override
  @DateTimeJsonConverter()
  @JsonKey(name: 'published_at')
  final DateTime? publishedAt;
  @override
  final String? url;

  @override
  String toString() {
    return 'NewsDto(id: $id, title: $title, description: $description, content: $content, imageUrl: $imageUrl, sourceName: $sourceName, sourceUrl: $sourceUrl, publishedAt: $publishedAt, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.sourceName, sourceName) ||
                other.sourceName == sourceName) &&
            (identical(other.sourceUrl, sourceUrl) ||
                other.sourceUrl == sourceUrl) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    description,
    content,
    imageUrl,
    sourceName,
    sourceUrl,
    publishedAt,
    url,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsDtoImplCopyWith<_$NewsDtoImpl> get copyWith =>
      __$$NewsDtoImplCopyWithImpl<_$NewsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsDtoImplToJson(this);
  }
}

abstract class _NewsDto extends NewsDto {
  const factory _NewsDto({
    @JsonKey(fromJson: _nullableInt) final int? id,
    final String? title,
    final String? description,
    final String? content,
    @JsonKey(name: 'image_url') final String? imageUrl,
    @JsonKey(name: 'source_name') final String? sourceName,
    @JsonKey(name: 'source_url') final String? sourceUrl,
    @DateTimeJsonConverter()
    @JsonKey(name: 'published_at')
    final DateTime? publishedAt,
    final String? url,
  }) = _$NewsDtoImpl;
  const _NewsDto._() : super._();

  factory _NewsDto.fromJson(Map<String, dynamic> json) = _$NewsDtoImpl.fromJson;

  @override
  @JsonKey(fromJson: _nullableInt)
  int? get id;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get content;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'source_name')
  String? get sourceName;
  @override
  @JsonKey(name: 'source_url')
  String? get sourceUrl;
  @override
  @DateTimeJsonConverter()
  @JsonKey(name: 'published_at')
  DateTime? get publishedAt;
  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$NewsDtoImplCopyWith<_$NewsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
