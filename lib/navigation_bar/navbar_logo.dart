import 'package:flutter/material.dart';

class NavBarLogo extends StatelessWidget {
  final double _height;
  final double _width;

  const NavBarLogo(this._height, this._width);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      width: _width,
      child: Image.asset('assets/logo.png'),
    );
  }
}
