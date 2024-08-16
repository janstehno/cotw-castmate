import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/miscellaneous/values.dart';
import 'package:cotwcastmate/widgets/app/padding.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:flutter/material.dart';

class WidgetSectionTap extends StatelessWidget {
  final String _text;
  final Color _background;
  final Function? _onTap;

  const WidgetSectionTap(
    String text, {
    super.key,
    required Color background,
    required Function? onTap,
  })  : _text = text,
        _background = background,
        _onTap = onTap;

  double get height => Values.section;

  String get text => _text;

  Color get background => _background;

  Function? get onTap => _onTap;

  Widget buildCenter() {
    return WidgetPadding.h30(
      background: _background,
      child: WidgetText(
        _text,
        color: Interface.primaryLight,
        style: Style.normal.s16.w400,
      ),
    );
  }

  Widget _buildWidgets() {
    return GestureDetector(
      onTap: () {
        if (_onTap != null) _onTap!();
      },
      child: Container(
        height: height,
        color: Interface.transparent,
        child: buildCenter(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
