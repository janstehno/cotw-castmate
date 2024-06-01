import 'dart:convert';

import 'package:cotwcastmate/generated/assets.gen.dart';
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
