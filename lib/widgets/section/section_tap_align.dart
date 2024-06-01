import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/widgets/app/padding.dart';
import 'package:cotwcastmate/widgets/indicator/indicator.dart';
import 'package:cotwcastmate/widgets/section/section_tap.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:flutter/material.dart';

class WidgetSectionTapAlign extends WidgetSectionTap {
  final bool _indicatorRight;
  final bool _active;

  const WidgetSectionTapAlign(
    super.text, {
    super.key,
    bool indicatorRight = true,
    required bool active,
    required super.onTap,
  })  : _indicatorRight = indicatorRight,
        _active = active,
        super(background: Interface.transparent);

  Widget _buildText() {
    return Container(
      margin: EdgeInsets.only(left: _indicatorRight ? 0 : 15, right: _indicatorRight ? 15 : 0),
      child: WidgetText(
        super.text,
        color: Interface.primaryLight,
        style: Style.normal.s16.w400,
        textAlign: _indicatorRight ? TextAlign.end : TextAlign.start,
      ),
    );
  }

  @override
  Widget buildCenter() {
    return WidgetPadding.h30(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: _indicatorRight ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (_indicatorRight) Expanded(child: _buildText()),
          WidgetIndicator(active: _active),
          if (!_indicatorRight) Expanded(child: _buildText()),
        ],
      ),
    );
  }
}
