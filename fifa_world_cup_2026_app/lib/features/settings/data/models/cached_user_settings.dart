import 'package:hive/hive.dart';

part 'cached_user_settings.g.dart';

@HiveType(typeId: 6)
class CachedUserSettings extends HiveObject {
  CachedUserSettings({
    required this.themeMode,
    required this.languageCode,
    required this.timezone,
    required this.enableMatchReminders,
    required this.enableGoalAlerts,
    required this.enableNewsAlerts,
    required this.reminderMinutesBefore,
    required this.createdAt,
    required this.updatedAt,
  });

  @HiveField(0)
  final String themeMode;
  @HiveField(1)
  final String languageCode;
  @HiveField(2)
  final String timezone;
  @HiveField(3)
  final bool enableMatchReminders;
  @HiveField(4)
  final bool enableGoalAlerts;
  @HiveField(5)
  final bool enableNewsAlerts;
  @HiveField(6)
  final int reminderMinutesBefore;
  @HiveField(7)
  final DateTime createdAt;
  @HiveField(8)
  final DateTime updatedAt;

  factory CachedUserSettings.defaults() {
    final now = DateTime.now();
    return CachedUserSettings(
      themeMode: 'system',
      languageCode: 'en',
      timezone: 'local',
      enableMatchReminders: true,
      enableGoalAlerts: true,
      enableNewsAlerts: true,
      reminderMinutesBefore: 30,
      createdAt: now,
      updatedAt: now,
    );
  }

  Map<String, dynamic> toJson() => {
    'themeMode': themeMode,
    'languageCode': languageCode,
    'timezone': timezone,
    'enableMatchReminders': enableMatchReminders,
    'enableGoalAlerts': enableGoalAlerts,
    'enableNewsAlerts': enableNewsAlerts,
    'reminderMinutesBefore': reminderMinutesBefore,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };

  Map<String, dynamic> toDto() => toJson();

  factory CachedUserSettings.fromJson(Map<String, dynamic> json) {
    return CachedUserSettings(
      themeMode: json['themeMode'] as String,
      languageCode: json['languageCode'] as String,
      timezone: json['timezone'] as String,
      enableMatchReminders: json['enableMatchReminders'] as bool,
      enableGoalAlerts: json['enableGoalAlerts'] as bool,
      enableNewsAlerts: json['enableNewsAlerts'] as bool,
      reminderMinutesBefore: json['reminderMinutesBefore'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  factory CachedUserSettings.fromDto(Map<String, dynamic> dto) =>
      CachedUserSettings.fromJson(dto);
}
