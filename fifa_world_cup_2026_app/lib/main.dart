import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const ProviderScope(child: WorldCupApp()));
}
