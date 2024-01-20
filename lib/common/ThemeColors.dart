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
}
