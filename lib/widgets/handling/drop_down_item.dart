import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/miscellaneous/values.dart';
import 'package:cotwcastmate/widgets/app/padding.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:flutter/material.dart';

class WidgetDropDownItem extends StatelessWidget {
  final String _text;
  final String? _subtext;

  const WidgetDropDownItem({
    super.key,
    required String text,
    String? subtext,
  })  : _text = text,
        _subtext = subtext;

  double get _height => Values.dropDown;

  Widget _buildSubtext() {
    return WidgetText(
      _subtext!,
      color: Interface.disabled,
      style: Style.normal.s16.w400i,
    );
  }

  Widget _buildText() {
    return WidgetText(
      _text,
      color: Interface.primaryLight,
      style: Style.normal.s16.w400,
    );
  }

  Widget buildCenter() {
    return Row(
      children: [
        Expanded(child: _buildText()),
        if (_subtext != null) ...[
          SizedBox(width: 15),
          _buildSubtext(),
        ],
      ],
    );
  }

  Widget _buildWidgets() {
    return SizedBox(
      height: _height,
      child: WidgetPadding.h30(
        background: Interface.transparent,
        child: buildCenter(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
