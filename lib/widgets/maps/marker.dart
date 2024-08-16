import 'package:cotwcastmate/interface/graphics.dart';
import 'package:cotwcastmate/miscellaneous/enums.dart';
import 'package:cotwcastmate/model/map/map_position.dart';
import 'package:cotwcastmate/widgets/app/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WidgetMarker extends StatelessWidget {
  final String _id;
  final MapPosition _position;
  final Offset _offset;
  final double _size;

  const WidgetMarker(
    MapPosition position, {
    super.key,
    required String id,
    required Offset offset,
    required double size,
  })  : _position = position,
        _id = id,
        _offset = offset,
        _size = size;

  MapPosition get position => _position;

  String get id => _id;

  Offset get offset => _offset;

  double get size => _size;

  Widget buildIcon() {
    if (position.type == LocationType.scavengerHunt && position.hasData) {
      return SvgPicture.asset(
        Graphics.getLocation("${position.type.name.toUpperCase()}_${position.data}"),
        fit: BoxFit.fitWidth,
        alignment: Alignment.center,
      );
    }
    return SvgPicture.asset(
      Graphics.getLocation(id),
      fit: BoxFit.fitWidth,
      alignment: Alignment.center,
    );
  }

  Widget _buildWidgets() {
    return Positioned(
      width: _size,
      height: _size,
      left: _offset.dx - (_size / 2),
      top: _offset.dy - (_size / 2),
      child: WidgetPadding.all(2, child: buildIcon()),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
