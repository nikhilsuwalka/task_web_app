import 'package:flutter/material.dart';

class MyColors {
  static const colorPrimary = "#e0301e";
  static const colorPrimaryDark = "#a32020";
  static const colorAccent = "#110f34";

  static Color? colorConvert(String color) {
    color = color.replaceAll("#", "");
    if (color.length == 6) {
      return Color(int.parse("0xFF" + color));
    } else if (color.length == 8) {
      return Color(int.parse("0x" + color));
    }
  }
}
