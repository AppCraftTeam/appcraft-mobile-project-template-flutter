import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'response_models/product_response.dart';

part 'auth_network.g.dart';

@RestApi(baseUrl: '')
abstract class AuthNetwork {
  factory AuthNetwork(Dio dio, {String baseUrl}) = _AuthNetwork;

  @GET('https://fakestoreapi.com/products')
  Future<List<ProductResponse>> fetchProducts();
}