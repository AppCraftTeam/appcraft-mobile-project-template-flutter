import 'dart:async';
import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:isolator/isolator.dart';

import '../../app/generated/l10n.dart';
import '../../app/injection/injection.dart';
import '../backends/products_backend.dart';
import '../entities/product.dart';
import '../errors/app_error.dart';
import '../errors/app_error_types.dart';

@lazySingleton
class ProductsFrontend with Frontend {
  ProductsFrontend();

  var _status = _LaunchStatus.stopped;

  @factoryMethod
  static Future<ProductsFrontend> create() {
    final instance = ProductsFrontend();
    return instance.launch().then((_) => instance);
  }

  @override
  void initActions() {
    whenEventCome(ProductsBackendEvent.productsFilteringStart)
        .run(_startFilteringProducts);
    whenEventCome(ProductsBackendEvent.productsFilteringEnd)
        .run(_endFilteringProducts);
  }

  Future<Either<AppError, List<Product>>> fetchProducts() async {
    final products =
        await run<ProductsBackendEvent, Void, Either<AppError, List<Product>>>(
            event: ProductsBackendEvent.fetchProducts);

    return products.hasValue
        ? products.value
        : Left<AppError, List<Product>>(
            AppError(AppErrorType.unknownError, S.current.somethingWentWrong));
  }

  Future<void> launch() async {
    if (_status == _LaunchStatus.launching ||
        _status == _LaunchStatus.launched) {
      return;
    }

    _status = _LaunchStatus.launching;
    await initBackend(initializer: _launchBackend);
    _status = _LaunchStatus.launched;
  }

  ProductsBackend _launchBackend(BackendArgument<void> argument) =>
      ProductsBackend(getIt(), argument: argument);

  FutureOr<void> _startFilteringProducts(
      {required ProductsBackendEvent event, void data}) {
    // любые действия...
    // Например, можно примешать ChangeNotifier, создать поля,
    // и здесь же изменять их и уведомлять об изменении.
  }

  FutureOr<void> _endFilteringProducts(
      {required List<Product> data, required ProductsBackendEvent event}) {
    // ...
  }
}

enum _LaunchStatus { stopped, launching, launched }
