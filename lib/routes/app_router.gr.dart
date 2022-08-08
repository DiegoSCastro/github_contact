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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../features/contacts_screen/contacts_screen.dart' as _i5;
import '../features/home_screen/home_screen.dart' as _i2;
import '../features/splash_screen.dart' as _i1;
import '../features/user_details_screen/user_details_screen.dart' as _i3;
import '../features/user_repository/user_repository_screen.dart' as _i4;
import '../models/user_details.dart' as _i8;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomeScreen());
    },
    UserDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<UserDetailsRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.UserDetailsScreen(key: args.key, userId: args.userId));
    },
    UserRepositoryRoute.name: (routeData) {
      final args = routeData.argsAs<UserRepositoryRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.UserRepositoryScreen(key: args.key, userId: args.userId));
    },
    ContactsRoute.name: (routeData) {
      final args = routeData.argsAs<ContactsRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i5.ContactsScreen(key: args.key, userDetails: args.userDetails));
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(SplashRoute.name, path: '/'),
        _i6.RouteConfig(HomeRoute.name, path: '/home'),
        _i6.RouteConfig(UserDetailsRoute.name, path: '/user-details'),
        _i6.RouteConfig(UserRepositoryRoute.name, path: '/user-repository'),
        _i6.RouteConfig(ContactsRoute.name, path: '/contacts')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.UserDetailsScreen]
class UserDetailsRoute extends _i6.PageRouteInfo<UserDetailsRouteArgs> {
  UserDetailsRoute({_i7.Key? key, required String userId})
      : super(UserDetailsRoute.name,
            path: '/user-details',
            args: UserDetailsRouteArgs(key: key, userId: userId));

  static const String name = 'UserDetailsRoute';
}

class UserDetailsRouteArgs {
  const UserDetailsRouteArgs({this.key, required this.userId});

  final _i7.Key? key;

  final String userId;

  @override
  String toString() {
    return 'UserDetailsRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i4.UserRepositoryScreen]
class UserRepositoryRoute extends _i6.PageRouteInfo<UserRepositoryRouteArgs> {
  UserRepositoryRoute({_i7.Key? key, required String userId})
      : super(UserRepositoryRoute.name,
            path: '/user-repository',
            args: UserRepositoryRouteArgs(key: key, userId: userId));

  static const String name = 'UserRepositoryRoute';
}

class UserRepositoryRouteArgs {
  const UserRepositoryRouteArgs({this.key, required this.userId});

  final _i7.Key? key;

  final String userId;

  @override
  String toString() {
    return 'UserRepositoryRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i5.ContactsScreen]
class ContactsRoute extends _i6.PageRouteInfo<ContactsRouteArgs> {
  ContactsRoute({_i7.Key? key, required _i8.UserDetails userDetails})
      : super(ContactsRoute.name,
            path: '/contacts',
            args: ContactsRouteArgs(key: key, userDetails: userDetails));

  static const String name = 'ContactsRoute';
}

class ContactsRouteArgs {
  const ContactsRouteArgs({this.key, required this.userDetails});

  final _i7.Key? key;

  final _i8.UserDetails userDetails;

  @override
  String toString() {
    return 'ContactsRouteArgs{key: $key, userDetails: $userDetails}';
  }
}
