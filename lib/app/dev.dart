import 'package:injectable/injectable.dart';

import 'app.dart';
import 'app_configuration.dart';

// Запуск приложения в DEV окружении. Используется для разработки.

Future<void> main() async => App.run(AppENV.dev);

// @dev
@Environment(AppENV.dev)
@LazySingleton(as: AppConfiguration)
class DevAppConfiguration implements AppConfiguration {
  const DevAppConfiguration();

  @override
  String get appVersionTag => 'D';

  @override
  String get baseUrl => '';

  @override
  bool get writeLogs => true;
}