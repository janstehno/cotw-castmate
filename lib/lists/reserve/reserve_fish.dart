import 'package:collection/collection.dart';
import 'package:cotwcastmate/builders/fish.dart';
import 'package:cotwcastmate/helpers/json.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/miscellaneous/utils.dart';
import 'package:cotwcastmate/model/translatables/fish.dart';
import 'package:cotwcastmate/model/translatables/reserve.dart';
import 'package:cotwcastmate/widgets/parts/fish/fish.dart';
import 'package:flutter/material.dart';

class ListReserveFish extends StatelessWidget {
  final Reserve _reserve;

  const ListReserveFish(
    Reserve reserve, {
    super.key,
  }) : _reserve = reserve;

  List<Fish> get _fish => HelperJSON.getReserveFish(_reserve.id).sorted(Fish.sortByName);

  Widget _buildFish(BuildContext context, int index, Fish fish) {
    return WidgetFish(
      index: index,
      entry: fish,
      background: fish.isLegendary ? Interface.legendary.withOpacity(0.1) : Utils.backgroundAt(_fish.indexOf(fish)),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => BuilderFish(fish: fish)));
      },
    );
  }

  List<Widget> _listFish(BuildContext context) {
    return _fish.mapIndexed((i, e) => _buildFish(context, i, e)).toList();
  }

  Widget _buildWidgets(BuildContext context) {
    return Column(children: _listFish(context));
  }

  @override
  Widget build(BuildContext context) => _buildWidgets(context);
}
