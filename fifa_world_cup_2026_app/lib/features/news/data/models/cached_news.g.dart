// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_news.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CachedNewsAdapter extends TypeAdapter<CachedNews> {
  @override
  final int typeId = 4;

  @override
  CachedNews read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CachedNews(
      id: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String,
      content: fields[3] as String,
      imageUrl: fields[4] as String?,
      sourceName: fields[5] as String,
      sourceUrl: fields[6] as String?,
      publishedAt: fields[7] as DateTime,
      createdAt: fields[10] as DateTime,
      updatedAt: fields[11] as DateTime,
      cachedAt: fields[8] as DateTime,
      expiresAt: fields[9] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CachedNews obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.content)
      ..writeByte(4)
      ..write(obj.imageUrl)
      ..writeByte(5)
      ..write(obj.sourceName)
      ..writeByte(6)
      ..write(obj.sourceUrl)
      ..writeByte(7)
      ..write(obj.publishedAt)
      ..writeByte(8)
      ..write(obj.cachedAt)
      ..writeByte(9)
      ..write(obj.expiresAt)
      ..writeByte(10)
      ..write(obj.createdAt)
      ..writeByte(11)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CachedNewsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
