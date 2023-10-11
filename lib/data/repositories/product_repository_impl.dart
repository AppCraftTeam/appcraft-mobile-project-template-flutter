import 'package:injectable/injectable.dart';

import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../mappers/mapper.dart';
import '../network/auth_network.dart';
import '../network/response_models/product_response.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(this._authNetwork, this._map);

  final AuthNetwork _authNetwork;
  final EntityMapper _map;

  @override
  Future<List<Product>> fetchProducts() async {
    final result = await _authNetwork
        .fetchProducts()
        .then(_map.mapList<ProductResponse, Product>);
    return result;
  }
}
