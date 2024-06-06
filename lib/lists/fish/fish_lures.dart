import 'package:collection/collection.dart';
import 'package:cotwcastmate/helpers/json.dart';
import 'package:cotwcastmate/interface/graphics.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/lists/fish/fish_tackles.dart';
import 'package:cotwcastmate/miscellaneous/enums.dart';
import 'package:cotwcastmate/model/connect/fish_lure.dart';
import 'package:cotwcastmate/widgets/app/padding.dart';
import 'package:cotwcastmate/widgets/icons/icon.dart';
import 'package:cotwcastmate/widgets/title/title.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

class ListFishLures extends ListFishTackles<FishLure> {
  const ListFishLures(
    super.fish, {
    super.key,
    super.reserve,
  }) : super(tackleType: TackleType.lure);

  @override
  List<FishLure> get getTackles => HelperJSON.getFishLures(fish.id).sorted(FishLure.sortByTechniqueStrength);

  @override
  String getTackleName(FishLure tackle) => HelperJSON.getLure(tackle.tackle).name;

  @override
  Widget buildIcon(FishLure tackle, [int? i]) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: SimpleShadow(
        sigma: 0,
        opacity: 1,
        color: Interface.primaryDark,
        offset: const Offset(0.75, 0.75),
        child: WidgetIcon.withSize(
          Graphics.getTechniqueIcon(TechniqueType.values.elementAt(i!)),
          color: HelperJSON.getLure(tackle.tackle).technique(i)
              ? tackle.strengthColor()
              : Interface.disabled.withOpacity(0.1),
          size: 15,
        ),
      ),
    );
  }

  @override
  Widget buildStrength(FishLure tackle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: List.generate(4, (i) => buildIcon(tackle, i)),
    );
  }

  @override
  Widget buildTackles(List<FishLure> tackles, Map<String, double> effectiveness) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetTitle(tr("UI:LURES")),
        WidgetPadding.h30v20(child: Column(children: listTackles(tackles, effectiveness))),
      ],
    );
  }
}
