import 'package:collection/collection.dart';
import 'package:cotwcastmate/helpers/map.dart';
import 'package:cotwcastmate/model/map/map_location.dart';
import 'package:cotwcastmate/widgets/app/bar_app.dart';
import 'package:cotwcastmate/widgets/app/scaffold.dart';
import 'package:cotwcastmate/widgets/section/section_fish_tap.dart';
import 'package:cotwcastmate/widgets/section/section_location_tap.dart';
import 'package:cotwcastmate/widgets/title/title_tap.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DetailMap extends StatefulWidget {
  final HelperMap _helperMap;
  final Function _onTap;

  const DetailMap({
    super.key,
    required HelperMap helperMap,
    required Function onTap,
  })  : _helperMap = helperMap,
        _onTap = onTap;

  HelperMap get helperMap => _helperMap;

  Function get onTap => _onTap;

  @override
  DetailMapState createState() => DetailMapState();
}

class DetailMapState extends State<DetailMap> {
  Widget _buildLocation(int i, MapLocation location) {
    if (location.id.startsWith("FISH:")) {
      return WidgetSectionFishTap(
        tr(location.id),
        id: i,
        index: widget.helperMap.shownFishLocations.indexOf(location),
        location: location,
        positions: location.positions.length,
        shown: location.shown,
        onTap: () {
          setState(() {
            location.shown ? location.hide() : location.show();
          });
        },
      );
    }
    return WidgetSectionLocationTap(
      tr(location.id),
      id: i,
      location: location,
      positions: location.positions.length,
      shown: location.shown,
      onTap: () {
        setState(() {
          location.shown ? location.hide() : location.show();
        });
      },
    );
  }

  List<Widget> _listLocations(String sectionKey) {
    return widget.helperMap.objects[sectionKey]!
        .sorted(MapLocation.sortByType)
        .mapIndexed((i, e) => _buildLocation(i, e))
        .toList();
  }

  Widget _buildSection(String key) {
    return Column(
      children: [
        if (key == "UI:POPULATION")
          WidgetTitleTap(
            tr(key),
            subtext: tr("UI:POPULATION_LOCATION_SOURCE"),
            onTap: () {
              setState(() {
                widget.helperMap.activateAll(key);
              });
            },
          )
        else
          WidgetTitleTap(
            tr(key),
            onTap: () {
              setState(() {
                widget.helperMap.activateAll(key);
              });
            },
          ),
        ..._listLocations(key),
      ],
    );
  }

  List<Widget> _listSections() {
    return widget.helperMap.objects.keys.map((e) => _buildSection(e)).toList();
  }

  Widget _buildWidgets() {
    return WidgetScaffold(
      appBar: WidgetAppBar(
        widget.helperMap.reserve.name,
        context: context,
        onTap: widget.onTap,
      ),
      children: _listSections(),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
