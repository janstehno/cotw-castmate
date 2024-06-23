import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/settings.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/miscellaneous/utils.dart';
import 'package:cotwcastmate/model/translatables/fish.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListFishWeights extends StatelessWidget {
  final Fish _fish;

  const ListFishWeights(
    Fish fish, {
    super.key,
  }) : _fish = fish;

  Widget _buildBar(Color color, double flex, BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double availableWidth = screenWidth - 140;
    double barWidth = availableWidth * flex;

    return Container(
      height: 15,
      width: barWidth < 5 ? 5 : barWidth,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
    );
  }

  Widget _buildText(String weight, Alignment alignment) {
    return Container(
      width: 30,
      alignment: alignment,
      child: WidgetText(
        weight,
        color: Interface.primaryLight,
        style: Style.normal.s16.w600,
      ),
    );
  }

  Widget _buildRow(double previousWeight, double actualWeight, double flex, Color color, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildText(Utils.formatDouble(previousWeight), Alignment.center),
        _buildBar(color, flex, context),
        _buildText(Utils.formatDouble(actualWeight), Alignment.centerLeft),
      ],
    );
  }

  List<Widget> _listWeights(BuildContext context) {
    bool imperialUnits = Provider.of<Settings>(context, listen: false).imperialUnits;

    List<Widget> widgets = [];
    List<dynamic> weights = [];
    weights.add(_fish.minWeight(imperialUnits)!);
    weights.addAll(_fish.weights(imperialUnits));
    weights.add(_fish.maxWeight(imperialUnits));

    double rangeWidth = _fish.maxWeight(imperialUnits) - _fish.minWeight(imperialUnits)!;

    for (int i = 1; i < weights.length; i++) {
      double previousWeight = weights[i - 1];
      double actualWeight = weights[i];
      double flex = (actualWeight - previousWeight) / rangeWidth;

      widgets.add(_buildRow(previousWeight, actualWeight, flex, _fish.weightColor(i - 1), context));
      if (i != weights.length) widgets.add(const SizedBox(height: 10));
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _listWeights(context),
    );
  }
}
