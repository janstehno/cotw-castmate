import 'package:cotwcastmate/helpers/json.dart';
import 'package:cotwcastmate/miscellaneous/enums.dart';
import 'package:cotwcastmate/model/connect/fish_tackle.dart';
import 'package:cotwcastmate/model/translatables/bait.dart';

class FishBait extends FishTackle {
  FishBait({
    required super.fish,
    required String bait,
    required super.strength,
  }) : super(tackle: bait);

  @override
  Bait get getTackle => HelperJSON.getBait(tackle);

  BaitType get type => HelperJSON.getBait(tackle).type;

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
