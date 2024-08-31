import 'package:cotwcastmate/generated/assets.gen.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/model/connect/fish_tackle.dart';
import 'package:cotwcastmate/model/translatables/fish.dart';
import 'package:cotwcastmate/widgets/icon/icon.dart';
import 'package:cotwcastmate/widgets/parts/fish/tackle_hooks.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:flutter/material.dart';

abstract class ListFishTackles<I extends FishTackle> extends StatelessWidget {
  final Fish _fish;
  final Map<String, double> _effectiveness;
  final bool _tackleTrophyRange;

  ListFishTackles(
    Fish fish, {
    super.key,
    Map<String, double>? effectiveness,
    required tackleTrophyRange,
  })  : _fish = fish,
        _effectiveness = effectiveness ?? {},
        _tackleTrophyRange = tackleTrophyRange;

  Fish get fish => _fish;

  List<I> get getTackles;

  bool isTackleGround(I tackle) => false;

  String getTackleName(I tackle);

  Widget buildIcon(I tackle, [int? i]);

  Widget buildStrength(I tackle);

  Widget _buildGround() {
    return WidgetIcon.withSize(
      Assets.graphics.icons.baitGround,
      color: Interface.disabled,
      size: 12,
    );
  }

  Widget _buildEffectiveness(double effectiveness) {
    return Container(
      width: 25,
      alignment: Alignment.center,
      child: WidgetText(
        effectiveness.round() == 0 ? "-" : "${effectiveness.round()}",
        color: effectiveness == 0 ? Interface.disabled.withOpacity(0.2) : Interface.disabled,
        style: Style.normal.s16.w400i,
      ),
    );
  }

  Widget _buildTackleName(I tackle) {
    return WidgetText(
      getTackleName(tackle),
      color: Interface.primaryLight,
      style: Style.normal.s16.w400,
    );
  }

  Widget _buildTackle(I tackle, [double? effectiveness]) {
    return SizedBox(
      height: 25,
      child: Row(
        children: [
          if (!_fish.isLegendary && _tackleTrophyRange) WidgetTackleHooks(_fish, tackle: tackle),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: _buildTackleName(tackle),
                ),
                if (isTackleGround(tackle)) ...[
                  const SizedBox(width: 10),
                  _buildGround(),
                ],
              ],
            ),
          ),
          const SizedBox(width: 15),
          if (effectiveness != null) ...[
            _buildEffectiveness(effectiveness),
            const SizedBox(width: 15),
          ],
          buildStrength(tackle),
        ],
      ),
    );
  }

  List<Widget> listTackles(List<I> tackles, Map<String, double> effectiveness) {
    return tackles.map((e) {
      if (!effectiveness.containsKey(e.tackle) ||
          effectiveness.isEmpty ||
          effectiveness[e.tackle]!.isInfinite ||
          effectiveness[e.tackle]!.isNaN) {
        return _buildTackle(e);
      }
      double c = effectiveness[e.tackle]!;
      return _buildTackle(e, c);
    }).toList();
  }

  Widget buildTackles(List<I> tackles, Map<String, double> effectiveness);

  Widget _buildWidgets() {
    List<I> tackles = getTackles;
    if (tackles.isEmpty) return const SizedBox.shrink();

    return buildTackles(tackles, _effectiveness);
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
