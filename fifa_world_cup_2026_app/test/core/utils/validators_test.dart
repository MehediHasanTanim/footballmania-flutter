import 'package:fifa_world_cup_2026_app/core/utils/validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('validates required values', () {
    expect(Validators.required('', fieldName: 'Name'), 'Name is required');
    expect(Validators.required('Argentina'), isNull);
  });

  test('validates email values', () {
    expect(Validators.email('bad-email'), 'Enter a valid email address');
    expect(Validators.email('fan@example.com'), isNull);
  });
}
