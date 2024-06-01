import 'package:collection/collection.dart';
import 'package:cotwcastmate/helpers/json.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/miscellaneous/enums.dart';
import 'package:cotwcastmate/model/connect/fish_bait.dart';
import 'package:cotwcastmate/model/translatables/fish.dart';
import 'package:cotwcastmate/widgets/app/padding.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:cotwcastmate/widgets/title/title.dart';
import 'package:cotwcastmate/widgets/title/title_sub.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ListFishBaits extends StatelessWidget {
  final Fish _fish;

  const ListFishBaits(
    Fish fish, {
    super.key,
  }) : _fish = fish;

  List<FishBait> get _baits => HelperJSON.getFishBaits(_fish.id).sorted(FishBait.sortByStrength);

  Widget _buildBait(FishBait fishBait) {
    return Row(
      children: [
        Expanded(
          child: WidgetText(
            HelperJSON.getBait(fishBait.bait).name,
            color: Interface.primaryLight,
            style: Style.normal.s16.w400,
          ),
        ),
        Row(children: _buildStrength(fishBait)),
      ],
    );
  }

  Widget _buildDot(FishBait fishBait) {
    return Container(
      width: 7,
      height: 7,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: fishBait.strengthColor(),
      ),
    );
  }

  List<Widget> _buildStrength(FishBait fishBait) {
    return List.generate(fishBait.strength, (i) => _buildDot(fishBait));
  }

  List<Widget> _listBaits(List<FishBait> fishBaits) {
    return fishBaits.map((e) => _buildBait(e)).toList();
  }

  List<Widget> _listNatural(List<FishBait> natural) {
    return [
      WidgetSubtitle(tr("TYPE:NATURAL")),
      WidgetPadding.h30v20(child: Column(children: _listBaits(natural))),
    ];
  }

  List<Widget> _listBottom(List<FishBait> bottom) {
    return [
      WidgetSubtitle(tr("TYPE:BOTTOM")),
      WidgetPadding.h30v20(child: Column(children: _listBaits(bottom))),
    ];
  }

  List<Widget> _listLive(List<FishBait> live) {
    return [
      WidgetSubtitle(tr("TYPE:LIVE")),
      WidgetPadding.h30v20(child: Column(children: _listBaits(live))),
    ];
  }

  Widget _buildWidgets() {
    List<FishBait> natural = _baits.where((e) => e.type == BaitType.natural).toList();
    List<FishBait> bottom = _baits.where((e) => e.type == BaitType.bottom).toList();
    List<FishBait> live = _baits.where((e) => e.type == BaitType.live).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (natural.isNotEmpty || bottom.isNotEmpty || live.isNotEmpty) WidgetTitle(tr("UI:BAITS")),
        if (natural.isNotEmpty) ..._listNatural(natural),
        if (bottom.isNotEmpty) ..._listBottom(bottom),
        if (live.isNotEmpty) ..._listLive(live),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
