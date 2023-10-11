// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_name/app/app_configuration.dart' as _i3;
import 'package:app_name/app/dev.dart' as _i6;
import 'package:app_name/app/prod.dart' as _i4;
import 'package:app_name/app/stage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

const String _prod = 'prod';
const String _stage = 'stage';
const String _dev = 'dev';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
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
    return this;
  }
}
