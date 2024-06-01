import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/model/translatables/fish.dart';
import 'package:cotwcastmate/widgets/parts/entries/entry.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WidgetFish extends WidgetEntry<Fish> {
  const WidgetFish({
    super.key,
    required super.index,
    required super.entry,
    super.background,
    required super.onTap,
  });

  @override
  Widget buildText() {
    return WidgetText(
      entry.name,
      color: Interface.primaryLight,
      style: Style.normal.s16.w400,
    );
  }

  @override
  Widget? buildSubText() {
    return WidgetText(
      entry.latin ?? tr("UI:LEGENDARY"),
      color: Interface.primaryLight.withOpacity(0.6),
      style: Style.normal.s12.w400i,
    );
  }
}
