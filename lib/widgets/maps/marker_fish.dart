import 'dart:ui';

import 'package:cotwcastmate/interface/graphics.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/widgets/maps/marker.dart';
import 'package:flutter/material.dart';

class WidgetMarkerFish extends WidgetMarker {
  final Color _color;

  const WidgetMarkerFish(
    super.location, {
    super.key,
    required Color color,
    required super.id,
    required super.offset,
    required super.size,
  }) : _color = color;

  @override
  Widget buildIcon() {
    return Stack(
      children: [
        ImageFiltered(
          imageFilter: ImageFilter.dilate(radiusX: 0.5, radiusY: 0.5),
          child: Image.asset(
            Graphics.getFish(id),
            fit: BoxFit.fitWidth,
            alignment: Alignment.center,
            color: Interface.primaryDark,
          ),
        ),
        Image.asset(
          Graphics.getFish(id),
          fit: BoxFit.fitWidth,
          alignment: Alignment.center,
          color: _color,
        ),
      ],
    );
  }
}
