import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex("#0C0F1B");
  static Color orange_1 = HexColor.fromHex("#FCA326");
  static Color yellow_1 = HexColor.fromHex("#F8BD00");
  static Color dark_brown_1 = HexColor.fromHex("#474646");
  static Color navyBlue_1 = HexColor.fromHex("#1B2444");
  static Color hints_grey = HexColor.fromHex("#676767");
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color grey = HexColor.fromHex("#535767");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color primaryOpacity70 = HexColor.fromHex("#B3ED9728");

  // new colors
  static Color darkPrimary = HexColor.fromHex("#d17d11");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color grey_whats = HexColor.fromHex("#99A1BE");
  static Color error = HexColor.fromHex("#e61f34");
  static Color black= HexColor.fromHex("#000000"); // red color
  static Color trasp_black= HexColor.fromHex("#20232E"); // red color
}

extension HexColor on Color{
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
