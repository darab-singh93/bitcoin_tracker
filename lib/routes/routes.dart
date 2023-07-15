import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../views/home.dart';

class RoutePath {
  static const String home = "/home";
}

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.home:
        return CupertinoPageRoute(builder: (ctx) => const Home());
      default:
        return CupertinoPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
