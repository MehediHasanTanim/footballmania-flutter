import 'package:hive/hive.dart';

part 'cached_favorite.g.dart';

@HiveType(typeId: 5)
class CachedFavorite extends HiveObject {
  CachedFavorite({
    required this.id,
    required this.type,
    required this.referenceId,
    required this.title,
    this.subtitle,
    this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String type;
  @HiveField(2)
  final String referenceId;
  @HiveField(3)
  final String title;
  @HiveField(4)
  final String? subtitle;
  @HiveField(5)
  final String? imageUrl;
  @HiveField(6)
  final DateTime createdAt;
  @HiveField(7)
  final DateTime updatedAt;

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'referenceId': referenceId,
    'title': title,
    'subtitle': subtitle,
    'imageUrl': imageUrl,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };

  Map<String, dynamic> toDto() => toJson();

  factory CachedFavorite.fromJson(Map<String, dynamic> json) => CachedFavorite(
    id: json['id'] as String,
    type: json['type'] as String,
    referenceId: json['referenceId'] as String,
    title: json['title'] as String,
    subtitle: json['subtitle'] as String?,
    imageUrl: json['imageUrl'] as String?,
    createdAt: DateTime.parse(json['createdAt'] as String),
    updatedAt: DateTime.parse(json['updatedAt'] as String),
  );

  factory CachedFavorite.fromDto(Map<String, dynamic> dto) =>
      CachedFavorite.fromJson(dto);
}
