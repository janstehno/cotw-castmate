import 'package:cotwcastmate/helpers/json.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/model/translatables/fish.dart';
import 'package:cotwcastmate/model/translatables/reserve.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:flutter/material.dart';

class ListFishReserves extends StatelessWidget {
  final Fish _fish;

  const ListFishReserves(
    Fish fish, {
    super.key,
  }) : _fish = fish;

  List<Reserve> get _reserves => HelperJSON.getFishReserves(_fish.id).toList();

  Widget _buildReserve(Reserve reserve) {
    return WidgetText(
      reserve.name,
      color: Interface.primaryLight,
      style: Style.normal.s16.w400,
    );
  }

  List<Widget> _listReserves() {
    return _reserves.map((e) => _buildReserve(HelperJSON.getReserve(e.id))).toList();
  }

  Widget _buildWidgets() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _listReserves(),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
