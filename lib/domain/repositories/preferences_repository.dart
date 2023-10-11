

abstract class HiveRepository {
  Future<bool?> getBoolPreference({required String key});

  Future<int?> getIntPreference({required String key});

  Future<double?> getDoublePreference({required String key});

  Future<String?> getStringPreference({required String key});

  Future<void> setPreference({required String key, required dynamic val});
}
