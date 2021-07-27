import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_web_app/Screen/HomeScreen.dart';
import 'package:task_web_app/Screen/ServiceScreen.dart';
import 'package:task_web_app/Screen/AboutRoute.dart';
import 'package:task_web_app/routing/route_names.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  print('generateRoute: ${settings.name}');
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(HomeScreen(), settings);
    case ServiceRoute:
      return _getPageRoute(ServiceScreen(), settings);
    case AboutRoute:
      return _getPageRoute(AboutScreen(), settings);
    default:
      return _getPageRoute(HomeScreen(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name.toString());
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;

  _FadeRoute({required this.child, required this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
