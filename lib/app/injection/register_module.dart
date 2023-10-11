import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/network/auth_interceptor.dart';
import '../../data/network/auth_network.dart';
import '../../data/network/common_network.dart';
import '../app_configuration.dart';
import 'injection.dart';

@module
abstract class RegisterModule {
  @preResolve
  @lazySingleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  CommonNetwork get commonNetwork {
    final dio = Dio(BaseOptions(contentType: 'application/json'));
    final configuration = getIt<AppConfiguration>();
    return CommonNetwork(dio, baseUrl: configuration.baseUrl);
  }

  @lazySingleton
  AuthNetwork get authNetwork {
    final dio = Dio(BaseOptions(contentType: 'application/json'));
    dio.interceptors.add(getIt<AuthInterceptor>());
    final configuration = getIt<AppConfiguration>();
    return AuthNetwork(dio, baseUrl: configuration.baseUrl);
  }
}
