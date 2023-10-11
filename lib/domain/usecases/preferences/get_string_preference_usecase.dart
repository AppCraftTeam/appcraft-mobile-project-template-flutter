import 'package:injectable/injectable.dart';

import '../../repositories/preferences_repository.dart';
import '../usecase.dart';

@lazySingleton
class GetStringPreferenceUseCase extends UseCase<String?, String> {
  GetStringPreferenceUseCase(this._globalRepository);
  final HiveRepository _globalRepository;

  @override
  Future<String?> execute(String params) =>
      _globalRepository.getStringPreference(key: params);
}
