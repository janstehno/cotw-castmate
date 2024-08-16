import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:cotwcastmate/interface/graphics.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/model/translatables/reserve.dart';
import 'package:cotwcastmate/widgets/app/margin.dart';
import 'package:cotwcastmate/widgets/app/padding.dart';
import 'package:cotwcastmate/widgets/title/title_tap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetTitleMapTap extends WidgetTitleTap {
  final Reserve _reserve;

  const WidgetTitleMapTap(
    super.text, {
    super.key,
    required Reserve reserve,
    required super.onTap,
  }) : _reserve = reserve;

  @override
  Widget buildWidgets() {
    return GestureDetector(
      onTap: () => onTap(),
      child: SizedBox(
        height: height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              Graphics.getTile(_reserve.region, 0, 0, 1),
              fit: BoxFit.fitWidth,
            ),
            WidgetPadding.h30(
              child: Row(
                children: [
                  Expanded(child: WidgetMargin.right(30, child: super.buildText())),
                ],
              ),
            ).blurry(
              blur: 3,
              elevation: 0,
              padding: EdgeInsets.zero,
              color: background,
              shadowColor: Interface.transparent,
              borderRadius: BorderRadius.circular(0),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => buildWidgets();
}
