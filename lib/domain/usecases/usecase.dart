import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../app/injection/injection.dart';
import '../../data/error/exception_handler.dart';
import '../errors/app_error.dart';

abstract class UseCase<Type, Params> {
  UseCase({bool shouldRetry = true}) : _shouldRetry = shouldRetry;

  late final ExceptionHandler _exceptionHandler = getIt();
  final bool _shouldRetry;

  /// Ловит ошибки и возвращает AppError или нужный тип
  @nonVirtual
  Future<Either<AppError, Type>> call(Params params) =>
      _exceptionHandler.handle(() async => await execute(params),
          _shouldRetry ? () async => await execute(params) : null);

  @protected
  FutureOr<Type> execute(Params params);
}

abstract class UseCaseWithoutParams<Type> {
  UseCaseWithoutParams({bool shouldRetry = true}) : _shouldRetry = shouldRetry;

  late final ExceptionHandler _exceptionHandler = getIt();
  final bool _shouldRetry;

  /// Ловит ошибки и возвращает AppError или нужный тип
  @nonVirtual
  Future<Either<AppError, Type>> call() => _exceptionHandler.handle(
      () async => await execute(),
      _shouldRetry ? () async => await execute() : null);

  @protected
  FutureOr<Type> execute();
}
