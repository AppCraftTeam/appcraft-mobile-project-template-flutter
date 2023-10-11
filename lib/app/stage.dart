import 'package:injectable/injectable.dart';

import 'app.dart';
import 'app_configuration.dart';

// Запуск приложения в STAGE окружении. Используется для тестрования и передачи заказчику.
Future<void> main() async => App.run(AppENV.stage);

@Environment(AppENV.stage)
@LazySingleton(as: AppConfiguration)
class StageAppConfiguration implements AppConfiguration {
  const StageAppConfiguration();

  @override
  String get appVersionTag => 'S';

  @override
  String get baseUrl => '';

  @override
  bool get writeLogs => true;
}
