import 'package:cotwcastmate/interface/graphics.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/lists/reserve/reserve_fish.dart';
import 'package:cotwcastmate/model/translatables/reserve.dart';
import 'package:cotwcastmate/widgets/app/bar_app.dart';
import 'package:cotwcastmate/widgets/app/padding.dart';
import 'package:cotwcastmate/widgets/app/scaffold.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:cotwcastmate/widgets/title/title.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

class DetailReserve extends StatelessWidget {
  final Reserve _reserve;

  const DetailReserve({
    super.key,
    required Reserve reserve,
  }) : _reserve = reserve;

  Widget _buildSpace() {
    return const SizedBox(height: 3);
  }

  Widget _buildImage() {
    return Container(
      height: 170,
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
      alignment: Alignment.center,
      child: SimpleShadow(
        sigma: 4,
        child: Image.asset(
          Graphics.getReserve(_reserve.id),
          fit: BoxFit.fitHeight,
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
            _reserve.name.toUpperCase(),
            color: Interface.primary,
            style: Style.normal.s20.w600,
          ),
          _buildSpace(),
          WidgetText(
            _reserve.location,
            color: Interface.disabled,
            style: Style.normal.s12.w400i,
          ),
        ],
      ),
    );
  }

  List<Widget> _listFish() {
    return [
      WidgetTitle(tr("UI:FISH")),
      ListReserveFish(_reserve),
    ];
  }

  Widget _buildWidgets(BuildContext context) {
    return WidgetScaffold(
      appBar: WidgetAppBar(
        tr("UI:RESERVES"),
        context: context,
      ),
      children: [
        _buildImage(),
        _buildName(),
        ..._listFish(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets(context);
}
