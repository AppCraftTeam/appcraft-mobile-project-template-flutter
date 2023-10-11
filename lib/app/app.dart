import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/storage/hive_boxes.dart';
import '../firebase_options.dart';
import '../resources/localization/app_localizations.dart';
import 'app_bloc_observer.dart';
import 'injection/injection.dart';
import 'router/app_router.dart';
import 'theme/app_theme.dart';

// late final AppRouter appRouter;

// class FlutterApp extends StatefulWidget {
//   const FlutterApp({super.key});

//   @override
//   State<StatefulWidget> createState() => _MyAppState();
// }

// class _MyAppState extends State<FlutterApp> {
  
//   @override
//   void initState() {
//     appRouter = AppRouter();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routeInformationParser: appRouter.defaultRouteParser(),
//       routerDelegate: appRouter.delegate(),
//       debugShowCheckedModeBanner: false,
//       localizationsDelegates: AppLocalizations.localizationsDelegates,
//       supportedLocales: AppLocalizations.supportedLocales,
//       theme: AppThemeData.lightThemeData(),
//     );
//   }
// }

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
    await HiveBoxes.init();
    await SystemChrome.setPreferredOrientations([ DeviceOrientation.portraitUp ]);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark
      ),
    );

    await configureInjection(env);
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = AppBlocObserver();

    runApp(const App());
  }

}

// TODO: - Test Firebase Analytics (no data on Firebase console)
// TODO: - Install second splash screen with custom animation