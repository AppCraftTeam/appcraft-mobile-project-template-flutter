import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../app/generated/l10n.dart';
import '../../domain/errors/app_error.dart';
import '../../domain/errors/app_error_types.dart';

@LazySingleton()
class ErrorMapper {
  final unknownError =
      AppError(AppErrorType.unknownError, S.current.unknownError);
  final _timeoutError =
      AppError(AppErrorType.connectionTimeout, S.current.connectionError);

  AppError map(Exception exception) {
    if (exception is TimeoutException) {
      return _timeoutError;
    } else if (exception is DioError) {
      switch (exception.type) {
        case DioErrorType.sendTimeout:
        case DioErrorType.connectionTimeout:
        case DioErrorType.connectionError:
        case DioErrorType.receiveTimeout:
          return _timeoutError;
        case DioErrorType.badResponse:
          switch (exception.response?.statusCode) {
            case 400:
              return AppError(AppErrorType.somethingWentWrong,
                  S.current.somethingWentWrong);
            case 401:
              return AppError(
                  AppErrorType.accessTokenError, S.current.loadError);
            case 403:
              return AppError(AppErrorType.forbidden, S.current.forbidden);
            case 404:
              return AppError(
                  AppErrorType.resourceNotFound, S.current.somethingWentWrong,
                  shouldRetry: false);
            case 405:
              return AppError(
                  AppErrorType.methodNotAllowed, S.current.somethingWentWrong);
            case 500:
              return AppError(
                  AppErrorType.internalServerError, S.current.serverError);
            case 502:
              return AppError(AppErrorType.badGateway, S.current.serverError);

            // TODO Custom errors
            case 540:
              return const AppError(
                  AppErrorType.profileMediaLimitExhausted, 'Some error text',
                  shouldRetry: false);
          }
          break;
        case DioErrorType.unknown:
        case DioErrorType.cancel:
        case DioErrorType.badCertificate:
          return AppError(AppErrorType.connectionError, S.current.loadError);
      }
    }
    return AppError(
        AppErrorType.somethingWentWrong, S.current.somethingWentWrong);
  }
}
