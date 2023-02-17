// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../screens/authorization/presentation/view/authentication_screen.dart'
    as _i2;
import '../screens/authorization/presentation/view/register_screen.dart' as _i4;
import '../screens/mainscreen/presentation/view/main_screen.dart' as _i3;
import '../screens/splashscreen/presentation/view/splash_screen.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
        fullscreenDialog: true,
      );
    },
    AuthenticationScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AuthenticationScreen(),
        fullscreenDialog: true,
      );
    },
    MainScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.MainScreen(),
        fullscreenDialog: true,
      );
    },
    RegistrationScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.RegistrationScreen(),
        fullscreenDialog: true,
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/splash-screen',
          fullMatch: true,
        ),
        _i5.RouteConfig(
          SplashRoute.name,
          path: '/splash-screen',
        ),
        _i5.RouteConfig(
          AuthenticationScreen.name,
          path: '/auth-screen',
        ),
        _i5.RouteConfig(
          MainScreen.name,
          path: '/main-screen',
        ),
        _i5.RouteConfig(
          RegistrationScreen.name,
          path: '/reg-screen',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/splash-screen',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.AuthenticationScreen]
class AuthenticationScreen extends _i5.PageRouteInfo<void> {
  const AuthenticationScreen()
      : super(
          AuthenticationScreen.name,
          path: '/auth-screen',
        );

  static const String name = 'AuthenticationScreen';
}

/// generated route for
/// [_i3.MainScreen]
class MainScreen extends _i5.PageRouteInfo<void> {
  const MainScreen()
      : super(
          MainScreen.name,
          path: '/main-screen',
        );

  static const String name = 'MainScreen';
}

/// generated route for
/// [_i4.RegistrationScreen]
class RegistrationScreen extends _i5.PageRouteInfo<void> {
  const RegistrationScreen()
      : super(
          RegistrationScreen.name,
          path: '/reg-screen',
        );

  static const String name = 'RegistrationScreen';
}
