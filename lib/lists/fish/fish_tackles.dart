import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/model/connect/fish_tackle.dart';
import 'package:cotwcastmate/model/translatables/fish.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ListFishTackles<I extends FishTackle> extends StatelessWidget {
  final Fish _fish;
  final Map<String, double> _effectiveness;

  ListFishTackles(
    Fish fish, {
    super.key,
    Map<String, double>? effectiveness,
  })  : _fish = fish,
        _effectiveness = effectiveness ?? {};

  Fish get fish => _fish;

  List<I> get getTackles;

  String getTackleName(I tackle);

  Widget buildIcon(I tackle, [int? i]);

  Widget buildStrength(I tackle);

  Widget _buildEffectiveness(double effectiveness) {
    return WidgetText(
      "${effectiveness.round()}",
      color: effectiveness == 0 ? Interface.disabled.withOpacity(0.2) : Interface.disabled,
      style: Style.normal.s16.w400i,
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
          Expanded(child: _buildTackleName(tackle)),
          const SizedBox(width: 10),
          if (effectiveness != null) _buildEffectiveness(effectiveness),
          const SizedBox(width: 10),
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
