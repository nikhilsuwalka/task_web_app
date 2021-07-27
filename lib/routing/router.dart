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
      return _getPageRoute(HomeScreen());
    case ServiceRoute:
      return _getPageRoute(ServiceScreen());
    case AboutRoute:
      return _getPageRoute(AboutScreen());
    default:
      return _getPageRoute(HomeScreen());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(
    builder: (context) => child,
  );
}

class _AnimRoute extends PageRouteBuilder {
  final Widget child;

  _AnimRoute({required this.child})
      : super(
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
                ));
}
