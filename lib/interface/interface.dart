import 'package:flutter/material.dart';

class Interface {
  static const String version = "1.0.0";

  static const Color transparent = Colors.transparent;

  static const Color primaryDark = Color(0xFF0E0E10);
  static const Color primary = Color(0xFFFFC805);
  static const Color primaryLight = Color(0xFFFFFFFF);

  static const Color primaryAccentLight = Color(0xFF77CEDA);
  static const Color primaryAccent = Color(0xFF34ADBD);
  static const Color primaryAccentDarker = Color(0xFF205866);
  static const Color primaryAccentDark = Color(0xFF121322);

  static const Color lightF7 = Color(0xFFF7F7F7);
  static const Color lightE9 = Color(0xFFE9E9E9);
  static const Color lightD9 = Color(0xFFD9D9D9);
  static const Color lightC4 = Color(0xFFC4C4C4);
  static const Color light7C = Color(0xFF7C7C7C);

  static const Color dark56 = Color(0xFF565656);
  static const Color dark33 = Color(0xFF333333);
  static const Color dark1A = Color(0xFF1A1A1A);
  static const Color dark12 = Color(0xFF121212);
  static const Color dark0D = Color(0xFF0D0D0D);

  static const Color snackSuccess = Color(0xFF8FCE63);
  static const Color snackError = Color(0xFFEF524A);

  static Color none = disabled.withOpacity(0.1);
  static const Color juvenile = dark1A;
  static const Color bronze = Color(0xFF6D4C41);
  static const Color silver = Color(0xFF546E7A);
  static const Color gold = Color(0xFFCCA000);
  static const Color diamond = Color(0xFF1565C0);
  static const Color legendary = Color(0xFF910AC8);

  static const List<Color> mapColors = [
    Color(0xFFEFEFEF),
    Color(0xFFB499FF),
    Color(0xFF9873FF),
    Color(0xFF7C4DFF),
    Color(0xFFAB47BC),
    Color(0xFFE91E63),
    Color(0xFFE81E47),
    Color(0xFFF44336),
    Color(0xFFFF5722),
    Color(0xFFFF9800),
    Color(0xFFFFC107),
    Color(0xFFFFEB3B),
    Color(0xFFCDDC39),
    Color(0xFF8BC34A),
    Color(0xFF4CAF50),
    Color(0xFF009688),
    Color(0xFF00BCD4),
    Color(0xFF03A9F4),
    Color(0xFF2196F3),
    Color(0xFF0B76CE),
    Color(0xFF3D5AFE),
    Color(0xFF6778D5),
    Color(0xFF607D8B),
    Color(0xFF9E9E9E),
    Color(0xFFC8B6AF),
    Color(0xFF8D6E63),
    Color(0xFF5B473F),
  ];

  static Color odd = primaryDark.withOpacity(0.4);
  static Color even = primaryDark.withOpacity(0.2);

  static Color title = primaryDark.withOpacity(0.6);
  static Color subtitle = title.withOpacity(0.4);

  static Color additional = primaryLight.withOpacity(0.6);
  static Color disabled = primaryLight.withOpacity(0.4);
  static Color dropDown = primaryDark.withOpacity(0.8);

  static InputBorder get textFieldBorder => const OutlineInputBorder(
        borderSide: BorderSide(width: 0.05, color: Colors.transparent),
      );
}
