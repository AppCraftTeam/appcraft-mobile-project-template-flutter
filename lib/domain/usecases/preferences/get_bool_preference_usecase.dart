import 'package:injectable/injectable.dart';

import '../../repositories/preferences_repository.dart';
import '../usecase.dart';

@lazySingleton
class GetBoolPreferenceUseCase extends UseCase<bool?, String> {
  GetBoolPreferenceUseCase(this._preferencesRepository);
  final HiveRepository _preferencesRepository;

  @override
  Future<bool?> execute(String params) =>
      _preferencesRepository.getBoolPreference(key: params);
}
