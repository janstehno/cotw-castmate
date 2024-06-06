import 'dart:async';

import 'package:cotwcastmate/activities/home.dart';
import 'package:cotwcastmate/builders/builder.dart';
import 'package:cotwcastmate/helpers/json.dart';
import 'package:cotwcastmate/model/connect/fish_bait.dart';
import 'package:cotwcastmate/model/connect/fish_hook.dart';
import 'package:cotwcastmate/model/connect/fish_lure.dart';
import 'package:cotwcastmate/model/connect/fish_reserve.dart';
import 'package:cotwcastmate/model/hook.dart';
import 'package:cotwcastmate/model/translatables/bait.dart';
import 'package:cotwcastmate/model/translatables/fish.dart';
import 'package:cotwcastmate/model/translatables/habitat.dart';
import 'package:cotwcastmate/model/translatables/lure.dart';
import 'package:cotwcastmate/model/translatables/reserve.dart';
import 'package:cotwcastmate/model/translatables/trait.dart';
import 'package:flutter/material.dart';

class BuilderHome extends BuilderBuilder {
  const BuilderHome({
    super.key,
  }) : super("H");

  @override
  State<StatefulWidget> createState() => BuilderHomeState();
}

class BuilderHomeState extends BuilderBuilderState {
  @override
  buildFutureWidget(BuildContext context) => const ActivityHome();

  @override
  void initializeData(AsyncSnapshot<Map<String, dynamic>> snapshot, BuildContext context) {
    Set<Reserve> reserves = snapshot.data!["reserves"] ?? [];
    Set<Habitat> habitats = snapshot.data!["habitats"] ?? [];
    Set<Fish> fish = snapshot.data!["fish"] ?? [];
    Set<Trait> traits = snapshot.data!["traits"] ?? [];
    Set<Bait> baits = snapshot.data!["baits"] ?? [];
    Set<Lure> lures = snapshot.data!["lures"] ?? [];
    Set<Hook> hooks = snapshot.data!["hooks"] ?? [];
    Set<FishReserve> fishReserves = snapshot.data!["fishReserves"] ?? [];
    Set<FishBait> fishBaits = snapshot.data!["fishBaits"] ?? [];
    Set<FishLure> fishLures = snapshot.data!["fishLures"] ?? [];
    Set<FishHook> fishHooks = snapshot.data!["fishHooks"] ?? [];
    HelperJSON.setup(
      reserves,
      habitats,
      fish,
      traits,
      baits,
      lures,
      hooks,
      fishReserves,
      fishBaits,
      fishLures,
      fishHooks,
    );
  }

  @override
  Future<Map<String, dynamic>> loadData() async {
    Set<Reserve> reserves = await HelperJSON.readReserves();
    updateProgress("reserves", reserves);
    Set<Habitat> habitats = await HelperJSON.readHabitats();
    updateProgress("habitats", habitats);
    Set<Fish> fish = await HelperJSON.readFish();
    updateProgress("fish", fish);
    Set<Trait> traits = await HelperJSON.readTraits();
    updateProgress("traits", traits);
    Set<Bait> baits = await HelperJSON.readBaits();
    updateProgress("baits", baits);
    Set<Lure> lures = await HelperJSON.readLures();
    updateProgress("lures", lures);
    Set<Hook> hooks = await HelperJSON.readHooks();
    updateProgress("hooks", hooks);
    Set<FishReserve> fishReserves = await HelperJSON.readFishReserves();
    updateProgress("fishReserves", fishReserves);
    Set<FishBait> fishBaits = await HelperJSON.readFishBaits();
    updateProgress("fishBaits", fishBaits);
    Set<FishLure> fishLures = await HelperJSON.readFishLures();
    updateProgress("fishLures", fishLures);
    Set<FishHook> fishHooks = await HelperJSON.readFishHooks();
    updateProgress("fishHooks", fishHooks);

    await Future.delayed(const Duration(seconds: 1), () {});
    return loadedData;
  }
}
