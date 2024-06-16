import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/miscellaneous/values.dart';
import 'package:cotwcastmate/widgets/app/margin.dart';
import 'package:cotwcastmate/widgets/icon/icon.dart';
import 'package:cotwcastmate/widgets/section/section_tap.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:flutter/material.dart';

class WidgetSectionMenu extends WidgetSectionTap {
  final String? _icon;
  final Color _color;

  const WidgetSectionMenu(
    super.text, {
    super.key,
    String? icon,
    Color? color,
    required super.onTap,
  })  : _icon = icon,
        _color = color ?? Interface.primary,
        super(background: Interface.transparent);

  @override
  double get height => _icon == null ? Values.menu - 10 : Values.menu;

  Widget _buildIcon() {
    return WidgetIcon.withSize(
      _icon!,
      color: _color,
      size: Values.indicatorSize,
    );
  }

  Widget _buildText() {
    return WidgetText(
      super.text,
      color: Interface.primaryLight.withOpacity(0.8),
      style: Style.normal.s20.w400,
    );
  }

  @override
  Widget buildCenter() {
    return Row(
      children: [
        if (_icon != null) WidgetMargin.right(15, child: _buildIcon()),
        Expanded(child: _buildText()),
      ],
    );
  }
}
