import 'package:flutter/material.dart';

class Interface {
  static const String version = "1.0.0";

  static const Color transparent = Colors.transparent;

  static const Color primaryDark = Color(0xFF0E0E10);
  static const Color primary = Color(0xFFFFC805);
  static const Color primaryLight = Color(0xFFFFFFFF);

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

  static const Color markerLookoutTower = Color(0xFF8FCE63);
  static const Color markerOutpost = Color(0xFFFFF734);
  static const Color markerTrailhead = Color(0xFFF79D4F);
  static const Color markerFishingSpot = Color(0xFFF4784D);
  static const Color markerWarden = Color(0xFFEF524A);
  static const Color markerPointOfInterest = Color(0xFFA2559F);
  static const Color markerShop = Color(0xFFC0588C);
  static const Color markerVista = Color(0xFF3483C0);
  static const Color markerChallengeBoard = Color(0xFF4AC8C9);

  static const Color bronze = Color(0xFF6D4C41);
  static const Color silver = Color(0xFF546E7A);
  static const Color gold = Color(0xFFCCA000);
  static const Color diamond = Color(0xFF1565C0);
  static const Color legendary = Color(0xFF910AC8);

  static Color odd = primaryDark.withOpacity(0.6);
  static Color even = primaryDark.withOpacity(0.4);

  static Color title = primaryDark.withOpacity(0.4);
  static Color subtitle = title.withOpacity(0.2);

  static Color disabled = primaryLight.withOpacity(0.4);
  static Color dropDown = primaryDark.withOpacity(0.8);

  static InputBorder get textFieldBorder => const OutlineInputBorder(
        borderSide: BorderSide(width: 0.05, color: Colors.transparent),
      );
}
