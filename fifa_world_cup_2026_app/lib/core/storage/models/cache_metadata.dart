import 'package:hive/hive.dart';

part 'cache_metadata.g.dart';

@HiveType(typeId: 1)
class CacheMetadata extends HiveObject {
  CacheMetadata({
    required this.key,
    required this.lastSyncedAt,
    required this.expiresAt,
    required this.version,
  });

  @override
  @HiveField(0)
  final String key;

  @HiveField(1)
  final DateTime lastSyncedAt;

  @HiveField(2)
  final DateTime expiresAt;

  @HiveField(3)
  final int version;

  bool get isExpired => DateTime.now().isAfter(expiresAt);

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'lastSyncedAt': lastSyncedAt.toIso8601String(),
      'expiresAt': expiresAt.toIso8601String(),
      'version': version,
    };
  }

  Map<String, dynamic> toDto() => toJson();

  factory CacheMetadata.fromJson(Map<String, dynamic> json) {
    return CacheMetadata(
      key: json['key'] as String,
      lastSyncedAt: DateTime.parse(json['lastSyncedAt'] as String),
      expiresAt: DateTime.parse(json['expiresAt'] as String),
      version: json['version'] as int,
    );
  }

  factory CacheMetadata.fromDto(Map<String, dynamic> dto) =>
      CacheMetadata.fromJson(dto);
}
