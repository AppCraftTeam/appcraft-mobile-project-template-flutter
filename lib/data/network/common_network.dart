import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'response_models/auth/token_response.dart';

part 'common_network.g.dart';

@RestApi(baseUrl: '')
abstract class CommonNetwork {
  factory CommonNetwork(Dio dio, {String baseUrl}) = _CommonNetwork;

  @POST('api/auth/tokens/refresh')
  Future<TokenResponse> refreshToken(
    @Field('refresh') String? refreshToken,
  );
}
