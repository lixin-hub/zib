import 'package:flutter/material.dart';

abstract final class ThemeColors {
  static Color selectedColor = Colors.blue;
  static Color hoverColor = Colors.blueGrey;
  static Color nativeColor = Colors.grey;
  static Color primaryTextColor = Colors.white;
  static Color secondaryTextColor = Colors.white70;
  static Color asideBackgroundColor = const Color.fromRGBO(40, 42, 57, 1);

  static Color mainCentralColor = const Color(0xff1c1c1c);

  static var topBarColor = const Color.fromRGBO(0, 0, 0, 0.8);

  static var searchBackgroundColor = const Color(0xff282A39);

  static const primaryColor = Color(0xff302F4E);
  static const sideColor = Color(0xff313050);
  static const backgroundColor = Color(0xff212437);
  static const textColor = Color(0xff7874A7);
  static const menuTextColor = Color(0xff9794A8);
  static const selectedMenuFontStyle = TextStyle(fontSize: 20, color: Colors.indigo);
  static const unSelectedMenuFontStyle = TextStyle(fontSize: 20, color: menuTextColor);
  static const Color primary = contentColorCyan;
  static const Color menuBackground = Color(0xFF090912);
  static const Color itemsBackground = Color(0xFF1B2339);
  static const Color pageBackground = Color(0xFF282E45);
  static const Color mainTextColor1 = Colors.white;
  static const Color mainTextColor2 = Colors.white70;
  static const Color mainTextColor3 = Colors.white38;
  static const Color mainGridLineColor = Colors.white10;
  static const Color borderColor = Colors.white54;
  static const Color gridLinesColor = Color(0x11FFFFFF);

  static const Color contentColorBlack = Colors.black;
  static const Color contentColorWhite = Colors.white;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorOrange = Color(0xFFFF683B);
  static const Color contentColorGreen = Color(0xFF3BFF49);
  static const Color contentColorPurple = Color(0xFF6E1BFF);
  static const Color contentColorPink = Color(0xFFFF3AF2);
  static const Color contentColorRed = Color(0xFFE80054);
  static const Color contentColorCyan = Color(0xFF50E4FF);
}

