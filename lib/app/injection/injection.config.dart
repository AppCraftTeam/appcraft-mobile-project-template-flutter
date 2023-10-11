// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i15;
import 'package:templateflutter/app/injection/register_module.dart' as _i26;
import 'package:templateflutter/data/error/error_mapper.dart' as _i6;
import 'package:templateflutter/data/error/exception_handler.dart' as _i25;
import 'package:templateflutter/data/local/preferences.dart' as _i21;
import 'package:templateflutter/data/mappers/mapper.dart' as _i5;
import 'package:templateflutter/data/network/auth_interceptor.dart' as _i24;
import 'package:templateflutter/data/network/auth_network.dart' as _i3;
import 'package:templateflutter/data/network/common_network.dart' as _i4;
import 'package:templateflutter/data/repositories/hive_repository_impl.dart'
    as _i9;
import 'package:templateflutter/data/repositories/product_repository_impl.dart'
    as _i12;
import 'package:templateflutter/data/storage/hive_boxes.dart' as _i7;
import 'package:templateflutter/domain/frontends/products_frontend.dart'
    as _i13;
import 'package:templateflutter/domain/repositories/preferences_repository.dart'
    as _i8;
import 'package:templateflutter/domain/repositories/product_repository.dart'
    as _i11;
import 'package:templateflutter/domain/usecases/fetch_products_usecase.dart'
    as _i16;
import 'package:templateflutter/domain/usecases/preferences/get_bool_preference_usecase.dart'
    as _i17;
import 'package:templateflutter/domain/usecases/preferences/get_double_preference_usecase.dart'
    as _i18;
import 'package:templateflutter/domain/usecases/preferences/get_int_preference_usecase.dart'
    as _i19;
import 'package:templateflutter/domain/usecases/preferences/get_string_preference_usecase.dart'
    as _i20;
import 'package:templateflutter/domain/usecases/preferences/set_preference_usecase.dart'
    as _i14;
import 'package:templateflutter/presentation/screens/main/bloc/main_bloc.dart'
    as _i10;
import 'package:templateflutter/presentation/screens/product/bloc/product_bloc.dart'
    as _i22;
import 'package:templateflutter/presentation/screens/start/bloc/start_bloc.dart'
    as _i23;

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
    gh.lazySingleton<_i3.AuthNetwork>(() => registerModule.authNetwork);
    gh.lazySingleton<_i4.CommonNetwork>(() => registerModule.commonNetwork);
    gh.lazySingleton<_i5.EntityMapper>(() => _i5.EntityMapper.create());
    gh.lazySingleton<_i6.ErrorMapper>(() => _i6.ErrorMapper());
    gh.lazySingleton<_i7.HiveBoxes>(() => _i7.HiveBoxes());
    gh.lazySingleton<_i8.HiveRepository>(
        () => _i9.HiveRepositoryImpl(gh<_i7.HiveBoxes>()));
    gh.factory<_i10.MainBloc>(() => _i10.MainBloc());
    gh.lazySingleton<_i11.ProductRepository>(() => _i12.ProductRepositoryImpl(
          gh<_i3.AuthNetwork>(),
          gh<_i5.EntityMapper>(),
        ));
    gh.lazySingletonAsync<_i13.ProductsFrontend>(
        () => _i13.ProductsFrontend.create());
    gh.lazySingleton<_i14.SetPreferenceUseCase>(
        () => _i14.SetPreferenceUseCase(gh<_i8.HiveRepository>()));
    await gh.lazySingletonAsync<_i15.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i16.FetchProductsUseCase>(
        () => _i16.FetchProductsUseCase(gh<_i11.ProductRepository>()));
    gh.lazySingleton<_i17.GetBoolPreferenceUseCase>(
        () => _i17.GetBoolPreferenceUseCase(gh<_i8.HiveRepository>()));
    gh.lazySingleton<_i18.GetDoublePreferenceUseCase>(
        () => _i18.GetDoublePreferenceUseCase(gh<_i8.HiveRepository>()));
    gh.lazySingleton<_i19.GetIntPreferenceUseCase>(
        () => _i19.GetIntPreferenceUseCase(gh<_i8.HiveRepository>()));
    gh.lazySingleton<_i20.GetStringPreferenceUseCase>(
        () => _i20.GetStringPreferenceUseCase(gh<_i8.HiveRepository>()));
    gh.lazySingleton<_i21.Preferences>(
        () => _i21.Preferences(gh<_i15.SharedPreferences>()));
    gh.factory<_i22.ProductBloc>(
        () => _i22.ProductBloc(gh<_i16.FetchProductsUseCase>()));
    gh.factory<_i23.StartBloc>(() => _i23.StartBloc(
          gh<_i17.GetBoolPreferenceUseCase>(),
          gh<_i20.GetStringPreferenceUseCase>(),
          gh<_i14.SetPreferenceUseCase>(),
        ));
    gh.lazySingleton<_i24.AuthInterceptor>(
        () => _i24.AuthInterceptor(gh<_i21.Preferences>()));
    gh.lazySingleton<_i25.ExceptionHandler>(() => _i25.ExceptionHandler(
          gh<_i6.ErrorMapper>(),
          gh<_i4.CommonNetwork>(),
          gh<_i21.Preferences>(),
          gh<_i5.EntityMapper>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i26.RegisterModule {}
