import 'dart:convert';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:cotwcastmate/generated/assets.gen.dart';
import 'package:cotwcastmate/interface/values.dart';
import 'package:cotwcastmate/miscellaneous/enums.dart';
import 'package:cotwcastmate/model/connect/fish_bait.dart';
import 'package:cotwcastmate/model/connect/fish_hook.dart';
import 'package:cotwcastmate/model/connect/fish_lure.dart';
import 'package:cotwcastmate/model/connect/fish_reserve.dart';
import 'package:cotwcastmate/model/connect/fish_tackle.dart';
import 'package:cotwcastmate/model/hook.dart';
import 'package:cotwcastmate/model/translatables/bait.dart';
import 'package:cotwcastmate/model/translatables/fish.dart';
import 'package:cotwcastmate/model/translatables/habitat.dart';
import 'package:cotwcastmate/model/translatables/lure.dart';
import 'package:cotwcastmate/model/translatables/reserve.dart';
import 'package:cotwcastmate/model/translatables/trait.dart';
import 'package:flutter/services.dart' as root_bundle;

class HelperJSON {
  static final Set<Reserve> reserves = {};
  static final Set<Habitat> habitats = {};
  static final Set<Fish> fish = {};
  static final Set<Trait> traits = {};
  static final Set<Bait> baits = {};
  static final Set<Lure> lures = {};
  static final Set<Hook> hooks = {};
  static final Set<FishReserve> fishReserves = {};
  static final Set<FishBait> fishBaits = {};
  static final Set<FishLure> fishLures = {};
  static final Set<FishHook> fishHooks = {};

  static void setup(
    Set<Reserve> a,
    Set<Habitat> b,
    Set<Fish> c,
    Set<Trait> d,
    Set<Bait> e,
    Set<Lure> f,
    Set<Hook> g,
    Set<FishReserve> h,
    Set<FishBait> i,
    Set<FishLure> j,
    Set<FishHook> k,
  ) {
    _clearLists();
    reserves.addAll(a);
    habitats.addAll(b);
    fish.addAll(c);
    traits.addAll(d);
    baits.addAll(e);
    lures.addAll(f);
    hooks.addAll(g);
    fishReserves.addAll(h);
    fishBaits.addAll(i);
    fishLures.addAll(j);
    fishHooks.addAll(k);
  }

  static void _clearLists() {
    reserves.clear();
    habitats.clear();
    fish.clear();
    traits.clear();
    baits.clear();
    lures.clear();
    hooks.clear();
    fishReserves.clear();
    fishBaits.clear();
    fishLures.clear();
    fishHooks.clear();
  }

  static Reserve getReserve(String id) {
    try {
      return reserves.firstWhere((e) => e.id == id);
    } catch (e) {
      throw Exception("Reserve with ID: $id does not exist");
    }
  }

  static Set<Fish> getReserveFish(String id) {
    return fish.where((fish) => fishReserves.where((e) => e.reserve == id && e.fish == fish.id).isNotEmpty).toSet();
  }

  static Fish getFish(String id) {
    try {
      return fish.firstWhere((e) => e.id == id);
    } catch (e) {
      throw Exception("Fish with ID: $id does not exist");
    }
  }

  static Set<FishReserve> getFishReserves(String fishId) {
    return fishReserves.where((e) => e.fish == fishId).toSet();
  }

  static Set<FishHook> getFishHooks(String fishId) {
    return fishHooks.where((e) => e.fish == fishId).toSet();
  }

  static Set<FishBait> getFishBaits(String fishId) {
    return fishBaits.where((e) => e.fish == fishId).toSet();
  }

  static Set<FishLure> getFishLures(String fishId) {
    return fishLures.where((e) => e.fish == fishId).toSet();
  }

  static Set<FishTackle> _getFishTackles(String fishId, TackleType tackleType) {
    switch (tackleType) {
      case TackleType.bait:
        return getFishBaits(fishId);
      case TackleType.lure:
        return getFishLures(fishId);
    }
  }

  static Habitat getHabitat(String id) {
    try {
      return habitats.firstWhere((e) => e.id == id);
    } catch (e) {
      throw Exception("Habitat with ID: $id does not exist");
    }
  }

  static Trait getTrait(String id) {
    try {
      return traits.firstWhere((e) => e.id == id);
    } catch (e) {
      throw Exception("Trait with ID: $id does not exist");
    }
  }

  static Bait getBait(String id) {
    try {
      return baits.firstWhere((e) => e.id == id);
    } catch (e) {
      throw Exception("Bait with ID: $id does not exist");
    }
  }

  static Lure getLure(String id) {
    try {
      return lures.firstWhere((e) => e.id == id);
    } catch (e) {
      throw Exception("Lure with ID: $id does not exist");
    }
  }

  static Hook getHook(String id) {
    try {
      return hooks.firstWhere((e) => e.id == id);
    } catch (e) {
      throw Exception("Hook with ID: $id does not exist");
    }
  }

  static Future<Map<String, Map<String, double>>> getTackleEffectiveness(Fish fish, TackleType tackleType) async {
    Map<String, Map<String, double>> tackleEffectiveness = {};
    if (fish.isLegendary) return tackleEffectiveness;

    Set<FishReserve> fishReserves = getFishReserves(fish.id);
    for (FishReserve reserve in fishReserves) {
      Map<String, double> effectiveness = {};

      Set<Fish> reserveFish = _getFilteredReserveFish(fish, reserve);
      Set<FishTackle> tackles = _getFishTackles(fish.id, tackleType);

      for (FishTackle tackle in tackles) {
        Set<Fish> relevantFish = _getRelevantFishForTackle(reserveFish, tackle, tackleType);
        double totalEffectivenessWeight = _calculateTotalEffectivenessWeight(relevantFish, tackle, tackleType);
        effectiveness[tackle.tackle] = totalEffectivenessWeight;
      }

      if (effectiveness.values.length > 1) {
        double totalSum = effectiveness.values.reduce((a, b) => a + b);
        effectiveness.updateAll((key, value) => (value / totalSum) * 100);
      }

      tackleEffectiveness[reserve.reserve] = effectiveness;
    }

    return tackleEffectiveness;
  }

  static Set<Fish> _getFilteredReserveFish(Fish fish, FishReserve reserve) {
    Set<String> habitats = fish.habitats.map((e) => e.toString()).toSet();
    Set<Fish> reserveFish = HelperJSON.getReserveFish(reserve.reserve);
    reserveFish.removeWhere((e) => e.id == fish.id);
    reserveFish.removeWhere((e) {
      return e.habitats.where((h) => habitats.contains(h)).length < min(habitats.length, Values.commonHabitatCount);
    });

    Set<Hook> hooks = HelperJSON.getFishHooks(fish.id).map((e) => HelperJSON.getHook(e.hook)).toSet();
    reserveFish.removeWhere((e) {
      Set<Hook> fishHooks = HelperJSON.getFishHooks(e.id).map((e) => HelperJSON.getHook(e.hook)).toSet();
      int commonHookCount = fishHooks.where((e) => hooks.contains(e)).length;
      return commonHookCount < min(hooks.length, Values.commonHookCount);
    });

    return reserveFish;
  }

  static Set<Fish> _getRelevantFishForTackle(Set<Fish> reserveFish, FishTackle tackle, TackleType tackleType) {
    return reserveFish.where((fish) {
      switch (tackleType) {
        case TackleType.bait:
          return HelperJSON.getFishBaits(fish.id).any((fb) => fb.tackle == tackle.tackle);
        case TackleType.lure:
          return HelperJSON.getFishLures(fish.id).any((fb) => fb.tackle == tackle.tackle);
      }
    }).toSet();
  }

  static double _calculateTotalEffectivenessWeight(Set<Fish> relevantFish, FishTackle tackle, TackleType tackleType) {
    double totalEffectivenessWeight = 0;
    double defaultEffectivenessWeight = 1 / (relevantFish.length.toDouble() + 1);

    for (Fish fish in relevantFish) {
      FishTackle? fishTackle;
      switch (tackleType) {
        case TackleType.bait:
          fishTackle = HelperJSON.getFishBaits(fish.id).firstWhereOrNull((fb) => fb.tackle == tackle.tackle);
          break;
        case TackleType.lure:
          fishTackle = HelperJSON.getFishLures(fish.id).firstWhereOrNull((fb) => fb.tackle == tackle.tackle);
          break;
      }

      if (fishTackle == null) continue;

      double weight = defaultEffectivenessWeight;
      int strengthDifference = fishTackle.strength - tackle.strength;
      double change = defaultEffectivenessWeight * -(strengthDifference / 2);
      weight += change;
      totalEffectivenessWeight += weight;
    }

    return totalEffectivenessWeight;
  }

  static Future<String> getData(String name) async {
    final String content;
    content = await root_bundle.rootBundle.loadString(name);
    return content;
  }

  static Future<Set<Reserve>> readReserves() async {
    final data = await getData(Assets.raw.reserves);
    final list = json.decode(data) as List<dynamic>;
    return list.map((e) => Reserve.fromJson(e)).toSet();
  }

  static Future<Set<Habitat>> readHabitats() async {
    final data = await getData(Assets.raw.habitats);
    final list = json.decode(data) as List<dynamic>;
    return list.map((e) => Habitat.fromJson(e)).toSet();
  }

  static Future<Set<Fish>> readFish() async {
    final data = await getData(Assets.raw.fish);
    final list = json.decode(data) as List<dynamic>;
    return list.map((e) => Fish.fromJson(e)).toSet();
  }

  static Future<Set<Trait>> readTraits() async {
    final data = await getData(Assets.raw.traits);
    final list = json.decode(data) as List<dynamic>;
    return list.map((e) => Trait.fromJson(e)).toSet();
  }

  static Future<Set<Bait>> readBaits() async {
    final data = await getData(Assets.raw.baits);
    final list = json.decode(data) as List<dynamic>;
    return list.map((e) => Bait.fromJson(e)).toSet();
  }

  static Future<Set<Lure>> readLures() async {
    final data = await getData(Assets.raw.lures);
    final list = json.decode(data) as List<dynamic>;
    return list.map((e) => Lure.fromJson(e)).toSet();
  }

  static Future<Set<Hook>> readHooks() async {
    final data = await getData(Assets.raw.hooks);
    final list = json.decode(data) as List<dynamic>;
    return list.map((e) => Hook.fromJson(e)).toSet();
  }

  static Future<Set<FishReserve>> readFishReserves() async {
    final data = await getData(Assets.raw.fishReserves);
    final list = json.decode(data) as List<dynamic>;
    return list.map((e) => FishReserve.fromJson(e)).toSet();
  }

  static Future<Set<FishBait>> readFishBaits() async {
    final data = await getData(Assets.raw.fishBaits);
    final list = json.decode(data) as List<dynamic>;
    return list.map((e) => FishBait.fromJson(e)).toSet();
  }

  static Future<Set<FishLure>> readFishLures() async {
    final data = await getData(Assets.raw.fishLures);
    final list = json.decode(data) as List<dynamic>;
    return list.map((e) => FishLure.fromJson(e)).toSet();
  }

  static Future<Set<FishHook>> readFishHooks() async {
    final data = await getData(Assets.raw.fishHooks);
    final list = json.decode(data) as List<dynamic>;
    return list.map((e) => FishHook.fromJson(e)).toSet();
  }
}
