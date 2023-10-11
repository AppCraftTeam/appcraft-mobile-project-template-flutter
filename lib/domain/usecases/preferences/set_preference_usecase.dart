import 'package:injectable/injectable.dart';

import '../../repositories/preferences_repository.dart';
import '../usecase.dart';

@lazySingleton
class SetPreferenceUseCase extends UseCase<void, SetPreferenceParams> {
  SetPreferenceUseCase(this._preferencesRepository);
  final HiveRepository _preferencesRepository;

  @override
  Future<void> execute(SetPreferenceParams params) =>
      _preferencesRepository.setPreference(key: params.key, val: params.val);
}

class SetPreferenceParams {
  SetPreferenceParams({required this.key, required this.val});

  final String key;
  final dynamic val;
}
