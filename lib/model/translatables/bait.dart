import 'package:cotwcastmate/miscellaneous/enums.dart';
import 'package:cotwcastmate/model/translatables/translatable.dart';

class Bait extends Translatable {
  final BaitType _type;
  final bool _ground;
  final String? _minHook;
  final String? _maxHook;

  Bait({
    required super.id,
    required BaitType type,
    required bool? ground,
    required String? minHook,
    required String? maxHook,
  })  : _type = type,
        _ground = ground ?? false,
        _minHook = minHook,
        _maxHook = maxHook;

  BaitType get type => _type;

  bool get isGround => _ground || _type == BaitType.ground;

  String? get minHook => _minHook;

  String? get maxHook => _maxHook;

  factory Bait.fromJson(Map<String, dynamic> json) {
    return Bait(
      id: json["ID"],
      type: BaitType.values.firstWhere((e) => e.name.toLowerCase() == json["TYPE"].toLowerCase()),
      ground: json["GROUND"],
      minHook: json["MIN_HOOK"],
      maxHook: json["MAX_HOOK"],
    );
  }

  static Comparator<Bait> sortByName = (a, b) {
    return a.name.compareTo(b.name);
  };
}
