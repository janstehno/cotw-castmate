import 'package:collection/collection.dart';
import 'package:cotwcastmate/helpers/json.dart';
import 'package:cotwcastmate/interface/graphics.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/miscellaneous/enums.dart';
import 'package:cotwcastmate/model/connect/fish_lure.dart';
import 'package:cotwcastmate/model/translatables/fish.dart';
import 'package:cotwcastmate/widgets/app/padding.dart';
import 'package:cotwcastmate/widgets/icons/icon.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:cotwcastmate/widgets/title/title.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ListFishLures extends StatelessWidget {
  final Fish _fish;

  const ListFishLures(
    Fish fish, {
    super.key,
  }) : _fish = fish;

  List<FishLure> get _lures => HelperJSON.getFishLures(_fish.id).sorted(FishLure.sortByTechniqueStrength);

  Widget _buildLure(FishLure fishLure) {
    return Row(
      children: [
        Expanded(
          child: WidgetText(
            HelperJSON.getLure(fishLure.lure).name,
            color: Interface.primaryLight,
            style: Style.normal.s16.w400,
          ),
        ),
        Row(children: _buildStrength(fishLure)),
      ],
    );
  }

  Widget _buildDot(int i, FishLure fishLure) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: WidgetIcon.withSize(
        Graphics.getTechniqueIcon(TechniqueType.values.elementAt(i)),
        color: HelperJSON.getLure(fishLure.lure).technique(i)
            ? fishLure.strengthColor()
            : Interface.disabled.withOpacity(0.1),
        size: 15,
      ),
    );
  }

  List<Widget> _buildStrength(FishLure fishLure) {
    return List.generate(4, (i) => _buildDot(i, fishLure));
  }

  List<Widget> _listLures() {
    return _lures.map((e) => _buildLure(e)).toList();
  }

  Widget _buildWidgets() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_lures.isNotEmpty) WidgetTitle(tr("UI:LURES")),
        if (_lures.isNotEmpty) WidgetPadding.h30v20(child: Column(children: _listLures())),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
