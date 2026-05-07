import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/storage/hive_initializer.dart';
import 'core_providers.dart';

export 'core_providers.dart';
export 'data_source_providers.dart';
export 'repository_providers.dart';
export 'usecase_providers.dart';

final hiveServiceProvider = FutureProvider<bool>((ref) {
  return HiveInitializer.initialize(logger: ref.watch(loggerProvider));
});
