import 'package:hive/hive.dart';

part 'cached_fixture.g.dart';

@HiveType(typeId: 2)
class CachedFixture extends HiveObject {
  CachedFixture({
    required this.id,
    required this.homeTeamId,
    required this.homeTeamName,
    required this.awayTeamId,
    required this.awayTeamName,
    this.homeTeamFlag,
    this.awayTeamFlag,
    required this.matchDateUtc,
    required this.venue,
    required this.stage,
    this.group,
    required this.status,
    this.homeScore,
    this.awayScore,
    required this.createdAt,
    required this.updatedAt,
    required this.cachedAt,
    required this.expiresAt,
  });

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String homeTeamId;
  @HiveField(2)
  final String homeTeamName;
  @HiveField(3)
  final String awayTeamId;
  @HiveField(4)
  final String awayTeamName;
  @HiveField(5)
  final String? homeTeamFlag;
  @HiveField(6)
  final String? awayTeamFlag;
  @HiveField(7)
  final DateTime matchDateUtc;
  @HiveField(8)
  final String venue;
  @HiveField(9)
  final String stage;
  @HiveField(10)
  final String? group;
  @HiveField(11)
  final String status;
  @HiveField(12)
  final int? homeScore;
  @HiveField(13)
  final int? awayScore;
  @HiveField(14)
  final DateTime cachedAt;
  @HiveField(15)
  final DateTime expiresAt;
  @HiveField(16)
  final DateTime createdAt;
  @HiveField(17)
  final DateTime updatedAt;

  bool get isExpired => DateTime.now().isAfter(expiresAt);

  Map<String, dynamic> toJson() => {
    'id': id,
    'homeTeamId': homeTeamId,
    'homeTeamName': homeTeamName,
    'awayTeamId': awayTeamId,
    'awayTeamName': awayTeamName,
    'homeTeamFlag': homeTeamFlag,
    'awayTeamFlag': awayTeamFlag,
    'matchDateUtc': matchDateUtc.toIso8601String(),
    'venue': venue,
    'stage': stage,
    'group': group,
    'status': status,
    'homeScore': homeScore,
    'awayScore': awayScore,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
    'cachedAt': cachedAt.toIso8601String(),
    'expiresAt': expiresAt.toIso8601String(),
  };

  Map<String, dynamic> toDto() => toJson();

  factory CachedFixture.fromJson(Map<String, dynamic> json) => CachedFixture(
    id: json['id'] as String,
    homeTeamId: json['homeTeamId'] as String,
    homeTeamName: json['homeTeamName'] as String,
    awayTeamId: json['awayTeamId'] as String,
    awayTeamName: json['awayTeamName'] as String,
    homeTeamFlag: json['homeTeamFlag'] as String?,
    awayTeamFlag: json['awayTeamFlag'] as String?,
    matchDateUtc: DateTime.parse(json['matchDateUtc'] as String),
    venue: json['venue'] as String,
    stage: json['stage'] as String,
    group: json['group'] as String?,
    status: json['status'] as String,
    homeScore: json['homeScore'] as int?,
    awayScore: json['awayScore'] as int?,
    createdAt: DateTime.parse(json['createdAt'] as String),
    updatedAt: DateTime.parse(json['updatedAt'] as String),
    cachedAt: DateTime.parse(json['cachedAt'] as String),
    expiresAt: DateTime.parse(json['expiresAt'] as String),
  );

  factory CachedFixture.fromDto(Map<String, dynamic> dto) =>
      CachedFixture.fromJson(dto);
}
