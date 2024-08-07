// ignore_for_file: cast_nullable_to_non_nullable

import 'package:danapp_doit/core/core.dart';
import 'package:danapp_doit/features/features.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteName.splash:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const SplashScreenView(),
      );

    case RouteName.welcomeScreen:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const WelcomeScreenView(),
      );

    case RouteName.createAccount:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const CreateAccountView(),
      );

    case RouteName.loginView:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const LoginView(),
      );
    case RouteName.appTabView:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const AppTabView(),
      );

    case RouteName.allTasks:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const AllTasks(),
      );

    case RouteName.allProjects:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const AllProjects(),
      );

    default:
      return MaterialPageRoute<dynamic>(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

Route<dynamic> _getPageRoute({
  required String routeName,
  required Widget viewToShow,
}) {
  return MaterialPageRoute(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow,
  );
}
