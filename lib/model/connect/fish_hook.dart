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

  Color hookColor() {
    switch (_trophy) {
      case 5:
        return Interface.legendary;
      case 4:
        return Interface.diamond;
      case 3:
        return Interface.gold;
      case 2:
        return Interface.silver;
      case 1:
        return Interface.bronze;
      default:
        throw UnimplementedError();
    }
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
