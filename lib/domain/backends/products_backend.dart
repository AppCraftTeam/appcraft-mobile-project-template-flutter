import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:isolator/isolator.dart';

import '../entities/product.dart';
import '../errors/app_error.dart';
import '../usecases/fetch_products_usecase.dart';

class ProductsBackend extends Backend {
  ProductsBackend(this._fetchProductsUseCase,
      {required BackendArgument<void> argument})
      : super(argument: argument);

  final FetchProductsUseCase _fetchProductsUseCase;
  final List<Product> _products = [];

  @override
  void initActions() {
    whenEventCome(ProductsBackendEvent.fetchProducts).run(_fetchProducts);
    whenEventCome(ProductsBackendEvent.filterProducts).run(_filterProducts);
  }

  Future<Either<AppError, List<Product>>> _fetchProducts(
      {required ProductsBackendEvent event, void data}) async {
    final result = await _fetchProductsUseCase();
    if (result.isRight()) {
      _products
        ..clear()
        ..addAll(result.getOrElse(() => []));
    }
    return result;
  }

  Future<void> _filterProducts(
      {required String data, required ProductsBackendEvent event}) async {
    await send<ProductsBackendEvent, void>(
        event: ProductsBackendEvent.productsFilteringStart);

    final filteredProducts =
        _products.where(_filterPredicate(data)).toList(growable: false);

    await send<ProductsBackendEvent, List<Product>>(
        event: ProductsBackendEvent.productsFilteringEnd,
        data: filteredProducts);
  }

  bool Function(Product) _filterPredicate(String searchSubString) {
    final filterRegExp =
        RegExp(searchSubString, caseSensitive: false, unicode: true);
    return (Product item) {
      if (searchSubString.isEmpty) {
        return true;
      }
      return filterRegExp.hasMatch(item.title) ||
          filterRegExp.hasMatch(item.description);
    };
  }
}

enum ProductsBackendEvent {
  init,
  fetchProducts,
  filterProducts,
  productsFilteringStart,
  productsFilteringEnd,
}
