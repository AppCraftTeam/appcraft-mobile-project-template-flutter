// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i18;
import 'package:templateflutter/app/app_configuration.dart' as _i3;
import 'package:templateflutter/app/dev.dart' as _i6;
import 'package:templateflutter/app/injection/register_module.dart' as _i27;
import 'package:templateflutter/app/prod.dart' as _i4;
import 'package:templateflutter/app/stage.dart' as _i5;
import 'package:templateflutter/data/error/error_mapper.dart' as _i10;
import 'package:templateflutter/data/error/exception_handler.dart' as _i26;
import 'package:templateflutter/data/local/preferences.dart' as _i24;
import 'package:templateflutter/data/mappers/mapper.dart' as _i9;
import 'package:templateflutter/data/network/auth_interceptor.dart' as _i25;
import 'package:templateflutter/data/network/auth_network.dart' as _i7;
import 'package:templateflutter/data/network/common_network.dart' as _i8;
import 'package:templateflutter/data/repositories/hive_repository_impl.dart'
    as _i13;
import 'package:templateflutter/data/repositories/product_repository_impl.dart'
    as _i15;
import 'package:templateflutter/data/storage/hive_boxes.dart' as _i11;
import 'package:templateflutter/domain/frontends/products_frontend.dart'
    as _i16;
import 'package:templateflutter/domain/repositories/preferences_repository.dart'
    as _i12;
import 'package:templateflutter/domain/repositories/product_repository.dart'
    as _i14;
import 'package:templateflutter/domain/usecases/fetch_products_usecase.dart'
    as _i19;
import 'package:templateflutter/domain/usecases/preferences/get_bool_preference_usecase.dart'
    as _i20;
import 'package:templateflutter/domain/usecases/preferences/get_double_preference_usecase.dart'
    as _i21;
import 'package:templateflutter/domain/usecases/preferences/get_int_preference_usecase.dart'
    as _i22;
import 'package:templateflutter/domain/usecases/preferences/get_string_preference_usecase.dart'
    as _i23;
import 'package:templateflutter/domain/usecases/preferences/set_preference_usecase.dart'
    as _i17;

const String _prod = 'prod';
const String _stage = 'stage';
const String _dev = 'dev';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.AppConfiguration>(
      () => const _i4.ProdAppConfiguration(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i3.AppConfiguration>(
      () => const _i5.StageAppConfiguration(),
      registerFor: {_stage},
    );
    gh.lazySingleton<_i3.AppConfiguration>(
      () => const _i6.DevAppConfiguration(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i7.AuthNetwork>(() => registerModule.authNetwork);
    gh.lazySingleton<_i8.CommonNetwork>(() => registerModule.commonNetwork);
    gh.lazySingleton<_i9.EntityMapper>(() => _i9.EntityMapper.create());
    gh.lazySingleton<_i10.ErrorMapper>(() => _i10.ErrorMapper());
    gh.lazySingleton<_i11.HiveBoxes>(() => _i11.HiveBoxes());
    gh.lazySingleton<_i12.HiveRepository>(
        () => _i13.HiveRepositoryImpl(gh<_i11.HiveBoxes>()));
    gh.lazySingleton<_i14.ProductRepository>(() => _i15.ProductRepositoryImpl(
          gh<_i7.AuthNetwork>(),
          gh<_i9.EntityMapper>(),
        ));
    gh.lazySingletonAsync<_i16.ProductsFrontend>(
        () => _i16.ProductsFrontend.create());
    gh.lazySingleton<_i17.SetPreferenceUseCase>(
        () => _i17.SetPreferenceUseCase(gh<_i12.HiveRepository>()));
    await gh.lazySingletonAsync<_i18.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i19.FetchProductsUseCase>(
        () => _i19.FetchProductsUseCase(gh<_i14.ProductRepository>()));
    gh.lazySingleton<_i20.GetBoolPreferenceUseCase>(
        () => _i20.GetBoolPreferenceUseCase(gh<_i12.HiveRepository>()));
    gh.lazySingleton<_i21.GetDoublePreferenceUseCase>(
        () => _i21.GetDoublePreferenceUseCase(gh<_i12.HiveRepository>()));
    gh.lazySingleton<_i22.GetIntPreferenceUseCase>(
        () => _i22.GetIntPreferenceUseCase(gh<_i12.HiveRepository>()));
    gh.lazySingleton<_i23.GetStringPreferenceUseCase>(
        () => _i23.GetStringPreferenceUseCase(gh<_i12.HiveRepository>()));
    gh.lazySingleton<_i24.Preferences>(
        () => _i24.Preferences(gh<_i18.SharedPreferences>()));
    gh.lazySingleton<_i25.AuthInterceptor>(
        () => _i25.AuthInterceptor(gh<_i24.Preferences>()));
    gh.lazySingleton<_i26.ExceptionHandler>(() => _i26.ExceptionHandler(
          gh<_i10.ErrorMapper>(),
          gh<_i8.CommonNetwork>(),
          gh<_i24.Preferences>(),
          gh<_i9.EntityMapper>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i27.RegisterModule {}
