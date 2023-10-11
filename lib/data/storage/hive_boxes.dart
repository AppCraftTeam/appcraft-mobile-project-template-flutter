import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HiveBoxes {
  HiveBoxes();

  static Future<void> init({String? subDir}) async {
    await Hive.initFlutter(subDir);
    for (final box in _boxes) {
      await Hive.openBox<dynamic>(box);
    }
  }

  Box<dynamic> get preferencesBox => Hive.box(_preferencesKey);
}

const _boxes = [_preferencesKey];
const _preferencesKey = 'preferences';
