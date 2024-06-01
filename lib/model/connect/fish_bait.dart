import 'dart:ui';

import 'package:cotwcastmate/helpers/json.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/miscellaneous/enums.dart';

class FishBait {
  final String _fish;
  final String _bait;
  final int _strength;

  FishBait({
    required String fish,
    required String bait,
    required int strength,
  })  : _fish = fish,
        _bait = bait,
        _strength = strength;

  String get fish => _fish;

  String get bait => _bait;

  BaitType get type => HelperJSON.getBait(_bait).type;

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

  factory FishBait.fromJson(Map<String, dynamic> json) {
    return FishBait(
      fish: json["FISH"],
      bait: json["BAIT"],
      strength: json["STRENGTH"],
    );
  }

  static Comparator<FishBait> sortByStrength = (a, b) {
    return b.strength.compareTo(a.strength);
  };
}
