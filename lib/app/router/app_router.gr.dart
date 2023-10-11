// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_name/presentation/modules/wip/wip_page.dart' as _i1;
import 'package:auto_route/auto_route.dart' as _i2;

abstract class $AppRouter extends _i2.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    WipRoute.name: (routeData) {
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.WipPage(),
      );
    }
  };
}

/// generated route for
/// [_i1.WipPage]
class WipRoute extends _i2.PageRouteInfo<void> {
  const WipRoute({List<_i2.PageRouteInfo>? children})
      : super(
          WipRoute.name,
          initialChildren: children,
        );

  static const String name = 'WipRoute';

  static const _i2.PageInfo<void> page = _i2.PageInfo<void>(name);
}
