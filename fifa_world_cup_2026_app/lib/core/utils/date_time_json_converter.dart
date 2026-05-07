import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeJsonConverter implements JsonConverter<DateTime?, Object?> {
  const DateTimeJsonConverter();

  @override
  DateTime? fromJson(Object? json) {
    if (json == null) return null;
    if (json is DateTime) return json.toUtc();
    if (json is int) {
      return DateTime.fromMillisecondsSinceEpoch(json, isUtc: true);
    }
    if (json is String && json.trim().isNotEmpty) {
      return DateTime.tryParse(json)?.toUtc();
    }
    return null;
  }

  @override
  Object? toJson(DateTime? object) => object?.toUtc().toIso8601String();
}
