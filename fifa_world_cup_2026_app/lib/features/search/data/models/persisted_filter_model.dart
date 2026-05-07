import 'package:hive/hive.dart';

class PersistedFilterModel {
  const PersistedFilterModel({required this.key, required this.values});

  final String key;
  final Map<String, dynamic> values;
}

class PersistedFilterModelAdapter extends TypeAdapter<PersistedFilterModel> {
  @override
  final int typeId = 8;

  @override
  PersistedFilterModel read(BinaryReader reader) {
    final count = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < count; i++) reader.readByte(): reader.read(),
    };
    return PersistedFilterModel(
      key: fields[0] as String,
      values: Map<String, dynamic>.from(fields[1] as Map),
    );
  }

  @override
  void write(BinaryWriter writer, PersistedFilterModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.values);
  }
}
