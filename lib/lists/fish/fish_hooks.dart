import 'package:collection/collection.dart';
import 'package:cotwcastmate/helpers/json.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/miscellaneous/enums.dart';
import 'package:cotwcastmate/model/connect/fish_hook.dart';
import 'package:cotwcastmate/model/translatables/fish.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:flutter/material.dart';

class ListFishHooks extends StatelessWidget {
  final Fish _fish;

  const ListFishHooks(
    Fish fish, {
    super.key,
  }) : _fish = fish;

  Set<FishHook> get _hooks => HelperJSON.getFishHooks(_fish.id);

  List<HookSize> get _hookSizes => HookSize.values;

  Widget _buildHook(Color color, String text, double width, BuildContext context) {
    return Container(
      height: 25,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      child: WidgetText(
        text,
        color: color == Interface.gold ? Interface.primaryDark : Interface.primaryLight,
        style: Style.normal.s16.w600,
      ),
    );
  }

  Widget _buildFullHook(FishHook fishHook, double width, BuildContext context) {
    return _buildHook(
      fishHook.hookColor(),
      HelperJSON.getHook(fishHook.hook).size,
      width,
      context,
    );
  }

  Widget _buildEmptyHook(HookSize hookSize, double width, BuildContext context) {
    return _buildHook(
      Interface.primaryDark.withOpacity(0.6),
      hookSize.name.replaceAll("h", "").replaceAll("_", "/"),
      width,
      context,
    );
  }

  List<Widget> _listHooks(double width, BuildContext context) {
    return _hookSizes.map((e) {
      FishHook? fishHook = _hooks.firstWhereOrNull((h) {
        return "h${HelperJSON.getHook(h.hook).size.replaceAll("/", "_")}" == e.name;
      });
      if (fishHook != null) {
        return _buildFullHook(fishHook, width, context);
      } else {
        return _buildEmptyHook(e, width, context);
      }
    }).toList();
  }

  Widget _buildPortrait(double width, BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: _listHooks(width, context),
    );
  }

  Widget _buildLandscape(double width, BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: _listHooks(width, context));
  }

  Widget _buildWidgets(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    double screenWidth = MediaQuery.of(context).size.width;
    double width = (orientation == Orientation.landscape || screenWidth > 1000)
        ? (screenWidth - 60 - ((_hookSizes.length - 1) * 10)) / _hookSizes.length
        : (screenWidth - 60 - (6 * 10)) / 7;

    if (orientation == Orientation.portrait) return _buildPortrait(width, context);
    return _buildLandscape(width, context);
  }

  @override
  Widget build(BuildContext context) => _buildWidgets(context);
}
