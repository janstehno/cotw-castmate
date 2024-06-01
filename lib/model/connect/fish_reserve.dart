class FishReserve {
  final String _fish;
  final String _reserve;

  FishReserve({
    required String fish,
    required String reserve,
  })  : _fish = fish,
        _reserve = reserve;

  String get fish => _fish;

  String get reserve => _reserve;

  factory FishReserve.fromJson(Map<String, dynamic> json) {
    return FishReserve(
      fish: json["FISH"],
      reserve: json["RESERVE"],
    );
  }
}
