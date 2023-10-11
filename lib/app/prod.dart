import 'package:injectable/injectable.dart';

import 'app.dart';
import 'app_configuration.dart';

// Запуск приложения в PROD окружении. Используется для релиза приложения в сторах.

Future<void> main() async => App.run(AppENV.prod);

@Environment(AppENV.prod)
@LazySingleton(as: AppConfiguration)
class ProdAppConfiguration implements AppConfiguration {
  const ProdAppConfiguration();

  @override
  String get appVersionTag => '';

  @override
  String get baseUrl => '';

  @override
  bool get writeLogs => false;
}