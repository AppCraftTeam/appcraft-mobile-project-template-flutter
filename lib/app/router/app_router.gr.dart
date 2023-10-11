// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:templateflutter/presentation/screens/auth/auth_page.dart'
    as _i1;
import 'package:templateflutter/presentation/screens/product_detail_page.dart'
    as _i2;
import 'package:templateflutter/presentation/screens/start/start_screen.dart'
    as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthPage(),
      );
    },
    ProductDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ProductDetailPage(
          args.title,
          price: args.price,
          key: args.key,
        ),
      );
    },
    StartScreen.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.StartScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthPage]
class AuthRoute extends _i4.PageRouteInfo<void> {
  const AuthRoute({List<_i4.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ProductDetailPage]
class ProductDetailRoute extends _i4.PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    required String title,
    int? price,
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          ProductDetailRoute.name,
          args: ProductDetailRouteArgs(
            title: title,
            price: price,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailRoute';

  static const _i4.PageInfo<ProductDetailRouteArgs> page =
      _i4.PageInfo<ProductDetailRouteArgs>(name);
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({
    required this.title,
    this.price,
    this.key,
  });

  final String title;

  final int? price;

  final _i5.Key? key;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{title: $title, price: $price, key: $key}';
  }
}

/// generated route for
/// [_i3.StartScreen]
class StartScreen extends _i4.PageRouteInfo<void> {
  const StartScreen({List<_i4.PageRouteInfo>? children})
      : super(
          StartScreen.name,
          initialChildren: children,
        );

  static const String name = 'StartScreen';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
