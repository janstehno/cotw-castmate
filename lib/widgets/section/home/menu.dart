import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/interface/values.dart';
import 'package:cotwcastmate/widgets/app/margin.dart';
import 'package:cotwcastmate/widgets/icons/icon.dart';
import 'package:cotwcastmate/widgets/section/section_tap.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

class WidgetSectionMenu extends WidgetSectionTap {
  final String _icon;

  const WidgetSectionMenu(
    super.text, {
    super.key,
    required String icon,
    required super.onTap,
  })  : _icon = icon,
        super(background: Interface.transparent);

  double get height => Values.menu;

  Widget _buildIcon() {
    return SimpleShadow(
      sigma: 5,
      offset: const Offset(-0.3, 0),
      child: WidgetIcon(
        _icon,
        color: Interface.primary,
      ),
    );
  }

  Widget _buildText() {
    return WidgetText(
      super.text,
      color: Interface.primaryLight,
      style: Style.normal.s16.w600,
    );
  }

  @override
  Widget buildCenter() {
    return SizedBox(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WidgetMargin.right(20, child: _buildIcon()),
          Expanded(child: _buildText()),
        ],
      ),
    );
  }
}
