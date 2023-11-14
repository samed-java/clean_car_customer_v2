import 'package:flutter/material.dart';

class ColorManager {
  ColorManager._();

  //static Color primary1 = HexColor.fromHex("#3772FF");
  static Color mainBlack = HexColor.fromHex("#000000");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
