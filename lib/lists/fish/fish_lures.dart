import 'package:collection/collection.dart';
import 'package:cotwcastmate/helpers/json.dart';
import 'package:cotwcastmate/interface/graphics.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/miscellaneous/enums.dart';
import 'package:cotwcastmate/model/connect/fish_lure.dart';
import 'package:cotwcastmate/model/translatables/fish.dart';
import 'package:cotwcastmate/model/translatables/reserve.dart';
import 'package:cotwcastmate/widgets/app/padding.dart';
import 'package:cotwcastmate/widgets/icons/icon.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:cotwcastmate/widgets/title/title.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

class ListFishLures extends StatelessWidget {
  final Fish _fish;
  final Reserve? _reserve;

  const ListFishLures(
    Fish fish, {
    super.key,
    Reserve? reserve,
  })  : _fish = fish,
        _reserve = reserve;

  List<FishLure> get _lures => HelperJSON.getFishLures(_fish.id).sorted(FishLure.sortByTechniqueStrength);

  Widget _buildIcon(int i, FishLure fishLure) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: SimpleShadow(
        sigma: 0,
        opacity: 1,
        color: Interface.primaryDark,
        offset: const Offset(0.75, 0.75),
        child: WidgetIcon.withSize(
          Graphics.getTechniqueIcon(TechniqueType.values.elementAt(i)),
          color: HelperJSON.getLure(fishLure.tackle).technique(i)
              ? fishLure.strengthColor()
              : Interface.disabled.withOpacity(0.1),
          size: 15,
        ),
      ),
    );
  }

  List<Widget> _buildStrength(FishLure fishLure) {
    return List.generate(4, (i) => _buildIcon(i, fishLure));
  }

  Widget _buildEffectiveness(double effectiveness) {
    return WidgetText(
      "${effectiveness.round()}",
      color: effectiveness == 0 ? Interface.disabled.withOpacity(0.2) : Interface.disabled,
      style: Style.normal.s16.w400i,
    );
  }

  Widget _buildLure(FishLure fishLure, [double? effectiveness]) {
    return Row(
      children: [
        Expanded(
          child: WidgetText(
            HelperJSON.getLure(fishLure.tackle).name,
            color: Interface.primaryLight,
            style: Style.normal.s16.w400,
          ),
        ),
        const SizedBox(width: 10),
        if (effectiveness != null) _buildEffectiveness(effectiveness),
        const SizedBox(width: 10),
        Row(children: _buildStrength(fishLure)),
      ],
    );
  }

  List<Widget> _listLures(List<FishLure> lures, Map<String, double> effectiveness) {
    return _lures.map((e) {
      if (effectiveness.isEmpty || effectiveness[e.tackle]!.isInfinite || effectiveness[e.tackle]!.isNaN) {
        return _buildLure(e);
      }
      double c = effectiveness[e.tackle]!;
      return _buildLure(e, c);
    }).toList();
  }

  Widget _buildLures(List<FishLure> lures, Map<String, double> effectiveness) {
    if (lures.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetTitle(tr("UI:LURES")),
          WidgetPadding.h30v20(child: Column(children: _listLures(lures, effectiveness))),
        ],
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildWidgets() {
    List<FishLure> lures = HelperJSON.getFishLures(_fish.id).sorted(FishLure.sortByStrength);
    if (_reserve == null) return _buildLures(lures, {});

    Map<String, double> effectiveness = HelperJSON.getTackleEffectiveness(_fish, _reserve!, TackleType.lure);
    return _buildLures(lures, effectiveness);
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
