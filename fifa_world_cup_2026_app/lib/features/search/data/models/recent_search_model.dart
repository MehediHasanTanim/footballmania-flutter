import 'package:hive/hive.dart';

import '../../domain/entities/recent_search.dart';

class RecentSearchModel {
  const RecentSearchModel({
    required this.query,
    required this.type,
    required this.timestamp,
  });

  final String query;
  final String type;
  final DateTime timestamp;

  RecentSearch toEntity() {
    return RecentSearch(
      query: query,
      type: SearchType.fromName(type),
      timestamp: timestamp,
    );
  }

  static RecentSearchModel fromEntity(RecentSearch search) {
    return RecentSearchModel(
      query: search.query,
      type: search.type.name,
      timestamp: search.timestamp,
    );
  }
}

class RecentSearchModelAdapter extends TypeAdapter<RecentSearchModel> {
  @override
  final int typeId = 7;

  @override
  RecentSearchModel read(BinaryReader reader) {
    final count = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < count; i++) reader.readByte(): reader.read(),
    };
    return RecentSearchModel(
      query: fields[0] as String,
      type: fields[1] as String,
      timestamp: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, RecentSearchModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.query)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.timestamp);
  }
}
