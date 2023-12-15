// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:weather_app/feature/base_scaffold/view/base_scaffold_view.dart'
    as _i4;
import 'package:weather_app/feature/home/view/home_view.dart' as _i2;
import 'package:weather_app/feature/settings/view/settings_view.dart' as _i1;
import 'package:weather_app/feature/splash/view/splash_view.dart' as _i3;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SettingsRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.SettingsView(),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.HomeView(
          key: args.key,
          lat: args.lat,
          long: args.long,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SplashView(),
      );
    },
    BaseScaffoldRoute.name: (routeData) {
      final args = routeData.argsAs<BaseScaffoldRouteArgs>(
          orElse: () => const BaseScaffoldRouteArgs());
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.BaseScaffoldView(
          key: args.key,
          lat: args.lat,
          long: args.long,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.SettingsView]
class SettingsRoute extends _i5.PageRouteInfo<void> {
  const SettingsRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeView]
class HomeRoute extends _i5.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i6.Key? key,
    double? lat,
    double? long,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            lat: lat,
            long: long,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i5.PageInfo<HomeRouteArgs> page =
      _i5.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    this.lat,
    this.long,
  });

  final _i6.Key? key;

  final double? lat;

  final double? long;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, lat: $lat, long: $long}';
  }
}

/// generated route for
/// [_i3.SplashView]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.BaseScaffoldView]
class BaseScaffoldRoute extends _i5.PageRouteInfo<BaseScaffoldRouteArgs> {
  BaseScaffoldRoute({
    _i6.Key? key,
    double? lat,
    double? long,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          BaseScaffoldRoute.name,
          args: BaseScaffoldRouteArgs(
            key: key,
            lat: lat,
            long: long,
          ),
          initialChildren: children,
        );

  static const String name = 'BaseScaffoldRoute';

  static const _i5.PageInfo<BaseScaffoldRouteArgs> page =
      _i5.PageInfo<BaseScaffoldRouteArgs>(name);
}

class BaseScaffoldRouteArgs {
  const BaseScaffoldRouteArgs({
    this.key,
    this.lat,
    this.long,
  });

  final _i6.Key? key;

  final double? lat;

  final double? long;

  @override
  String toString() {
    return 'BaseScaffoldRouteArgs{key: $key, lat: $lat, long: $long}';
  }
}
