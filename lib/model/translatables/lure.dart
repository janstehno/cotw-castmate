import 'package:cotwcastmate/model/translatables/translatable.dart';

class Lure extends Translatable {
  final List<dynamic> _technique;

  Lure({
    required super.id,
    required List<dynamic> technique,
  }) : _technique = technique;

  int get techniqueCount => _technique.where((e) => e == 1).length;

  bool technique(int i) => _technique[i] == 1;

  factory Lure.fromJson(Map<String, dynamic> json) {
    return Lure(
      id: json["ID"],
      technique: json["TECHNIQUE"],
    );
  }

  static Comparator<Lure> sortByName = (a, b) {
    return a.name.compareTo(b.name);
  };
}
