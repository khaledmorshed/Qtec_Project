import 'package:flutter/material.dart';
class ColorManager {
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color stockColor = HexColor.fromHex("#FFCCCC");
  static Color lightPink = HexColor.fromHex("#E5E5E5");
  static Color white1 = HexColor.fromHex("#FFFFFF");
  static Color polygonColor = HexColor.fromHex("#6210E1");

  static Color lightPink2 = Color.fromARGB(255, 255, 255, 1);
  static Color red2 = Color(0xfff06292);

}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}