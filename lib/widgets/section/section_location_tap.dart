import 'package:cotwcastmate/interface/graphics.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/miscellaneous/utils.dart';
import 'package:cotwcastmate/model/map/map_location.dart';
import 'package:cotwcastmate/widgets/app/padding.dart';
import 'package:cotwcastmate/widgets/icon/icon.dart';
import 'package:cotwcastmate/widgets/section/section_tap.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:flutter/material.dart';

class WidgetSectionLocationTap extends WidgetSectionTap {
  final MapLocation _location;
  final int _positions;
  final bool _shown;

  WidgetSectionLocationTap(
    super.text, {
    super.key,
    required super.onTap,
    required int id,
    required MapLocation location,
    required int positions,
    required bool shown,
  })  : _location = location,
        _positions = positions,
        _shown = shown,
        super(background: Utils.backgroundAt(id));

  MapLocation get location => _location;

  bool get shown => _shown;

  Widget buildIcon() {
    return _shown
        ? WidgetIcon(Graphics.getLocation(_location.id))
        : WidgetIcon(Graphics.getLocation(_location.id), color: Interface.disabled);
  }

  @override
  Widget buildCenter() {
    return WidgetPadding.h30(
      background: background,
      child: Row(
        children: [
          Expanded(
            child: WidgetText(
              text,
              color: Interface.primaryLight,
              style: Style.normal.s16.w400,
            ),
          ),
          WidgetText(
            _positions.toString(),
            color: Interface.disabled,
            style: Style.normal.s12.w400i,
          ),
          const SizedBox(width: 20),
          buildIcon(),
        ],
      ),
    );
  }

  Widget _buildWidgets() {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!();
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
