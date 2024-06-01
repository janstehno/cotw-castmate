import 'package:cotwcastmate/model/translatables/translatable.dart';
import 'package:easy_localization/easy_localization.dart';

class Reserve extends Translatable {
  final int _count;
  final int _legendary;
  final String _location;

  Reserve({
    required super.id,
    required int count,
    required int legendary,
    required String region,
  })  : _count = count,
        _legendary = legendary,
        _location = region;

  int get count => _count;

  int get legendary => _legendary;

  String get location => tr(_location);

  factory Reserve.fromJson(Map<String, dynamic> json) {
    return Reserve(
      id: json["ID"],
      count: json["COUNT"],
      legendary: json["LEGENDARY"],
      region: json["LOCATION"],
    );
  }

  static Comparator<Reserve> sortByName = (a, b) {
    return a.name.compareTo(b.name);
  };
}
