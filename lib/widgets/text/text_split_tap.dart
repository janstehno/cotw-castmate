import 'package:cotwcastmate/widgets/text/text_split.dart';
import 'package:flutter/material.dart';

class WidgetTextSplitTap extends WidgetTextSplit {
  final Function _leftTap;
  final Function _rightTap;

  const WidgetTextSplitTap({
    super.key,
    required super.leftText,
    required super.rightText,
    required super.leftColor,
    required super.rightColor,
    required super.leftBackground,
    required super.rightBackground,
    required Function leftTap,
    required Function rightTap,
    super.split,
    super.forwardSlash,
  })  : _leftTap = leftTap,
        _rightTap = rightTap;

  @override
  Widget buildLeft() {
    return GestureDetector(
        onTap: () {
          _leftTap();
        },
        child: super.buildLeft());
  }

  @override
  Widget buildRight() {
    return GestureDetector(
        onTap: () {
          _rightTap();
        },
        child: super.buildRight());
  }
}
