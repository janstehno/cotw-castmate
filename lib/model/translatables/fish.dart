import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/miscellaneous/values.dart';
import 'package:cotwcastmate/model/translatables/translatable.dart';
import 'package:flutter/material.dart';

class Fish extends Translatable {
  final String? _latin;
  final double? _minWeight;
  final double _maxWeight;
  final List<dynamic> _weights;
  final List<dynamic> _traits;
  final List<dynamic> _habitats;

  Fish({
    required super.id,
    required String? latin,
    required double? minWeight,
    required double maxWeight,
    required List<dynamic>? weights,
    required List<dynamic> traits,
    required List<dynamic>? habitats,
  })  : _latin = latin,
        _minWeight = minWeight,
        _maxWeight = maxWeight,
        _weights = weights ?? [],
        _traits = traits,
        _habitats = habitats ?? [];

  String? get latin => _latin;

  double? minWeight(bool imperialUnits) {
    return imperialUnits && _minWeight != null ? _minWeight! * Values.imperialPound : _minWeight;
  }

  double maxWeight(bool imperialUnits) {
    return imperialUnits ? _maxWeight * Values.imperialPound : _maxWeight;
  }

  List<dynamic> weights(imperialUnits) {
    return imperialUnits ? _weights.map((e) => e * Values.imperialPound).toList() : _weights;
  }

  List<dynamic> get traits => _traits;

  List<dynamic> get habitats => _habitats;

  bool get isLegendary => _latin == null && _weights.isEmpty && _habitats.isEmpty;

  Color weightColor(int i) {
    switch (i) {
      case 0:
        return Interface.disabled.withOpacity(0.1);
      case 1:
        return Interface.bronze;
      case 2:
        return Interface.silver;
      case 3:
        return Interface.gold;
      case 4:
        return Interface.diamond;
      default:
        throw UnimplementedError();
    }
  }

  factory Fish.fromJson(Map<String, dynamic> json) {
    return Fish(
      id: json["ID"],
      latin: json["LATIN"],
      minWeight: json["MIN_WEIGHT"],
      maxWeight: json["MAX_WEIGHT"],
      weights: json["WEIGHTS"],
      traits: json["TRAITS"],
      habitats: json["HABITATS"],
    );
  }

  static Comparator<Fish> sortByName = (a, b) {
    return a.name.compareTo(b.name);
  };
}
