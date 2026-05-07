// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsDtoImpl _$$NewsDtoImplFromJson(Map<String, dynamic> json) =>
    _$NewsDtoImpl(
      id: _nullableInt(json['id']),
      title: json['title'] as String?,
      description: json['description'] as String?,
      content: json['content'] as String?,
      imageUrl: json['image_url'] as String?,
      sourceName: json['source_name'] as String?,
      sourceUrl: json['source_url'] as String?,
      publishedAt: const DateTimeJsonConverter().fromJson(json['published_at']),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$NewsDtoImplToJson(_$NewsDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'image_url': instance.imageUrl,
      'source_name': instance.sourceName,
      'source_url': instance.sourceUrl,
      'published_at':
          const DateTimeJsonConverter().toJson(instance.publishedAt),
      'url': instance.url,
    };
