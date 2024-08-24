import 'package:collection/collection.dart';
import 'package:cotwcastmate/miscellaneous/enums.dart';
import 'package:cotwcastmate/model/connect/fish_hook.dart';
import 'package:cotwcastmate/model/translatables/fish.dart';
import 'package:cotwcastmate/widgets/parts/fish/fish_hook.dart';
import 'package:flutter/material.dart';

class ListFishHooks extends StatelessWidget {
  final Fish _fish;

  const ListFishHooks(
    Fish fish, {
    super.key,
  }) : _fish = fish;

  List<HookSize> get _hookSizes => HookSize.values;

  List<Widget> _listHooks(double width) {
    return _hookSizes.map((e) {
      MapEntry<String, dynamic>? hook =
          _fish.hooks.entries.firstWhereOrNull((h) => e.name == "h${h.key.split(":")[1].replaceAll("/", "_")}");
      if (hook != null) {
        FishHook fishHook = FishHook(fish: _fish.id, hook: hook.key, trophy: hook.value);
        return WidgetFishHook(fishHook: fishHook, width: width);
      } else {
        return WidgetFishHook(hookSize: e, width: width);
      }
    }).toList();
  }

  Widget _buildPortrait(double width) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: _listHooks(width),
    );
  }

  Widget _buildLandscape(double width) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: _listHooks(width));
  }

  Widget _buildWidgets(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    double screenWidth = MediaQuery.of(context).size.width;
    double width = (orientation == Orientation.landscape || screenWidth > 1000)
        ? (screenWidth - 60 - ((_hookSizes.length - 1) * 10)) / _hookSizes.length
        : (screenWidth - 60 - (6 * 10)) / 7;

    if (orientation == Orientation.portrait) return _buildPortrait(width.floorToDouble());
    return _buildLandscape(width.floorToDouble());
  }

  @override
  Widget build(BuildContext context) => _buildWidgets(context);
}
