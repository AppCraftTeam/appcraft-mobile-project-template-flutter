import '../../../domain/entities/product.dart';
import '../../network/response_models/product_response.dart';
import '../mapper.dart';

void registerCommonResponseMappers(EntityMapper mapper) {
  mapper.register<ProductResponse, Product>(_mapProduct);
}

Product _mapProduct(ProductResponse? entity, _) => Product(
    id: entity?.id ?? 0,
    title: entity?.title ?? '',
    price: entity?.price ?? 0,
    description: entity?.description ?? '',
    category: entity?.category ?? '',
    image: entity?.image ?? '');
