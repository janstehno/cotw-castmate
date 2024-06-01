import 'package:cotwcastmate/miscellaneous/enums.dart';
import 'package:cotwcastmate/model/translatables/translatable.dart';

class Bait extends Translatable {
  final BaitType _type;

  Bait({
    required super.id,
    required BaitType type,
  }) : _type = type;

  BaitType get type => _type;

  factory Bait.fromJson(Map<String, dynamic> json) {
    return Bait(
      id: json["ID"],
      type: BaitType.values.firstWhere((e) {
        return e.name.toLowerCase() == json["TYPE"].split(":").elementAt(1).toLowerCase();
      }),
    );
  }

  static Comparator<Bait> sortByName = (a, b) {
    return a.name.compareTo(b.name);
  };
}
