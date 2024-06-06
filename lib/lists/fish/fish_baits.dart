import 'package:collection/collection.dart';
import 'package:cotwcastmate/helpers/json.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/interface/values.dart';
import 'package:cotwcastmate/miscellaneous/enums.dart';
import 'package:cotwcastmate/model/connect/fish_bait.dart';
import 'package:cotwcastmate/model/translatables/fish.dart';
import 'package:cotwcastmate/model/translatables/reserve.dart';
import 'package:cotwcastmate/widgets/app/padding.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:cotwcastmate/widgets/title/title.dart';
import 'package:cotwcastmate/widgets/title/title_sub.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

class ListFishBaits extends StatelessWidget {
  final Fish _fish;
  final Reserve? _reserve;

  const ListFishBaits(
    Fish fish, {
    super.key,
    Reserve? reserve,
  })  : _fish = fish,
        _reserve = reserve;

  Widget _buildDot(FishBait fishBait) {
    return SimpleShadow(
      sigma: 0,
      opacity: 1,
      color: Interface.primaryDark,
      offset: const Offset(0.75, 0.75),
      child: Container(
        width: Values.dotSize,
        height: Values.dotSize,
        margin: const EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: fishBait.strengthColor(),
        ),
      ),
    );
  }

  Widget _buildStrength(FishBait fishBait) {
    return SizedBox(
      width: 3 * Values.dotSize + 3 * 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: List.generate(fishBait.strength, (i) => _buildDot(fishBait)),
      ),
    );
  }

  Widget _buildEffectiveness(double effectiveness) {
    return WidgetText(
      "${effectiveness.round()}",
      color: effectiveness == 0 ? Interface.disabled.withOpacity(0.2) : Interface.disabled,
      style: Style.normal.s16.w400i,
    );
  }

  Widget _buildBaitName(FishBait fishBait) {
    return WidgetText(
      HelperJSON.getBait(fishBait.tackle).name,
      color: Interface.primaryLight,
      style: Style.normal.s16.w400,
    );
  }

  Widget _buildBait(FishBait fishBait, [double? effectiveness]) {
    return SizedBox(
      height: 25,
      child: Row(
        children: [
          Expanded(child: _buildBaitName(fishBait)),
          const SizedBox(width: 10),
          if (effectiveness != null) _buildEffectiveness(effectiveness),
          const SizedBox(width: 10),
          _buildStrength(fishBait),
        ],
      ),
    );
  }

  List<Widget> _listBaits(List<FishBait> baits, Map<String, double> effectiveness) {
    return baits.map((e) {
      if (effectiveness.isEmpty || effectiveness[e.tackle]!.isInfinite || effectiveness[e.tackle]!.isNaN) {
        return _buildBait(e);
      }
      double c = effectiveness[e.tackle]!;
      return _buildBait(e, c);
    }).toList();
  }

  List<Widget> _listSubBaits(String subtitle, List<FishBait> baits, Map<String, double> effectiveness) {
    return [
      WidgetSubtitle(subtitle),
      WidgetPadding.h30v20(child: Column(children: _listBaits(baits, effectiveness))),
    ];
  }

  Widget _buildBaits(List<FishBait> baits, Map<String, double> effectiveness) {
    List<FishBait> natural = baits.where((e) => e.type == BaitType.natural).toList();
    List<FishBait> bottom = baits.where((e) => e.type == BaitType.bottom).toList();
    List<FishBait> live = baits.where((e) => e.type == BaitType.live).toList();

    if (natural.isNotEmpty || bottom.isNotEmpty || live.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetTitle(tr("UI:BAITS")),
          if (natural.isNotEmpty) ..._listSubBaits(tr("TYPE:NATURAL"), natural, effectiveness),
          if (bottom.isNotEmpty) ..._listSubBaits(tr("TYPE:BOTTOM"), bottom, effectiveness),
          if (live.isNotEmpty) ..._listSubBaits(tr("TYPE:LIVE"), live, effectiveness),
        ],
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildWidgets() {
    List<FishBait> baits = HelperJSON.getFishBaits(_fish.id).sorted(FishBait.sortByStrength);
    if (_reserve == null) return _buildBaits(baits, {});

    Map<String, double> effectiveness = HelperJSON.getTackleEffectiveness(_fish, _reserve!, TackleType.bait);
    return _buildBaits(baits, effectiveness);
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
