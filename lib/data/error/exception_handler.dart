import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../app/env/env.dart';
import '../../app/router/app_router.gr.dart';
import '../../domain/entities/auth/token.dart';
import '../../domain/errors/app_error.dart';
import '../../main.dart';
import '../local/keys.dart';
import '../local/preferences.dart';
import '../mappers/mapper.dart';
import '../network/common_network.dart';
import '../network/response_models/auth/token_response.dart';
import 'error_mapper.dart';

typedef Action<T> = FutureOr<T> Function();

@lazySingleton
class ExceptionHandler {
  ExceptionHandler(
      this._errorMapper, this._commonNetwork, this._preferences, this._map);

  final ErrorMapper _errorMapper;
  final CommonNetwork _commonNetwork;
  final Preferences _preferences;
  final EntityMapper _map;

  /// Handles error and returns Left(failure)
  ///
  /// On "Not Authorized" error refreshes token and retries.
  ///
  /// Pass (){} on retry, if no need to refresh

  Future<Either<AppError, T>> handle<T>(
      Action<T> function, Function? retry) async {
    try {
      return Right(await function());
    } on Exception catch (exception, s) {
      _log(exception, s);
      final error = _errorMapper.map(exception);
      if (retry != null && error.isAuth) {
        // token invalid, try to refresh token...
        try {
          final refreshToken = _preferences.getStringPreference(pRefreshToken);
          final token = await _commonNetwork
              .refreshToken(refreshToken)
              .then(_map.call<TokenResponse, Token>);
          if (token!.accessToken.isNotEmpty && token.refreshToken.isNotEmpty) {
            await _preferences.setPreference(pAccessToken, token.accessToken);
            await _preferences.setPreference(pRefreshToken, token.refreshToken);
          }
          retry();
        } on Exception catch (exception) {
          final error = _errorMapper.map(exception);
          if (error.isAuth) await appRouter.replaceAll([const AuthRoute()]);
          return Left(error);
        }
      }
      return Left(error);
    } on Object catch (e, s) {
      _log(e, s, obj: true);
      return Left(_errorMapper.unknownError);
    }
  }

  void _log(Object e, StackTrace s, {bool obj = false}) {
    if (Env.value.writeLogs) {
      print('=== Exception${obj ? ' (App Error)' : ''} ===');
      print(e);
      print(s);
    }
  }
}
