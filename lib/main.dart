import 'app/app.dart';

// Файл нужен для локального запуска приложения. 
// Также для запуска конкретной схемы можно пользоваться: `lib/app/dev.dart`, `lib/app/stage.dart`, `;ib/app/prod.dart`.
// Перечисленные схемы нужно указать для запуска в соотвествующих flow сi/cd.

Future<void> main() async => App.run(AppENV.dev);
