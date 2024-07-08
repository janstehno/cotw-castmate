import 'package:cotwcastmate/interface/interface.dart';
import 'package:flutter/material.dart';

class FishHook {
  final String _fish;
  final String _hook;
  final int _trophy;

  FishHook({
    required String fish,
    required String hook,
    required int trophy,
  })  : _fish = fish,
        _hook = hook,
        _trophy = trophy;

  String get fish => _fish;

  String get hook => _hook;

  int get trophy => _trophy;

  bool get isGold => _trophy == 3;

  Color hookColor() {
    if (trophy == 0) return Interface.juvenile;
    if (trophy == 1) return Interface.bronze;
    if (trophy == 2) return Interface.silver;
    if (trophy == 3) return Interface.gold;
    if (trophy == 4) return Interface.diamond;
    if (trophy == 5) return Interface.legendary;
    throw UnimplementedError();
  }

  factory FishHook.fromJson(Map<String, dynamic> json) {
    return FishHook(
      fish: json["FISH"],
      hook: json["HOOK"],
      trophy: json["TROPHY"],
    );
  }

  static Comparator<FishHook> sortByHook = (a, b) {
    return a.hook.compareTo(b.hook);
  };
}
