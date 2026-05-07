import 'package:hive/hive.dart';

part 'cached_team.g.dart';

@HiveType(typeId: 3)
class CachedTeam extends HiveObject {
  CachedTeam({
    required this.id,
    required this.name,
    required this.countryCode,
    this.flagUrl,
    this.group,
    this.coach,
    this.fifaRanking,
    required this.createdAt,
    required this.updatedAt,
    required this.cachedAt,
    required this.expiresAt,
  });

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String countryCode;
  @HiveField(3)
  final String? flagUrl;
  @HiveField(4)
  final String? group;
  @HiveField(5)
  final String? coach;
  @HiveField(6)
  final int? fifaRanking;
  @HiveField(7)
  final DateTime cachedAt;
  @HiveField(8)
  final DateTime expiresAt;
  @HiveField(9)
  final DateTime createdAt;
  @HiveField(10)
  final DateTime updatedAt;

  bool get isExpired => DateTime.now().isAfter(expiresAt);

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'countryCode': countryCode,
    'flagUrl': flagUrl,
    'group': group,
    'coach': coach,
    'fifaRanking': fifaRanking,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
    'cachedAt': cachedAt.toIso8601String(),
    'expiresAt': expiresAt.toIso8601String(),
  };

  Map<String, dynamic> toDto() => toJson();

  factory CachedTeam.fromJson(Map<String, dynamic> json) => CachedTeam(
    id: json['id'] as String,
    name: json['name'] as String,
    countryCode: json['countryCode'] as String,
    flagUrl: json['flagUrl'] as String?,
    group: json['group'] as String?,
    coach: json['coach'] as String?,
    fifaRanking: json['fifaRanking'] as int?,
    createdAt: DateTime.parse(json['createdAt'] as String),
    updatedAt: DateTime.parse(json['updatedAt'] as String),
    cachedAt: DateTime.parse(json['cachedAt'] as String),
    expiresAt: DateTime.parse(json['expiresAt'] as String),
  );

  factory CachedTeam.fromDto(Map<String, dynamic> dto) =>
      CachedTeam.fromJson(dto);
}
