import 'package:injectable/injectable.dart';

import '../../repositories/preferences_repository.dart';
import '../usecase.dart';

@lazySingleton
class GetDoublePreferenceUseCase extends UseCase<double?, String> {
  GetDoublePreferenceUseCase(this._preferencesRepository);
  final HiveRepository _preferencesRepository;

  @override
  Future<double?> execute(String params) =>
      _preferencesRepository.getDoublePreference(key: params);
}
