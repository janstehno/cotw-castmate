import 'package:cotwcastmate/miscellaneous/enums.dart';
import 'package:latlng/latlng.dart';

class MapPosition {
  final double _x;
  final double _y;
  final LocationType _type;
  String _data;

  MapPosition({
    required double x,
    required double y,
    required LocationType type,
    String? data,
  })  : _x = x,
        _y = y,
        _type = type,
        _data = data ?? "";

  double get x => _x;

  double get y => _y;

  LocationType get type => _type;

  bool get hasData => _data.isNotEmpty;

  String get data => _data;

  LatLng get coordinates => toLatLng(_x, _y);

  void setData(String data) => _data = data;

  static LatLng toLatLng(double x, double y) => LatLng.degree((y * 720) - 360, (x * 720) - 360);
}
