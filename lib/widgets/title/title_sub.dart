import 'package:flutter/material.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/values.dart';
import 'package:cotwcastmate/widgets/title/title.dart';

class WidgetSubtitle extends WidgetTitle {
  const WidgetSubtitle(
    super.text, {
    super.key,
  });

  @override
  double get height => Values.subtitle;

  @override
  Color get background => Interface.subtitle;
}
