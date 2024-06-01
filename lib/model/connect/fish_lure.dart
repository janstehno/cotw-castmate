import 'package:cotwcastmate/helpers/json.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/model/translatables/lure.dart';
import 'package:flutter/material.dart';

class FishLure {
  final String _fish;
  final String _lure;
  final int _strength;

  FishLure({
    required String fish,
    required String lure,
    required int strength,
  })  : _fish = fish,
        _lure = lure,
        _strength = strength;

  String get fish => _fish;

  String get lure => _lure;

  int get strength => _strength;

  Color strengthColor() {
    switch (_strength) {
      case 1:
        return Interface.bronze;
      case 2:
        return Interface.silver;
      case 3:
        return Interface.gold;
      default:
        throw UnimplementedError();
    }
  }

  factory FishLure.fromJson(Map<String, dynamic> json) {
    return FishLure(
      fish: json["FISH"],
      lure: json["LURE"],
      strength: json["STRENGTH"],
    );
  }

  static Comparator<FishLure> sortByStrength = (a, b) {
    return b.strength.compareTo(a.strength);
  };

  static Comparator<FishLure> sortByTechniqueStrength = (a, b) {
    Lure s = HelperJSON.getLure(a.lure);
    Lure t = HelperJSON.getLure(b.lure);

    if (a.strength == b.strength) return t.techniqueCount.compareTo(s.techniqueCount);
    return b.strength.compareTo(a.strength);
  };
}
