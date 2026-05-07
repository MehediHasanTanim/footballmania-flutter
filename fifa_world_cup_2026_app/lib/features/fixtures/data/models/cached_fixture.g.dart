// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_fixture.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CachedFixtureAdapter extends TypeAdapter<CachedFixture> {
  @override
  final int typeId = 2;

  @override
  CachedFixture read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CachedFixture(
      id: fields[0] as String,
      homeTeamId: fields[1] as String,
      homeTeamName: fields[2] as String,
      awayTeamId: fields[3] as String,
      awayTeamName: fields[4] as String,
      homeTeamFlag: fields[5] as String?,
      awayTeamFlag: fields[6] as String?,
      matchDateUtc: fields[7] as DateTime,
      venue: fields[8] as String,
      stage: fields[9] as String,
      group: fields[10] as String?,
      status: fields[11] as String,
      homeScore: fields[12] as int?,
      awayScore: fields[13] as int?,
      createdAt: fields[16] as DateTime,
      updatedAt: fields[17] as DateTime,
      cachedAt: fields[14] as DateTime,
      expiresAt: fields[15] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CachedFixture obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.homeTeamId)
      ..writeByte(2)
      ..write(obj.homeTeamName)
      ..writeByte(3)
      ..write(obj.awayTeamId)
      ..writeByte(4)
      ..write(obj.awayTeamName)
      ..writeByte(5)
      ..write(obj.homeTeamFlag)
      ..writeByte(6)
      ..write(obj.awayTeamFlag)
      ..writeByte(7)
      ..write(obj.matchDateUtc)
      ..writeByte(8)
      ..write(obj.venue)
      ..writeByte(9)
      ..write(obj.stage)
      ..writeByte(10)
      ..write(obj.group)
      ..writeByte(11)
      ..write(obj.status)
      ..writeByte(12)
      ..write(obj.homeScore)
      ..writeByte(13)
      ..write(obj.awayScore)
      ..writeByte(14)
      ..write(obj.cachedAt)
      ..writeByte(15)
      ..write(obj.expiresAt)
      ..writeByte(16)
      ..write(obj.createdAt)
      ..writeByte(17)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CachedFixtureAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
