class Hook {
  final String _id;
  final String _size;

  Hook({
    required String id,
    required String size,
  })  : _id = id,
        _size = size;

  String get id => _id;

  String get size => _size;

  factory Hook.fromJson(Map<String, dynamic> json) {
    return Hook(
      id: json["ID"],
      size: json["SIZE"],
    );
  }
}
