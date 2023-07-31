import 'package:culture_circle_app_task/presentation/main/auth_view/auth_view.dart';
import 'package:culture_circle_app_task/presentation/main/main_view.dart';
import 'package:culture_circle_app_task/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static const String authRoute = '/auth';
  static const String homeRoute = '/home';
}

class RouteGenerator {
  static Route<dynamic> route(RouteSettings routeSettings) {
    switch(routeSettings.name) {
      case RouteManager.homeRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case RouteManager.authRoute:
        return MaterialPageRoute(builder: (_) => const AuthView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text(StringManager.pageNotFound),
        ),
      ),
    );
  }
}
