import 'package:collection/collection.dart';
import 'package:cotwcastmate/helpers/json.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/lists/fish/fish_tackles.dart';
import 'package:cotwcastmate/miscellaneous/enums.dart';
import 'package:cotwcastmate/miscellaneous/values.dart';
import 'package:cotwcastmate/model/connect/fish_bait.dart';
import 'package:cotwcastmate/widgets/app/padding.dart';
import 'package:cotwcastmate/widgets/title/title.dart';
import 'package:cotwcastmate/widgets/title/title_sub.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

class ListFishBaits extends ListFishTackles<FishBait> {
  ListFishBaits(
    super.fish, {
    super.key,
    super.effectiveness,
  });

  @override
  List<FishBait> get getTackles => HelperJSON.getFishBaits(fish.id).sorted(FishBait.sortByStrength);

  @override
  bool isTackleGround(FishBait tackle) => HelperJSON.getBait(tackle.tackle).isGround;

  @override
  String getTackleName(FishBait tackle) => HelperJSON.getBait(tackle.tackle).name;

  @override
  Widget buildIcon(FishBait tackle, [int? i]) {
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
          color: tackle.strengthColor(),
        ),
      ),
    );
  }

  @override
  Widget buildStrength(FishBait tackle) {
    return SizedBox(
      width: 3 * Values.dotSize + 3 * 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: List.generate(tackle.strength, (i) => buildIcon(tackle)),
      ),
    );
  }

  List<Widget> _listSubTackles(String subtitle, List<FishBait> tackles, Map<String, double> effectiveness) {
    return [
      WidgetSubtitle(subtitle),
      WidgetPadding.h30v20(child: Column(children: listTackles(tackles, effectiveness))),
    ];
  }

  @override
  Widget buildTackles(List<FishBait> tackles, Map<String, double> effectiveness) {
    List<FishBait> natural = tackles.where((e) => e.type == BaitType.natural).toList();
    List<FishBait> bottom = tackles.where((e) => e.type == BaitType.bottom).toList();
    List<FishBait> live = tackles.where((e) => e.type == BaitType.live).toList();
    List<FishBait> ground = tackles.where((e) => e.type == BaitType.ground).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetTitle(tr("UI:BAITS")),
        if (natural.isNotEmpty) ..._listSubTackles(tr("TYPE:NATURAL"), natural, effectiveness),
        if (bottom.isNotEmpty) ..._listSubTackles(tr("TYPE:BOTTOM"), bottom, effectiveness),
        if (live.isNotEmpty) ..._listSubTackles(tr("TYPE:LIVE"), live, effectiveness),
        if (ground.isNotEmpty) ..._listSubTackles(tr("TYPE:GROUND"), ground, effectiveness),
      ],
    );
  }
}
