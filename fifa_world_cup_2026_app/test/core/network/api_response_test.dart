import 'package:fifa_world_cup_2026_app/core/errors/app_exception.dart';
import 'package:fifa_world_cup_2026_app/core/network/api_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('parses object response wrapped in data', () {
    final result = ApiResponse.parseObject<Map<String, dynamic>>({
      'success': true,
      'data': {'id': 1, 'name': 'USA'},
    }, (json) => json);

    expect(result['id'], 1);
  });

  test('parses list response wrapped in items', () {
    final result = ApiResponse.parseList<int>({
      'status': 'success',
      'items': [
        {'id': 1},
        {'id': 2},
      ],
    }, (json) => json['id'] as int);

    expect(result, [1, 2]);
  });

  test('throws server exception for unsuccessful backend response', () {
    expect(
      () => ApiResponse.parseObject<Map<String, dynamic>>({
        'success': false,
        'message': 'Backend failed',
      }, (json) => json),
      throwsA(isA<ServerException>()),
    );
  });
}
