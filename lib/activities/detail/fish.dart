import 'package:cotwcastmate/interface/graphics.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/lists/fish/fish_baits.dart';
import 'package:cotwcastmate/lists/fish/fish_habitats.dart';
import 'package:cotwcastmate/lists/fish/fish_hooks.dart';
import 'package:cotwcastmate/lists/fish/fish_lures.dart';
import 'package:cotwcastmate/lists/fish/fish_reserves.dart';
import 'package:cotwcastmate/lists/fish/fish_traits.dart';
import 'package:cotwcastmate/lists/fish/fish_weights.dart';
import 'package:cotwcastmate/miscellaneous/utils.dart';
import 'package:cotwcastmate/model/translatables/fish.dart';
import 'package:cotwcastmate/widgets/app/bar_app.dart';
import 'package:cotwcastmate/widgets/app/divider.dart';
import 'package:cotwcastmate/widgets/app/padding.dart';
import 'package:cotwcastmate/widgets/app/scaffold.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:cotwcastmate/widgets/title/title.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

class DetailFish extends StatelessWidget {
  final Fish _fish;

  const DetailFish({
    super.key,
    required Fish fish,
  }) : _fish = fish;

  Widget _buildSpace() {
    return const SizedBox(height: 3);
  }

  Widget _buildImage() {
    return Container(
      height: 200,
      padding: const EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      child: SimpleShadow(
        sigma: 4,
        child: Image.asset(
          Graphics.getFish(_fish.id),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  Widget _buildName() {
    return WidgetPadding.fromLTRB(
      30,
      10,
      30,
      30,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WidgetText(
            _fish.name.toUpperCase(),
            color: Interface.primary,
            style: Style.normal.s20.w600,
          ),
          _buildSpace(),
          WidgetText(
            _fish.latin ?? tr("UI:LEGENDARY"),
            color: Interface.disabled,
            style: Style.normal.s12.w400i,
          ),
        ],
      ),
    );
  }

  Widget _buildReserves() {
    return WidgetPadding.fromLTRB(
      30,
      30,
      30,
      0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetText(
            tr("UI:RESERVES").toUpperCase(),
            color: Interface.disabled,
            style: Style.normal.s20.w400,
          ),
          _buildSpace(),
          ListFishReserves(_fish),
        ],
      ),
    );
  }

  Widget _buildWeight() {
    return WidgetPadding.fromLTRB(
      30,
      15,
      30,
      30,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetText(
            tr("UI:WEIGHT").toUpperCase(),
            color: Interface.disabled,
            style: Style.normal.s20.w400,
          ),
          _buildSpace(),
          WidgetText(
            "${_fish.minWeight == null ? "" : Utils.removePointZero(_fish.minWeight!)}${_fish.minWeight == null ? "" : " -"} ${Utils.removePointZero(_fish.maxWeight)} ${tr("UI:KG")}",
            color: Interface.primaryLight,
            style: Style.normal.s16.w400,
          ),
        ],
      ),
    );
  }

  List<Widget> _listTraits() {
    return [
      WidgetTitle(tr("UI:TRAITS")),
      WidgetPadding.h30v20(
        child: ListFishTraits(_fish),
      ),
    ];
  }

  List<Widget> _listHabitats() {
    return [
      WidgetTitle(tr("UI:HABITATS")),
      WidgetPadding.h30v20(
        child: ListFishHabitats(_fish),
      ),
    ];
  }

  List<Widget> _listWeightDistribution() {
    return [
      WidgetTitle(tr("UI:WEIGHT_DISTRIBUTION")),
      WidgetPadding.a30(
        child: ListFishWeights(_fish),
      ),
    ];
  }

  List<Widget> _listHookDistribution() {
    return [
      WidgetTitle(tr("UI:HOOK_DISTRIBUTION")),
      WidgetPadding.a30(
        child: ListFishHooks(_fish),
      ),
    ];
  }

  Widget _buildWidgets(BuildContext context) {
    return WidgetScaffold(
      appBar: WidgetAppBar(
        tr("UI:FISH"),
        context: context,
      ),
      children: [
        _buildImage(),
        _buildName(),
        const WidgetDivider(),
        _buildReserves(),
        _buildWeight(),
        ..._listTraits(),
        if (_fish.habitats.isNotEmpty) ..._listHabitats(),
        if (_fish.weights.isNotEmpty) ..._listWeightDistribution(),
        ..._listHookDistribution(),
        ListFishBaits(_fish),
        ListFishLures(_fish),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets(context);
}
