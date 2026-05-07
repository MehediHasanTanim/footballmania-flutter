// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_team.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CachedTeamAdapter extends TypeAdapter<CachedTeam> {
  @override
  final int typeId = 3;

  @override
  CachedTeam read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CachedTeam(
      id: fields[0] as String,
      name: fields[1] as String,
      countryCode: fields[2] as String,
      flagUrl: fields[3] as String?,
      group: fields[4] as String?,
      coach: fields[5] as String?,
      fifaRanking: fields[6] as int?,
      createdAt: fields[9] as DateTime,
      updatedAt: fields[10] as DateTime,
      cachedAt: fields[7] as DateTime,
      expiresAt: fields[8] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CachedTeam obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.countryCode)
      ..writeByte(3)
      ..write(obj.flagUrl)
      ..writeByte(4)
      ..write(obj.group)
      ..writeByte(5)
      ..write(obj.coach)
      ..writeByte(6)
      ..write(obj.fifaRanking)
      ..writeByte(7)
      ..write(obj.cachedAt)
      ..writeByte(8)
      ..write(obj.expiresAt)
      ..writeByte(9)
      ..write(obj.createdAt)
      ..writeByte(10)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CachedTeamAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
