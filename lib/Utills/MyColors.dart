import 'package:flutter/material.dart';

class MyColors {
  static const colorPrimary = "#e0301e";
  static const colorPrimaryDark = "#a32020";
  static const colorAccent = "#110f34";
  static const yellow = "#eb8c00";

  static Color colorConvert(String color) {
    color = color.replaceAll("#", "");
    Color finalcolor = Colors.white;
    if (color.length == 6) {
      finalcolor = Color(int.parse("0xFF" + color));
    } else if (color.length == 8) {
      finalcolor = Color(int.parse("0x" + color));
    }

    return finalcolor;
  }
}
