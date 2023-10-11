import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/env/development.dart';
import 'app/env/env.dart';
import 'app/generated/l10n.dart';
import 'app/injection/injection.dart';
import 'app/router/app_router.dart';
import 'presentation/screens/main/bloc/main_bloc.dart';
import 'presentation/screens/start/bloc/start_bloc.dart';
import 'presentation/theme/app_theme.dart';
import 'presentation/utils/constants.dart';

Future<void> main() async => Development().init();

final appRouter = AppRouter();

class FlutterApp extends StatelessWidget {
  const FlutterApp(this.env, {Key? key}) : super(key: key);
  final Env env;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StartBloc>(create: (_) => getIt()),
        BlocProvider<MainBloc>(create: (_) => getIt()),
      ],
      child: MaterialApp.router(
        title: kAppName,
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: appTheme,
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
      ),
    );
  }
}
// TODO Test Firebase Analytics (no data on Firebase console)
// TODO Install second splash screen with custom animation
