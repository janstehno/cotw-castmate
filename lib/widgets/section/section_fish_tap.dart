import 'dart:ui';

import 'package:cotwcastmate/interface/graphics.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/miscellaneous/values.dart';
import 'package:cotwcastmate/widgets/section/section_location_tap.dart';
import 'package:flutter/material.dart';

class WidgetSectionFishTap extends WidgetSectionLocationTap {
  final int _index;

  WidgetSectionFishTap(
    super.text, {
    super.key,
    required super.onTap,
    required super.id,
    required int index,
    required super.location,
    required super.positions,
    required super.shown,
  }) : _index = index;

  @override
  Widget buildIcon() {
    return SizedBox(
      width: Values.iconSize * 1.5,
      child: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.dilate(radiusX: 0.5, radiusY: 0.5),
            child: Image.asset(
              Graphics.getFish(location.id),
              fit: BoxFit.fitWidth,
              alignment: Alignment.center,
              color: shown ? Interface.primaryDark : Interface.disabled,
            ),
          ),
          Image.asset(
            Graphics.getFish(location.id),
            fit: BoxFit.fitWidth,
            alignment: Alignment.center,
            color: shown ? Interface.mapColors[_index] : Interface.disabled,
          ),
        ],
      ),
    );
  }
}
