import 'package:hive/hive.dart';

part 'cached_news.g.dart';

@HiveType(typeId: 4)
class CachedNews extends HiveObject {
  CachedNews({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    this.imageUrl,
    required this.sourceName,
    this.sourceUrl,
    required this.publishedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.cachedAt,
    required this.expiresAt,
  });

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String content;
  @HiveField(4)
  final String? imageUrl;
  @HiveField(5)
  final String sourceName;
  @HiveField(6)
  final String? sourceUrl;
  @HiveField(7)
  final DateTime publishedAt;
  @HiveField(8)
  final DateTime cachedAt;
  @HiveField(9)
  final DateTime expiresAt;
  @HiveField(10)
  final DateTime createdAt;
  @HiveField(11)
  final DateTime updatedAt;

  bool get isExpired => DateTime.now().isAfter(expiresAt);

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'content': content,
    'imageUrl': imageUrl,
    'sourceName': sourceName,
    'sourceUrl': sourceUrl,
    'publishedAt': publishedAt.toIso8601String(),
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
    'cachedAt': cachedAt.toIso8601String(),
    'expiresAt': expiresAt.toIso8601String(),
  };

  Map<String, dynamic> toDto() => toJson();

  factory CachedNews.fromJson(Map<String, dynamic> json) => CachedNews(
    id: json['id'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    content: json['content'] as String,
    imageUrl: json['imageUrl'] as String?,
    sourceName: json['sourceName'] as String,
    sourceUrl: json['sourceUrl'] as String?,
    publishedAt: DateTime.parse(json['publishedAt'] as String),
    createdAt: DateTime.parse(json['createdAt'] as String),
    updatedAt: DateTime.parse(json['updatedAt'] as String),
    cachedAt: DateTime.parse(json['cachedAt'] as String),
    expiresAt: DateTime.parse(json['expiresAt'] as String),
  );

  factory CachedNews.fromDto(Map<String, dynamic> dto) =>
      CachedNews.fromJson(dto);
}
