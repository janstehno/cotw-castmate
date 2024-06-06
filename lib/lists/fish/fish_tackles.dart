import 'package:cotwcastmate/helpers/json.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/miscellaneous/enums.dart';
import 'package:cotwcastmate/model/connect/fish_tackle.dart';
import 'package:cotwcastmate/model/translatables/fish.dart';
import 'package:cotwcastmate/model/translatables/reserve.dart';
import 'package:cotwcastmate/widgets/app/error.dart';
import 'package:cotwcastmate/widgets/indicator/loading_indicator.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ListFishTackles<I extends FishTackle> extends StatelessWidget {
  final Fish _fish;
  final Reserve? _reserve;
  final TackleType _tackleType;

  const ListFishTackles(
    Fish fish, {
    super.key,
    Reserve? reserve,
    required TackleType tackleType,
  })  : _fish = fish,
        _reserve = reserve,
        _tackleType = tackleType;

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

  Future<Map<String, double>> _getTackleEffectiveness() async {
    return HelperJSON.getTackleEffectiveness(_fish, _reserve!, _tackleType);
  }

  Widget _buildWidget(AsyncSnapshot<Map<dynamic, dynamic>> snapshot, BuildContext context) {
    if (snapshot.hasError) {
      return WidgetError(
        code: "ExF001",
        error: "${snapshot.error}",
        stack: "${snapshot.stackTrace}",
      );
    } else if (!snapshot.hasData) {
      return WidgetError(
        code: "ExF002",
        error: "${snapshot.error}",
        stack: "${snapshot.stackTrace}",
      );
    } else {
      List<I> tackles = getTackles;
      if (tackles.isEmpty) return const SizedBox.shrink();

      Map<String, double> effectiveness = snapshot.data as Map<String, double>;
      return buildTackles(tackles, effectiveness);
    }
  }

  Widget _buildWidgets() {
    return FutureBuilder(
      future: _reserve == null ? Future.value({}) : _getTackleEffectiveness(),
      builder: (context, AsyncSnapshot<Map<dynamic, dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const WidgetLoadingIndicator();
        } else if (snapshot.connectionState != ConnectionState.done) {
          return const SizedBox.shrink();
        } else {
          return _buildWidget(snapshot, context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
