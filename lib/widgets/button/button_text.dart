import 'package:flutter/material.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/widgets/button/button.dart';
import 'package:cotwcastmate/widgets/text/text.dart';

class WidgetButtonText extends WidgetButton {
  final String _text;
  final Color? _color;

  const WidgetButtonText(
    String text, {
    super.key,
    Color? color,
    super.background,
    required super.onTap,
  })  : _text = text,
        _color = color,
        super(width: 0);

  Color get textColor => _color ?? Interface.primaryDark;

  @override
  Widget? buildCenter() {
    return WidgetText(
      _text,
      color: textColor,
      style: Style.normal.s16.w600,
    );
  }
}
