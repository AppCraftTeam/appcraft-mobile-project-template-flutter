import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/preferences_repository.dart';
import '../storage/hive_boxes.dart';

@LazySingleton(as: HiveRepository)
class HiveRepositoryImpl extends HiveRepository {
  HiveRepositoryImpl(HiveBoxes boxes) : _preferencesBox = boxes.preferencesBox;

  final Box<dynamic> _preferencesBox;

  @override
  Future<bool?> getBoolPreference({required String key}) async {
    return _preferencesBox.get(key) as bool?;
  }

  @override
  Future<int?> getIntPreference({required String key}) async {
    return _preferencesBox.get(key) as int?;
  }

  @override
  Future<double?> getDoublePreference({required String key}) async {
    return _preferencesBox.get(key) as double?;
  }

  @override
  Future<String?> getStringPreference({required String key}) async {
    return _preferencesBox.get(key) as String?;
  }

  @override
  Future<bool> setPreference(
      {required String key, required dynamic val}) async {
    await _preferencesBox.put(key, val);
    return true;
  }
}
