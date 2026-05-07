import '../errors/app_exception.dart';

class ApiResponse<T> {
  const ApiResponse({
    required this.success,
    required this.data,
    this.message,
    this.code,
  });

  final bool success;
  final T data;
  final String? message;
  final String? code;

  static ApiResponse<T> parse<T>(
    Object? json,
    T Function(Object? data) parser,
  ) {
    if (json is Map<String, dynamic>) {
      final success = _readSuccess(json);
      final message = _readMessage(json);
      final code = json['code']?.toString() ?? json['status_code']?.toString();

      if (!success) {
        throw ServerException(
          message: message ?? 'Request failed',
          code: code,
          details: json,
        );
      }

      return ApiResponse<T>(
        success: true,
        data: parser(_readData(json)),
        message: message,
        code: code,
      );
    }

    return ApiResponse<T>(success: true, data: parser(json));
  }

  static T parseObject<T>(
    Object? json,
    T Function(Map<String, dynamic> data) fromJson,
  ) {
    return parse<T>(json, (data) {
      if (data is Map<String, dynamic>) return fromJson(data);
      throw const ServerException(message: 'Expected object response');
    }).data;
  }

  static List<T> parseList<T>(
    Object? json,
    T Function(Map<String, dynamic> data) fromJson,
  ) {
    return parse<List<T>>(json, (data) {
      final items = data is Map<String, dynamic>
          ? _readListFromMap(data)
          : data;
      if (items is List) {
        return items
            .whereType<Map>()
            .map((item) => fromJson(Map<String, dynamic>.from(item)))
            .toList(growable: false);
      }
      throw const ServerException(message: 'Expected list response');
    }).data;
  }

  static bool _readSuccess(Map<String, dynamic> json) {
    final value = json['success'] ?? json['ok'];
    if (value is bool) return value;
    final status = json['status']?.toString().toLowerCase();
    return status == null || status == 'success' || status == 'ok';
  }

  static String? _readMessage(Map<String, dynamic> json) {
    return (json['message'] ?? json['error'] ?? json['detail'])?.toString();
  }

  static Object? _readData(Map<String, dynamic> json) {
    if (json.containsKey('data')) return json['data'];
    if (json.containsKey('result')) return json['result'];
    if (json.containsKey('items')) return json['items'];
    return json;
  }

  static Object? _readListFromMap(Map<String, dynamic> data) {
    return data['items'] ??
        data['results'] ??
        data['data'] ??
        data['fixtures'] ??
        data['news'] ??
        data['teams'];
  }
}
