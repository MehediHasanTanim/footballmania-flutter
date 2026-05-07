// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_favorite.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CachedFavoriteAdapter extends TypeAdapter<CachedFavorite> {
  @override
  final int typeId = 5;

  @override
  CachedFavorite read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CachedFavorite(
      id: fields[0] as String,
      type: fields[1] as String,
      referenceId: fields[2] as String,
      title: fields[3] as String,
      subtitle: fields[4] as String?,
      imageUrl: fields[5] as String?,
      createdAt: fields[6] as DateTime,
      updatedAt: fields[7] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CachedFavorite obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.referenceId)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.subtitle)
      ..writeByte(5)
      ..write(obj.imageUrl)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CachedFavoriteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
