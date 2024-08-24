import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/miscellaneous/values.dart';
import 'package:cotwcastmate/model/translatables/translatable.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Fish extends Translatable {
  final String? _alternative;
  final String? _latin;
  final String _reserve;
  final double? _minWeight;
  final double _maxWeight;
  final List<dynamic> _weights;
  final List<dynamic> _traits;
  final List<dynamic> _habitats;
  final Map<String, dynamic> _hooks;

  Fish({
    required super.id,
    required String? alternative,
    required String? latin,
    required String reserve,
    required double? minWeight,
    required double maxWeight,
    required List<dynamic>? weights,
    required List<dynamic> traits,
    required List<dynamic>? habitats,
    required Map<String, dynamic> hooks,
  })  : _alternative = alternative,
        _latin = latin,
        _reserve = reserve,
        _minWeight = minWeight,
        _maxWeight = maxWeight,
        _weights = weights ?? [],
        _traits = traits,
        _habitats = habitats ?? [],
        _hooks = hooks;

  String get alternative => tr(_alternative!);

  String? get latin => _latin;

  String get reserve => _reserve;

  double? minWeight(bool imperialUnits) {
    return imperialUnits && _minWeight != null ? _minWeight! * Values.imperialPound : _minWeight;
  }

  double maxWeight(bool imperialUnits) {
    return imperialUnits ? _maxWeight * Values.imperialPound : _maxWeight;
  }

  List<dynamic> weights(imperialUnits) {
    return imperialUnits ? _weights.map((e) => e * Values.imperialPound).toList() : _weights;
  }

  Map<String, dynamic> get hooks => _hooks;

  List<dynamic> get traits => _traits;

  List<dynamic> get habitats => _habitats;

  bool get isLegendary => _alternative != null && _latin == null && _weights.isEmpty && _habitats.isEmpty;

  Color weightColor(int i) {
    switch (i) {
      case 0:
        return Interface.juvenile;
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
      alternative: json["ALTERNATIVE"],
      latin: json["LATIN"],
      reserve: json["RESERVE"],
      minWeight: json["MIN_WEIGHT"],
      maxWeight: json["MAX_WEIGHT"],
      weights: json["WEIGHTS"],
      traits: json["TRAITS"],
      habitats: json["HABITATS"],
      hooks: json["HOOKS"],
    );
  }

  static Comparator<Fish> sortByName = (a, b) {
    return a.name.compareTo(b.name);
  };
}
