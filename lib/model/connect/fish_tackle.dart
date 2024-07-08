import 'dart:ui';

import 'package:cotwcastmate/interface/interface.dart';

abstract class FishTackle {
  final String _fish;
  final String _tackle;
  final int _strength;

  FishTackle({
    required String fish,
    required String tackle,
    required int strength,
  })  : _fish = fish,
        _tackle = tackle,
        _strength = strength;

  String get fish => _fish;

  String get tackle => _tackle;

  int get strength => _strength;

  Color get strengthColor {
    if (_strength == 3) return Interface.gold;
    if (_strength == 2) return Interface.silver;
    if (_strength == 1) return Interface.bronze;
    throw UnimplementedError();
  }

  static Comparator<FishTackle> sortByStrength = (a, b) => 0;
}
