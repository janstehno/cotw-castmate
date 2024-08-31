import 'package:cotwcastmate/miscellaneous/enums.dart';
import 'package:cotwcastmate/model/connect/fish_hook.dart';
import 'package:cotwcastmate/model/connect/fish_tackle.dart';
import 'package:cotwcastmate/model/translatables/fish.dart';
import 'package:cotwcastmate/widgets/parts/fish/fish_hook.dart';
import 'package:flutter/material.dart';

class WidgetTackleHooks<I extends FishTackle> extends StatelessWidget {
  final Fish _fish;
  final I _tackle;

  const WidgetTackleHooks(
    Fish fish, {
    super.key,
    required I tackle,
  })  : _fish = fish,
        _tackle = tackle;

  Widget _buildMinHook(double width, double height) {
    String? minHook = _tackle.getTackle.minHook;

    if (minHook != null) {
      int minRarity = -1;
      if (_fish.hooks.containsKey(minHook)) {
        minRarity = _fish.hooks[minHook];
      } else {
        for (HookSize hookSize in HookSize.values) {
          String hookKey = hookSize.name.replaceAll("h", "HOOK:");
          if (_fish.hooks.containsKey(hookKey)) {
            minRarity = _fish.hooks[hookKey];
            break;
          }
        }
      }

      return Row(
        children: [
          WidgetFishHook(
            fishHook: FishHook(
              fish: _fish.id,
              hook: minHook,
              trophy: minRarity,
            ),
            width: width,
            height: height,
          ),
          const SizedBox(width: 5),
        ],
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildMaxHook(double width, double height) {
    String? maxHook = _tackle.getTackle.maxHook;

    if (maxHook != null) {
      int maxRarity = -1;
      if (_fish.hooks.containsKey(maxHook)) {
        maxRarity = _fish.hooks[maxHook];
      } else {
        for (HookSize hookSize in HookSize.values.reversed) {
          String hookKey = hookSize.name.replaceAll("h", "HOOK:");
          if (_fish.hooks.containsKey(hookKey)) {
            maxRarity = _fish.hooks[hookKey];
            break;
          }
        }
      }

      return Row(
        children: [
          WidgetFishHook(
            fishHook: FishHook(
              fish: _fish.id,
              hook: maxHook,
              trophy: maxRarity,
            ),
            width: width,
            height: height,
          ),
          const SizedBox(width: 15),
        ],
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildWidgets() {
    return Row(
      children: [
        _buildMinHook(20, 15),
        _buildMaxHook(20, 15),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
