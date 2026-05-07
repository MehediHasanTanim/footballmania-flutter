// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_user_settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CachedUserSettingsAdapter extends TypeAdapter<CachedUserSettings> {
  @override
  final int typeId = 6;

  @override
  CachedUserSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CachedUserSettings(
      themeMode: fields[0] as String,
      languageCode: fields[1] as String,
      timezone: fields[2] as String,
      enableMatchReminders: fields[3] as bool,
      enableGoalAlerts: fields[4] as bool,
      enableNewsAlerts: fields[5] as bool,
      reminderMinutesBefore: fields[6] as int,
      createdAt: fields[7] as DateTime,
      updatedAt: fields[8] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CachedUserSettings obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.themeMode)
      ..writeByte(1)
      ..write(obj.languageCode)
      ..writeByte(2)
      ..write(obj.timezone)
      ..writeByte(3)
      ..write(obj.enableMatchReminders)
      ..writeByte(4)
      ..write(obj.enableGoalAlerts)
      ..writeByte(5)
      ..write(obj.enableNewsAlerts)
      ..writeByte(6)
      ..write(obj.reminderMinutesBefore)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CachedUserSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
