import 'dart:convert';

import 'package:cotwcastmate/helpers/json.dart';
import 'package:cotwcastmate/miscellaneous/enums.dart';
import 'package:cotwcastmate/model/map/map_location.dart';
import 'package:cotwcastmate/model/map/map_position.dart';
import 'package:cotwcastmate/model/translatables/reserve.dart';

class HelperMap {
  final Map<String, List<MapLocation>> _objects = {};

  final Reserve _reserve;

  HelperMap({
    required reserve,
  }) : _reserve = reserve;

  Reserve get reserve => _reserve;

  Map<String, List<MapLocation>> get objects => _objects;

  List<MapLocation> get shownLocations {
    List<MapLocation> shownLocations = [];
    for (MapEntry entry in _objects.entries) {
      List<MapLocation> locations = entry.value;
      shownLocations.addAll(locations.where((e) => e.shown));
    }
    return shownLocations;
  }

  List<MapLocation> get shownFishLocations {
    List<MapLocation> shownLocations = [];
    for (MapLocation location in _objects["UI:FISH"]!) {
      if (location.shown) shownLocations.add(location);
    }
    return shownLocations;
  }

  void activateAll(String sectionKey) {
    int active = 0;
    List<MapLocation> locations = objects[sectionKey]!;
    for (MapLocation location in locations) {
      if (location.shown) active++;
    }
    for (MapLocation location in locations) {
      if (active == locations.length) {
        location.hide();
      } else {
        location.show();
      }
    }
  }

  Future<Map<String, dynamic>> readMapObjects(String? asset) async {
    if (asset == null) return {};
    try {
      final data = await HelperJSON.getData(asset);
      final Map<String, dynamic> mapObjects = Map.castFrom(json.decode(data));
      return mapObjects;
    } catch (e) {
      return {};
    }
  }

  void addObjects(Map<String, dynamic> objects) {
    _objects.clear();
    for (String groupKey in objects.keys) {
      Set<MapLocation> groups = {};
      for (String locationKey in objects[groupKey]!.keys) {
        Set<MapPosition> positions = {};
        for (List<dynamic> c in objects[groupKey]![locationKey]) {
          LocationType type = LocationType.values
              .firstWhere((e) => e.name.toLowerCase() == (groupKey.split(":")[1]).replaceAll("_", "").toLowerCase());
          MapPosition position = MapPosition(x: c[0], y: c[1], type: type);
          if (c.length == 3) position.setData(c[2]);
          positions.add(position);
        }
        groups.add(MapLocation(type: locationKey, positions: positions));
      }
      _objects.putIfAbsent(groupKey, () => groups.toList());
    }
  }

  void resetObjects() {
    for (String groupKey in _objects.keys) {
      for (MapLocation location in _objects[groupKey]!) {
        location.hide();
      }
    }
  }
}
