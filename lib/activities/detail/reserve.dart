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

class DetailReserve extends StatelessWidget {
  final Reserve _reserve;

  const DetailReserve({
    super.key,
    required Reserve reserve,
  }) : _reserve = reserve;

  Widget _buildSpace() {
    return const SizedBox(height: 3);
  }

  /*Widget _buildImage() {
    return SizedBox(
      height: 110,
      child: WidgetMargin.right(
        30,
        child: SimpleShadow(
          sigma: 0,
          child: Stack(
            children: [
              Image.asset(
                Graphics.getFish(_reserve.id),
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }*/

  Widget _buildName() {
    return Container(
      height: 110,
      alignment: Alignment.centerLeft,
      child: WidgetPadding.a30(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: _buildName()),
            //TODO _buildImage(),
          ],
        ),
        ..._listFish(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets(context);
}
