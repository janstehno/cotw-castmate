import 'package:cotwcastmate/model/translatables/translatable.dart';

class Lure extends Translatable {
  final List<dynamic> _technique;
  final String _minHook;
  final String _maxHook;

  Lure({
    required super.id,
    required List<dynamic> technique,
    required String minHook,
    required String maxHook,
  })  : _technique = technique,
        _minHook = minHook,
        _maxHook = maxHook;

  int get techniqueCount => _technique.where((e) => e == 1).length;

  bool technique(int i) => _technique[i] == 1;

  String get minHook => _minHook;

  String get maxHook => _maxHook;

  factory Lure.fromJson(Map<String, dynamic> json) {
    return Lure(
      id: json["ID"],
      technique: json["TECHNIQUE"],
      minHook: json["MIN_HOOK"],
      maxHook: json["MAX_HOOK"],
    );
  }

  static Comparator<Lure> sortByName = (a, b) {
    return a.name.compareTo(b.name);
  };
}
