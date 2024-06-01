import 'package:cotwcastmate/model/translatables/translatable.dart';
import 'package:easy_localization/easy_localization.dart';

class Trait extends Translatable {
  final String _description;

  Trait({
    required super.id,
    required String description,
  }) : _description = description;

  String get description => tr(_description);

  factory Trait.fromJson(Map<String, dynamic> json) {
    return Trait(
      id: json["ID"],
      description: json["DESCRIPTION"],
    );
  }

  static Comparator<Trait> sortByName = (a, b) {
    return a.name.compareTo(b.name);
  };
}
