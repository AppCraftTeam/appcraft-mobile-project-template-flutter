import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_configuration.dart';
import 'injection/injection.dart';

/// Обсервер для блока, печатаем все изменения
class AppBlocObserver extends BlocObserver {

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    // if (getIt<AppConfiguration>.writeLogs) print('${bloc.runtimeType} $change');
  }

}
