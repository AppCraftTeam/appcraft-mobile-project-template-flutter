import 'package:injectable/injectable.dart';

import '../entities/product.dart';
import '../repositories/product_repository.dart';
import 'usecase.dart';

@lazySingleton
class FetchProductsUseCase extends UseCaseWithoutParams<List<Product>> {
  FetchProductsUseCase(this._productRepository);

  // final ProductsFrontend _frontend;
  final ProductRepository _productRepository;

  // // Пример работы с отдельным потоком
  // Future<Either<AppError, List<Product>>> isolate() =>
  //     _frontend.fetchProducts();

  // Загрузка в главном потоке
  @override
  Future<List<Product>> execute() => _productRepository.fetchProducts();
}
