import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/miscellaneous/values.dart';
import 'package:cotwcastmate/widgets/app/padding.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:flutter/material.dart';

class WidgetDropDownItem extends DropdownMenuItem {
  WidgetDropDownItem({
    super.key,
    required super.value,
    required String text,
  }) : super(child: _buildWidgets(text));

  static double get _height => Values.dropDown;

  static Widget _buildWidgets(String text) {
    return SizedBox(
      height: _height,
      child: WidgetPadding.h30(
        child: WidgetText(
          text,
          color: Interface.primaryLight,
          style: Style.normal.s16.w400,
        ),
      ),
    );
  }
}
