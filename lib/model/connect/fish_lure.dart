import 'package:cotwcastmate/helpers/json.dart';
import 'package:cotwcastmate/model/connect/fish_tackle.dart';
import 'package:cotwcastmate/model/translatables/lure.dart';

class FishLure extends FishTackle {
  FishLure({
    required super.fish,
    required String lure,
    required super.strength,
  }) : super(tackle: lure);

  @override
  Lure get getTackle => HelperJSON.getLure(tackle);

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
    Lure s = HelperJSON.getLure(a.tackle);
    Lure t = HelperJSON.getLure(b.tackle);

    if (a.strength == b.strength) return t.techniqueCount.compareTo(s.techniqueCount);
    return b.strength.compareTo(a.strength);
  };
}
