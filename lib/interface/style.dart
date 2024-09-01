import 'package:cotwcastmate/generated/fonts.gen.dart';
import 'package:cotwcastmate/miscellaneous/values.dart';
import 'package:flutter/material.dart';

class $StyleNormal {
  const $StyleNormal();

  $StyleNormalSize8 get s8 => const $StyleNormalSize8();

  $StyleNormalSize10 get s10 => const $StyleNormalSize10();

  $StyleNormalSize12 get s12 => const $StyleNormalSize12();

  $StyleNormalSize16 get s16 => const $StyleNormalSize16();

  $StyleNormalSize18 get s18 => const $StyleNormalSize18();

  $StyleNormalSize20 get s20 => const $StyleNormalSize20();

  $StyleNormalSize22 get s22 => const $StyleNormalSize22();
}

class $StyleNormalSize8 {
  const $StyleNormalSize8();

  TextStyle get w400 => const TextStyle(
        fontSize: 8,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.normal,
        height: Values.smallLineHeight,
      );

  TextStyle get w600 => w400.copyWith(fontWeight: FontWeight.w600);
}

class $StyleNormalSize10 {
  const $StyleNormalSize10();

  TextStyle get w400 => const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.normal,
        height: Values.smallLineHeight,
      );

  TextStyle get w600 => w400.copyWith(fontWeight: FontWeight.w600);
}

class $StyleNormalSize12 {
  const $StyleNormalSize12();

  TextStyle get w400 => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.normal,
        height: Values.smallLineHeight,
      );

  TextStyle get w400i => w400.copyWith(fontStyle: FontStyle.italic);

  TextStyle get w600 => w400.copyWith(fontWeight: FontWeight.w600);
}

class $StyleNormalSize16 {
  const $StyleNormalSize16();

  TextStyle get w400 => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.normal,
        height: Values.normalLineHeight,
      );

  TextStyle get w400i => w400.copyWith(fontStyle: FontStyle.italic);

  TextStyle get w600 => w400.copyWith(fontWeight: FontWeight.w600);

  TextStyle get w600l2 => w400.copyWith(fontWeight: FontWeight.w600, letterSpacing: 1.5);
}

class $StyleNormalSize18 {
  const $StyleNormalSize18();

  TextStyle get w400 => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.normal,
        height: Values.bigLineHeight,
        letterSpacing: 1.5,
      );
}

class $StyleNormalSize20 {
  const $StyleNormalSize20();

  TextStyle get w400 => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.normal,
        height: Values.bigLineHeight,
        letterSpacing: 1.5,
      );

  TextStyle get w600 => w400.copyWith(fontWeight: FontWeight.w600);
}

class $StyleNormalSize22 {
  const $StyleNormalSize22();

  TextStyle get w400 => const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.normal,
        height: Values.bigLineHeight,
        letterSpacing: 1.5,
      );

  TextStyle get w600 => w400.copyWith(fontWeight: FontWeight.w600);

  TextStyle get w800 => w400.copyWith(fontWeight: FontWeight.w800);
}

class $StyleCondensed {
  const $StyleCondensed();

  TextStyle get s14 => const TextStyle(
        fontSize: 14,
        fontFamily: FontFamily.condensed,
        height: Values.smallLineHeight,
      );
}

class Style {
  Style._();

  static const $StyleNormal normal = $StyleNormal();

  static const $StyleCondensed condensed = $StyleCondensed();
}
