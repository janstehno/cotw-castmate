import 'package:cotwcastmate/miscellaneous/enums.dart';
import 'package:cotwcastmate/model/translatables/translatable.dart';

class Habitat extends Translatable {
  HabitatType _type;

  Habitat({
    required super.id,
    required HabitatType type,
  }) : _type = type;

  HabitatType get type => _type;

  factory Habitat.fromJson(Map<String, dynamic> json) {
    return Habitat(
        id: json["ID"],
        type: HabitatType.values.firstWhere((e) {
          return e.name.toLowerCase() ==
              json["ID"].split(":").elementAt(1).replaceAll("HABITAT", "").replaceAll("_", "").toLowerCase();
        }));
  }

  static Comparator<Habitat> sortByType = (a, b) {
    return a.type.index.compareTo(b.type.index);
  };
}
