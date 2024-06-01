import 'package:easy_localization/easy_localization.dart';

abstract class Translatable {
  final String _id;

  Translatable({
    required String id,
  }) : _id = id;

  String get id => _id;

  String get name => tr(_id);
}
