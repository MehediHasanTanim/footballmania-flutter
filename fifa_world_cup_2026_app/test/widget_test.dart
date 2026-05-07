import 'package:fifa_world_cup_2026_app/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders the project foundation home screen', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: WorldCupApp()));
    await tester.pumpAndSettle();

    expect(find.text('FIFA World Cup 2026'), findsOneWidget);
    expect(find.text('Project foundation is ready.'), findsOneWidget);
  });
}
