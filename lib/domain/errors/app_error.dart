import 'package:equatable/equatable.dart';

import 'app_error_types.dart';

class AppError extends Equatable {
  const AppError(
    this.type,
    this.message, {
    this.shouldRetry = true,
  });

  final AppErrorType type;
  final String message;
  final bool shouldRetry;

  bool get isAuth => type == AppErrorType.accessTokenError;
  bool get isNotFound => type == AppErrorType.resourceNotFound;

  @override
  List<Object?> get props => [type];
}
