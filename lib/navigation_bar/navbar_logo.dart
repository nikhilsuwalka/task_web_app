import 'package:flutter/material.dart';
import 'package:task_web_app/locator.dart';
import 'package:task_web_app/routing/route_names.dart';
import 'package:task_web_app/services/navigation_service.dart';

class NavBarLogo extends StatelessWidget {
  final double _height;
  final double _width;

  const NavBarLogo(this._height, this._width);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        locator<NavigationService>().navigateTo(HomeRoute);
      },
      child: SizedBox(
        height: _height,
        width: _width,
        child: Image.asset('assets/logo.png'),
      ),
    );
  }
}
