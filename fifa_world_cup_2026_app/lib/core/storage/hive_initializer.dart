import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';

import '../constants/hive_constants.dart';
import 'hive_adapters.dart';

class HiveInitializer {
  const HiveInitializer._();

  static Future<bool> initialize({Logger? logger}) async {
    try {
      await Hive.initFlutter();
      HiveAdapters.registerAdapters();
      await _openBoxes();
      return true;
    } catch (error, stackTrace) {
      logger?.e(
        'Hive cache initialization failed. Continuing without local cache.',
        error: error,
        stackTrace: stackTrace,
      );
      return false;
    }
  }

  static Future<void> _openBoxes() async {
    for (final boxName in HiveConstants.allBoxes) {
      if (!Hive.isBoxOpen(boxName)) {
        await Hive.openBox<dynamic>(boxName);
      }
    }
  }
}
