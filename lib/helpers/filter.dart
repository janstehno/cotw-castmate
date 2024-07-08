import 'package:cotwcastmate/helpers/json.dart';
import 'package:cotwcastmate/model/translatables/fish.dart';
import 'package:cotwcastmate/model/translatables/reserve.dart';

class HelperFilter {
  static Set<Reserve> filterReserves(String text) {
    if (text.isNotEmpty) {
      return HelperJSON.reserves.where((e) => e.name.toLowerCase().contains(text.toLowerCase())).toSet();
    }
    return HelperJSON.reserves;
  }

  static Set<Fish> filterFish(String text) {
    if (text.isNotEmpty) {
      return HelperJSON.fish
          .where((e) =>
              e.name.toLowerCase().contains(text.toLowerCase()) ||
              (e.isLegendary && e.alternative.toLowerCase().contains(text.toLowerCase())))
          .toSet();
    }
    return HelperJSON.fish;
  }
}
