import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/model/translatables/reserve.dart';
import 'package:cotwcastmate/widgets/parts/entries/entry.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:flutter/material.dart';

class WidgetReserve extends WidgetEntry<Reserve> {
  const WidgetReserve({
    super.key,
    required super.index,
    required super.entry,
    required super.onTap,
  });

  @override
  Widget? buildSubText() {
    return WidgetText(
      entry.location,
      color: Interface.disabled,
      style: Style.normal.s12.w400,
    );
  }

  @override
  Widget buildText() {
    return WidgetText(
      entry.name,
      color: Interface.primaryLight,
      style: Style.normal.s16.w400,
    );
  }
}
