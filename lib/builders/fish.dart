import 'dart:async';

import 'package:cotwcastmate/activities/detail/fish.dart';
import 'package:cotwcastmate/builders/builder.dart';
import 'package:cotwcastmate/helpers/json.dart';
import 'package:cotwcastmate/interface/settings.dart';
import 'package:cotwcastmate/miscellaneous/enums.dart';
import 'package:cotwcastmate/model/translatables/fish.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuilderFish extends BuilderBuilder {
  final Fish _fish;

  const BuilderFish({
    super.key,
    required Fish fish,
  })  : _fish = fish,
        super("F");

  Fish get fish => _fish;

  @override
  State<StatefulWidget> createState() => BuilderFishState();
}

class BuilderFishState extends BuilderBuilderState {
  final Map<String, List<Map<String, double>>> _tackleEffectiveness = {};

  late final bool _tackleEffectivenessOff;

  @override
  void initState() {
    _tackleEffectivenessOff = !Provider.of<Settings>(context, listen: false).tackleEffectiveness;
    super.initState();
  }

  @override
  buildFutureWidget(BuildContext context) {
    return DetailFish(
      fish: (widget as BuilderFish).fish,
      tackleEffectiveness: _tackleEffectiveness,
    );
  }

  @override
  void initializeData(AsyncSnapshot<Map<String, dynamic>> snapshot, BuildContext context) {
    Map<String, Map<String, double>> fishBaitsEffectiveness = snapshot.data!["fishBaitsEffectiveness"] ?? {};
    Map<String, Map<String, double>> fishLuresEffectiveness = snapshot.data!["fishLuresEffectiveness"] ?? {};

    if (fishBaitsEffectiveness.isNotEmpty) {
      for (String key in fishBaitsEffectiveness.keys) {
        _tackleEffectiveness[key] = [];
        _tackleEffectiveness[key]!.add(fishBaitsEffectiveness[key]!);
        if (fishLuresEffectiveness.isNotEmpty) _tackleEffectiveness[key]!.add(fishLuresEffectiveness[key]!);
      }
    } else if (fishLuresEffectiveness.isNotEmpty) {
      for (String key in fishBaitsEffectiveness.keys) {
        _tackleEffectiveness[key] = [];
        _tackleEffectiveness[key]!.add(fishLuresEffectiveness[key]!);
      }
    }
  }

  @override
  Future<Map<String, dynamic>> loadData() async {
    if (_tackleEffectivenessOff || (widget as BuilderFish).fish.isLegendary) return {};

    Map<String, Map<String, double>> fishBaitsEffectiveness =
        await HelperJSON.getTackleEffectiveness((widget as BuilderFish).fish, TackleType.bait);
    updateProgress("fishBaitsEffectiveness", fishBaitsEffectiveness);
    Map<String, Map<String, double>> fishLuresEffectiveness =
        await HelperJSON.getTackleEffectiveness((widget as BuilderFish).fish, TackleType.lure);
    updateProgress("fishLuresEffectiveness", fishLuresEffectiveness);

    return loadedData;
  }
}
