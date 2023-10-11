import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/network/auth_interceptor.dart';
import '../../data/network/auth_network.dart';
import '../../data/network/common_network.dart';
import '../env/env.dart';
import 'injection.dart';

@module
abstract class RegisterModule {
  @preResolve
  @lazySingleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  CommonNetwork get commonNetwork {
    final dio = Dio(BaseOptions(contentType: 'application/json'));
    return CommonNetwork(dio, baseUrl: Env.value.baseUrl);
  }

  @lazySingleton
  AuthNetwork get authNetwork {
    final dio = Dio(BaseOptions(contentType: 'application/json'));
    dio.interceptors.add(getIt<AuthInterceptor>());
    return AuthNetwork(dio, baseUrl: Env.value.baseUrl);
  }
}
