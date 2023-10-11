import '../../../domain/entities/auth/token.dart';
import '../../network/response_models/auth/token_response.dart';
import '../mapper.dart';

void registerAuthResponseMappers(EntityMapper mapper) {
  mapper.register(_mapAuthResponse);
}

Token _mapAuthResponse(TokenResponse? entity, EntityMapper mapper) => Token(
      accessToken: entity?.accessToken ?? '',
      refreshToken: entity?.refreshToken ?? '',
    );
