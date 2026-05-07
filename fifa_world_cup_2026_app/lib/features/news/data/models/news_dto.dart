import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/date_time_json_converter.dart';
import '../../domain/entities/news.dart';
import 'cached_news.dart';

part 'news_dto.freezed.dart';
part 'news_dto.g.dart';

@freezed
class NewsDto with _$NewsDto {
  const factory NewsDto({
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
  }) = _NewsDto;

  const NewsDto._();

  factory NewsDto.fromJson(Map<String, dynamic> json) =>
      _$NewsDtoFromJson(_normalize(json));

  News toEntity() {
    return News(
      id: id ?? 0,
      title: title ?? '',
      description: description ?? '',
      content: content ?? '',
      imageUrl: imageUrl,
      sourceName: sourceName ?? '',
      sourceUrl: sourceUrl,
      publishedAt: publishedAt,
      url: url,
    );
  }

  factory NewsDto.fromEntity(News news) {
    return NewsDto(
      id: news.id,
      title: news.title,
      description: news.description,
      content: news.content,
      imageUrl: news.imageUrl,
      sourceName: news.sourceName,
      sourceUrl: news.sourceUrl,
      publishedAt: news.publishedAt,
      url: news.url,
    );
  }

  CachedNews toCachedModel({Duration ttl = const Duration(hours: 3)}) {
    final now = DateTime.now().toUtc();
    return CachedNews(
      id: (id ?? 0).toString(),
      title: title ?? '',
      description: description ?? '',
      content: content ?? '',
      imageUrl: imageUrl,
      sourceName: sourceName ?? '',
      sourceUrl: sourceUrl ?? url,
      publishedAt: publishedAt ?? now,
      createdAt: now,
      updatedAt: now,
      cachedAt: now,
      expiresAt: now.add(ttl),
    );
  }

  factory NewsDto.fromCachedModel(CachedNews news) {
    return NewsDto(
      id: int.tryParse(news.id),
      title: news.title,
      description: news.description,
      content: news.content,
      imageUrl: news.imageUrl,
      sourceName: news.sourceName,
      sourceUrl: news.sourceUrl,
      publishedAt: news.publishedAt,
      url: news.sourceUrl,
    );
  }
}

Map<String, dynamic> _normalize(Map<String, dynamic> json) => {
  ...json,
  'image_url': json['image_url'] ?? json['imageUrl'],
  'source_name': json['source_name'] ?? json['sourceName'],
  'source_url': json['source_url'] ?? json['sourceUrl'],
  'published_at': json['published_at'] ?? json['publishedAt'],
};

int? _nullableInt(Object? value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}
