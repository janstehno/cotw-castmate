import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/miscellaneous/values.dart';
import 'package:cotwcastmate/widgets/app/margin.dart';
import 'package:cotwcastmate/widgets/app/padding.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:flutter/material.dart';

class WidgetTitle extends StatelessWidget {
  final String _text;
  final String _subtext;

  const WidgetTitle(
    String text, {
    super.key,
    String subtext = "",
    bool upperCase = true,
  })  : _text = text,
        _subtext = subtext;

  double get height => Values.title;

  Color get background => Interface.title;

  Widget _buildText() {
    if (_subtext.isEmpty) {
      return WidgetText(
        _text.toUpperCase(),
        color: Interface.primaryLight,
        style: Style.normal.s20.w600,
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetText(
          _text.toUpperCase(),
          color: Interface.primaryLight,
          style: Style.normal.s20.w600,
        ),
        WidgetText(
          _subtext,
          color: Interface.disabled,
          style: Style.normal.s12.w400,
        )
      ],
    );
  }

  Widget buildWidgets() {
    return SizedBox(
      height: height,
      child: WidgetPadding.h30(
        background: background,
        child: Row(
          children: [
            Expanded(child: WidgetMargin.right(30, child: _buildText())),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => buildWidgets();
}
