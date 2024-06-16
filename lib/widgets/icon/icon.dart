import 'package:cotwcastmate/miscellaneous/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WidgetIcon extends StatelessWidget {
  final String _icon;
  final Color? _color;
  final double _size;

  const WidgetIcon(
    String icon, {
    super.key,
    Color? color,
  })  : _icon = icon,
        _color = color,
        _size = Values.iconSize;

  const WidgetIcon.withSize(
    String icon, {
    super.key,
    Color? color,
    required double size,
  })  : _icon = icon,
        _color = color,
        _size = size;

  String get icon => _icon;

  double get size => _size;

  ColorFilter? get colorFilter {
    if (_color != null) return ColorFilter.mode(_color!, BlendMode.srcIn);
    return null;
  }

  Widget buildWidgets() {
    return SvgPicture.asset(
      _icon,
      width: _size,
      height: _size,
      colorFilter: colorFilter,
    );
  }

  @override
  Widget build(BuildContext context) => buildWidgets();
}
