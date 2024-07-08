import 'package:cotwcastmate/miscellaneous/enums.dart';
import 'package:cotwcastmate/model/translatables/translatable.dart';

class Bait extends Translatable {
  final BaitType _type;
  final bool _ground;

  Bait({
    required super.id,
    required BaitType type,
    required bool? ground,
  })  : _type = type,
        _ground = ground ?? false;

  BaitType get type => _type;

  bool get isGround => _ground || _type == BaitType.ground;

  factory Bait.fromJson(Map<String, dynamic> json) {
    return Bait(
      id: json["ID"],
      type: BaitType.values.firstWhere((e) => e.name.toLowerCase() == json["TYPE"].toLowerCase()),
      ground: json["GROUND"],
    );
  }

  static Comparator<Bait> sortByName = (a, b) {
    return a.name.compareTo(b.name);
  };
}
