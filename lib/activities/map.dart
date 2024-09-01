import 'package:cotwcastmate/activities/detail/map.dart';
import 'package:cotwcastmate/helpers/map.dart';
import 'package:cotwcastmate/interface/graphics.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/miscellaneous/projection.dart';
import 'package:cotwcastmate/miscellaneous/values.dart';
import 'package:cotwcastmate/model/map/map_location.dart';
import 'package:cotwcastmate/model/map/map_position.dart';
import 'package:cotwcastmate/widgets/maps/marker.dart';
import 'package:cotwcastmate/widgets/maps/marker_fish.dart';
import 'package:cotwcastmate/widgets/text/text_split_tap.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';

class ActivityMap extends StatefulWidget {
  final HelperMap _helperMap;

  const ActivityMap({
    super.key,
    required HelperMap helperMap,
  }) : _helperMap = helperMap;

  HelperMap get helperMap => _helperMap;

  @override
  ActivityMapState createState() => ActivityMapState();
}

class ActivityMapState extends State<ActivityMap> {
  final double _minZoom = 1;
  final double _maxZoom = 3;
  final double _zoomSpeed = 0.02;
  final MapController _mapController = MapController(
    zoom: 1,
    location: LatLng.degree(0, 0),
    projection: const MapProjection(),
  );

  late MapTransformer _mapTransformer;
  late double _tileSize;

  Offset? _dragStart;
  double _scaleStart = 1.0;
  double _centerLatEnd = LatLng.degree(0, 0).latitude.degrees;
  double _centerLngEnd = LatLng.degree(0, 0).longitude.degrees;
  double _screenWidth = 0;
  double _screenHeight = 0;
  double _locationMarkerSize = 23;
  double _locationFishMarkerSize = 35;

  bool _render = true;

  @override
  void reassemble() {
    widget.helperMap.resetObjects();
    super.reassemble();
  }

  void _getScreenSize() {
    Size size = MediaQuery.of(context).size;
    _screenWidth = size.width;
    _screenHeight = size.height - Values.split;
  }

  void _getTileSize(Orientation orientation) {
    _tileSize = (orientation == Orientation.portrait ? _screenHeight : _screenWidth) / 4;
  }

  double _clamp(double x, double min, double max) {
    if (x < min) x = min;
    if (x > max) x = max;
    return x;
  }

  bool _inView(Offset offset, double width, double height) {
    double left = offset.dx - (width / 2);
    double right = offset.dx + (width / 2);
    double top = offset.dy - (height / 2);
    double bottom = offset.dy + (height / 2);
    if ((right >= 0 && left <= _screenWidth) && (bottom >= 0 && top <= _screenHeight)) return true;
    return false;
  }

  void _values(double zoom) {
    if (zoom >= 1) {
      _locationMarkerSize = 23;
      _locationFishMarkerSize = 30;
    }
    if (zoom > 1.666) {
      _locationMarkerSize = 21.5;
      _locationFishMarkerSize = 28;
    }
    if (zoom > 2.333) {
      _locationMarkerSize = 20;
      _locationFishMarkerSize = 26;
    }
  }

  void _onScaleStart(ScaleStartDetails details) {
    setState(() {
      _dragStart = details.focalPoint;
      _scaleStart = 1.0;
      _render = false;
    });
  }

  void _onScaleEnd() {
    setState(() {
      _render = true;
    });
  }

  void _onScaleMove(details) {
    final scaleDiff = details.scale - _scaleStart;
    _scaleStart = details.scale;
    _values(_mapController.zoom);

    if (scaleDiff > 0) {
      setState(() {
        _mapController.zoom = _clamp(_mapController.zoom + _zoomSpeed, _minZoom, _maxZoom);
      });
    } else if (scaleDiff < 0) {
      setState(() {
        _mapController.zoom = _clamp(_mapController.zoom - _zoomSpeed, _minZoom, _maxZoom);
      });
    } else {
      final now = details.focalPoint;
      final diff = now - _dragStart!;
      setState(() {
        _dragStart = now;
        _mapTransformer.drag(diff.dx, diff.dy);
      });
    }
  }

  void _onScaleBorder() {
    if (_mapTransformer.toOffset(LatLng.degree(_mapController.center.latitude.degrees, -360)).dx > 0) {
      double y = _centerLngEnd + (-360 - _mapTransformer.toLatLng(const Offset(0, 0)).longitude.degrees);
      y = y > 0 ? 0 : y;
      _mapController.center = LatLng.degree(_mapController.center.latitude.degrees, y);
    }
    if (_mapTransformer.toOffset(LatLng.degree(_mapController.center.latitude.degrees, 360)).dx < _screenWidth) {
      double y = _centerLngEnd + (360 - _mapTransformer.toLatLng(Offset(_screenWidth, 0)).longitude.degrees);
      y = y < 0 ? 0 : y;
      _mapController.center = LatLng.degree(_mapController.center.latitude.degrees, y);
    }
    if (_mapTransformer.toOffset(LatLng.degree(-360, _mapController.center.longitude.degrees)).dy > 0) {
      double x = _centerLatEnd + (-360 - _mapTransformer.toLatLng(const Offset(0, 0)).latitude.degrees);
      x = x > 0 ? 0 : x;
      _mapController.center = LatLng.degree(x, _mapController.center.longitude.degrees);
    }
    if (_mapTransformer.toOffset(LatLng.degree(360, _mapController.center.longitude.degrees)).dy < _screenHeight) {
      double x = _centerLatEnd + (360 - _mapTransformer.toLatLng(Offset(0, _screenHeight)).latitude.degrees);
      x = x < 0 ? 0 : x;
      _mapController.center = LatLng.degree(x, _mapController.center.longitude.degrees);
    }
    _centerLatEnd = _mapController.center.latitude.degrees;
    _centerLngEnd = _mapController.center.longitude.degrees;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    _onScaleMove(details);
    _onScaleBorder();
  }

  Widget _buildTileLayer() {
    return TileLayer(builder: (context, x, y, z) {
      if ((z == 1 && (x >= -1 && y >= -1 && x <= 2 && y <= 2)) ||
          (z == 2 && (x >= -2 && y >= -2 && x <= 5 && y <= 5)) ||
          (z == 3 && (x >= -4 && y >= -4 && x <= 11 && y <= 11))) {
        return Image.asset(
          Graphics.getTile(widget.helperMap.reserve.region, x, y, z),
          fit: BoxFit.fitWidth,
        );
      }
      return const SizedBox.shrink();
    });
  }

  Widget _buildLocations() {
    return FutureBuilder<List<Widget>>(
      future: _listLocations(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.hasError ||
            !snapshot.hasData ||
            snapshot.data!.isEmpty) {
          return const SizedBox.shrink();
        } else {
          return Stack(fit: StackFit.expand, children: snapshot.data!);
        }
      },
    );
  }

  Future<List<Widget>> _listLocations() async {
    List<Widget> locations = [];
    for (MapLocation location in widget.helperMap.shownLocations) {
      locations.addAll(location.positions.map((e) => _buildLocation(location, e)));
    }
    return locations;
  }

  Widget _buildLocation(MapLocation mapLocation, MapPosition mapPosition) {
    Offset offset = _mapTransformer.toOffset(mapPosition.coordinates);
    if (_inView(offset, _locationMarkerSize, _locationMarkerSize)) {
      if (mapLocation.id.startsWith("FISH:")) {
        List<MapLocation> shownFishLocations = widget.helperMap.shownFishLocations;
        int id = shownFishLocations.indexOf(mapLocation);
        return WidgetMarkerFish(
          mapPosition,
          id: mapLocation.id,
          color: Interface.mapColors[id],
          offset: offset.translate(0, (id.toDouble() / 2) - shownFishLocations.length / 3),
          size: _locationFishMarkerSize,
        );
      }
      return WidgetMarker(
        mapPosition,
        id: mapLocation.id,
        offset: offset,
        size: _locationMarkerSize,
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildMap(Orientation orientation) {
    return MapLayout(
      tileSize: _tileSize.toInt() + 1,
      controller: _mapController,
      builder: (context, transformer) {
        _mapTransformer = transformer;
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onScaleStart: (details) => _onScaleStart(details),
          onScaleUpdate: (details) => _onScaleUpdate(details),
          onScaleEnd: (details) => _onScaleEnd(),
          child: Stack(
            children: [
              _buildTileLayer(),
              Container(color: Interface.primaryDark.withOpacity(0.2)),
              if (_render) _buildLocations(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMenu() {
    return SizedBox(
      width: _screenWidth,
      child: WidgetTextSplitTap(
        split: 0.3,
        forwardSlash: false,
        leftText: tr("UI:BACK"),
        rightText: tr("UI:FILTER"),
        leftColor: Interface.primaryDark,
        rightColor: Interface.primaryLight,
        leftBackground: Interface.primaryAccent,
        rightBackground: Interface.primaryDark,
        leftTap: () => Navigator.pop(context),
        rightTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailMap(
                helperMap: widget.helperMap,
                onTap: () => setState(() {}),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildWidgets() {
    Orientation orientation = MediaQuery.of(context).orientation;
    _getScreenSize();
    _getTileSize(orientation);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Interface.primaryDark,
        child: Column(
          children: [
            Expanded(child: _buildMap(orientation)),
            _buildMenu(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
