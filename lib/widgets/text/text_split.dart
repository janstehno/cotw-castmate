import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/miscellaneous/values.dart';
import 'package:cotwcastmate/widgets/app/padding.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';

class WidgetTextSplit extends StatelessWidget {
  final String _leftText;
  final String _rightText;
  final Color _leftColor;
  final Color _rightColor;
  final Color _leftBackground;
  final Color _rightBackground;
  final double _split;
  final bool _forwardSlash;

  const WidgetTextSplit({
    super.key,
    required String leftText,
    required String rightText,
    required Color leftColor,
    required Color rightColor,
    required Color leftBackground,
    required Color rightBackground,
    double? split,
    bool? forwardSlash,
  })  : _leftText = leftText,
        _rightText = rightText,
        _leftColor = leftColor,
        _rightColor = rightColor,
        _leftBackground = leftBackground,
        _rightBackground = rightBackground,
        _split = split ?? 0.5,
        _forwardSlash = forwardSlash ?? true;

  double get _angle => _forwardSlash ? -150 : -30;

  Widget buildLeft() {
    return WidgetPadding.h30(
      alignment: Alignment.centerLeft,
      background: Interface.transparent,
      child: WidgetText(
        _leftText.toUpperCase(),
        color: _leftColor,
        style: Style.condensed.s14,
      ),
    );
  }

  Widget buildRight() {
    return WidgetPadding.h30(
      alignment: Alignment.centerRight,
      background: Interface.transparent,
      child: WidgetText(
        _rightText.toUpperCase(),
        color: _rightColor,
        style: Style.condensed.s14,
      ),
    );
  }

  Widget _buildWidgets() {
    return Container(
      height: Values.split,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [_leftBackground, _rightBackground],
          stops: _forwardSlash ? [1 - _split, 1 - _split] : [_split, _split],
          transform: GradientRotation(Angle.degree(_angle).radians),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: (_split * 10).toInt(),
            child: buildLeft(),
          ),
          Flexible(
            flex: ((1 - _split) * 10).toInt(),
            child: buildRight(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
