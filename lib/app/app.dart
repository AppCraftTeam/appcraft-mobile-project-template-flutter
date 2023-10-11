import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../resources/localization/app_localizations.dart';
import 'app_bloc_observer.dart';
import 'injection/injection.dart';
import 'router/app_router.dart';
import 'theme/app_theme.dart';

final AppRouter _appRouter = AppRouter();

class AppENV {
  static const dev = 'dev';
  static const stage = 'stage';
  static const prod = 'prod';
}

class App extends StatelessWidget {
  const App({ super.key });

  @override
  Widget build(BuildContext context) => _app();

  Widget _app() {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppThemeData.lightThemeData(),
    );
  }

  static Future<void> run(String env) async {
    await SystemChrome.setPreferredOrientations([ DeviceOrientation.portraitUp ]);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark
      ),
    );

    await configureInjection(env);
    
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = AppBlocObserver();

    runApp(const App());
  }

}