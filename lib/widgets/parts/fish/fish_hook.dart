import 'package:cotwcastmate/helpers/json.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/miscellaneous/enums.dart';
import 'package:cotwcastmate/model/connect/fish_hook.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:flutter/material.dart';

class WidgetFishHook extends StatelessWidget {
  final FishHook? _fishHook;
  final HookSize? _hookSize;
  final double _width;
  final double _height;

  const WidgetFishHook({
    super.key,
    FishHook? fishHook,
    HookSize? hookSize,
    required double width,
    double? height,
  })  : _fishHook = fishHook,
        _hookSize = hookSize,
        _width = width,
        _height = height ?? 25;

  Color get _color =>
      _fishHook == null ? Interface.disabled : (_fishHook!.isGold ? Interface.primaryDark : Interface.primaryLight);

  Color get _background => _fishHook == null ? Interface.none : _fishHook!.hookColor();

  String get _text => _fishHook == null
      ? _hookSize!.name.replaceAll("h", "").replaceAll("_", "/")
      : HelperJSON.getHook(_fishHook!.hook).size;

  Widget _buildText() {
    return WidgetText(
      _text,
      color: _color,
      style: _height >= 25 ? Style.normal.s16.w600 : Style.normal.s10.w600,
    );
  }

  Widget _buildWidgets() {
    return Container(
      height: _height,
      width: _width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_height / 5),
        color: _background,
      ),
      child: _buildText(),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
