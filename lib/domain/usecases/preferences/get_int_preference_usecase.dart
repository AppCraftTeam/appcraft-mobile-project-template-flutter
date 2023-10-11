import 'package:injectable/injectable.dart';

import '../../repositories/preferences_repository.dart';
import '../usecase.dart';

@lazySingleton
class GetIntPreferenceUseCase extends UseCase<int?, String> {
  GetIntPreferenceUseCase(this._globalRepository);
  final HiveRepository _globalRepository;

  @override
  Future<int?> execute(String params) =>
      _globalRepository.getIntPreference(key: params);
}
