import 'package:cotwcastmate/model/map/map_position.dart';
import 'package:easy_localization/easy_localization.dart';

class MapLocation {
  final String _id;
  final Set<MapPosition> _positions;

  bool _shown;

  MapLocation({
    required String type,
    required Set<MapPosition>? positions,
  })  : _id = type,
        _positions = positions ?? {},
        _shown = false;

  String get id => _id;

  Set<MapPosition> get positions => _positions;

  bool get shown => _shown;

  void show() => _shown = true;

  void hide() => _shown = false;

  static Comparator<MapLocation> sortByType = (a, b) {
    return tr(a.id).compareTo(tr(b.id));
  };
}
