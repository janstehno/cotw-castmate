import 'package:cotwcastmate/generated/assets.gen.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/miscellaneous/values.dart';
import 'package:cotwcastmate/widgets/icon/icon.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:flutter/material.dart';

class WidgetAppBar extends StatelessWidget {
  final String _text;
  final String? _icon;
  final int _maxLines;
  final Function? _onTap;
  final BuildContext _context;

  const WidgetAppBar(
    String text, {
    super.key,
    String? icon,
    int maxLines = 2,
    Function? onTap,
    required BuildContext context,
  })  : _text = text,
        _icon = icon,
        _maxLines = maxLines,
        _onTap = onTap,
        _context = context;

  double get _height => Values.appBar;

  String get _actualIcon => _icon ?? Assets.graphics.icons.back;

  Widget _buildBack() {
    return WidgetIcon(
      _actualIcon,
      color: Interface.primaryDark,
    );
  }

  Widget _buildLeft() {
    return GestureDetector(
      onTap: () {
        if (_onTap != null) {
          _onTap!();
        } else {
          Navigator.pop(_context);
        }
      },
      child: Container(
        width: 80,
        height: _height,
        color: Interface.transparent,
        alignment: Alignment.center,
        child: _buildBack(),
      ),
    );
  }

  Widget _buildText() {
    return WidgetText(
      _text.toUpperCase(),
      color: Interface.primaryDark,
      style: Style.normal.s24.w800,
      maxLines: _maxLines,
      textAlign: TextAlign.right,
    );
  }

  Widget _buildRight() {
    return Container(
      height: _height,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 30),
      child: _buildText(),
    );
  }

  Widget _buildWidgets() {
    return Container(
      color: Interface.primaryAccent,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildLeft(),
          Expanded(child: _buildRight()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
