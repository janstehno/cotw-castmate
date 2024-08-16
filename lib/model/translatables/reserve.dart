import 'package:cotwcastmate/miscellaneous/enums.dart';
import 'package:cotwcastmate/model/translatables/translatable.dart';
import 'package:easy_localization/easy_localization.dart';

class Reserve extends Translatable {
  final int _count;
  final int _legendary;
  final String _location;
  final MapRegion _region;

  Reserve({
    required super.id,
    required int count,
    required int legendary,
    required String location,
    required MapRegion region,
  })  : _count = count,
        _legendary = legendary,
        _location = location,
        _region = region;

  int get count => _count;

  int get legendary => _legendary;

  String get location => tr(_location);

  MapRegion get region => _region;

  factory Reserve.fromJson(Map<String, dynamic> json) {
    return Reserve(
      id: json["ID"],
      count: json["COUNT"],
      legendary: json["LEGENDARY"],
      location: json["LOCATION"],
      region: MapRegion.values.firstWhere((e) {
        return e.name.toLowerCase() == json["ID"].split(":").elementAt(1).replaceAll("_", "").toLowerCase();
      }),
    );
  }

  static Comparator<Reserve> sortByName = (a, b) {
    return a.name.compareTo(b.name);
  };
}
