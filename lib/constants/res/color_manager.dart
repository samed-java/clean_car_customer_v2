import 'package:flutter/material.dart';

class ColorManager {
  ColorManager._();

  //static Color primary1 = HexColor.fromHex("#3772FF");
  static Color mainBlack = HexColor.fromHex("#000000");
  static Color secondaryBlack = HexColor.fromHex("#000000").withOpacity(0.8);
  static Color thirdBlack = HexColor.fromHex("#000000").withOpacity(0.6);
  static Color fourthBlack = HexColor.fromHex("#000000").withOpacity(0.4);
  static Color fifthBlack = HexColor.fromHex("#000000").withOpacity(0.2);
  static Color mainWhite = HexColor.fromHex("#FFFFFF");
  static Color secondaryWhite = HexColor.fromHex("#FFFFFF").withOpacity(0.4);
  static Color mainBlue = HexColor.fromHex("#4283F0");
  static Color secondaryBlue = HexColor.fromHex("#4283F0").withOpacity(0.4);
  static Color fifthBlue = HexColor.fromHex("#4283F0").withOpacity(0.2);
  static Color mainBackgroundColor = HexColor.fromHex("#F5F5F5");
  static Color illustrationGreen = HexColor.fromHex("#09BA85");
  static Color secondaryGreen = HexColor.fromHex("#09BA85").withOpacity(0.8);
  static Color humanColor = HexColor.fromHex("#EB8D65");
  static Color secondaryOrange = HexColor.fromHex("#F79811").withOpacity(0.8);
  static Color mainRed = HexColor.fromHex("#ED5D5A");
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
