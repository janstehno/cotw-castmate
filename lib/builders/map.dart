import 'package:cotwcastmate/activities/map.dart';
import 'package:cotwcastmate/builders/builder.dart';
import 'package:cotwcastmate/generated/assets.gen.dart';
import 'package:cotwcastmate/helpers/map.dart';
import 'package:cotwcastmate/model/translatables/reserve.dart';
import 'package:flutter/material.dart';

class BuilderMap extends BuilderBuilder {
  final Reserve _reserve;

  const BuilderMap({
    super.key,
    required Reserve reserve,
  })  : _reserve = reserve,
        super("M");

  Reserve get reserve => _reserve;

  @override
  State<StatefulWidget> createState() => BuilderMapState();
}

class BuilderMapState extends BuilderBuilderState {
  late final HelperMap _helperMap;

  final Map<String, String> _reserves = {
    "RESERVE:GOLDEN_RIDGE_RESERVE": Assets.raw.maps.goldenRidgeReserve,
    "RESERVE:TROLLSPORET_NATURE_RESERVE": Assets.raw.maps.trollsporetNatureReserve,
    "RESERVE:AGUAS_CLARAS_MUNICIPIO": Assets.raw.maps.aguasClarasMunicipio,
    "RESERVE:IZILO_ZASENDULO": Assets.raw.maps.iziloZasendulo,
  };

  @override
  void initState() {
    _helperMap = HelperMap(reserve: (widget as BuilderMap).reserve);
    super.initState();
  }

  @override
  void initializeData(AsyncSnapshot<Map<String, dynamic>> snapshot, BuildContext context) {
    Map<String, dynamic> mapObjects = snapshot.data!["mapObjects"] ?? {};
    _helperMap.addObjects(mapObjects);
  }

  @override
  Future<Map<String, dynamic>> loadData() async {
    Map<String, dynamic> mapObjects = await _helperMap.readMapObjects(_reserves[_helperMap.reserve.id]);
    updateProgress("mapObjects", mapObjects);
    return loadedData;
  }

  @override
  Widget buildFutureWidget(BuildContext context) => ActivityMap(helperMap: _helperMap);
}
