import 'package:collection/collection.dart';
import 'package:cotwcastmate/activities/detail/fish.dart';
import 'package:cotwcastmate/activities/list/items.dart';
import 'package:cotwcastmate/helpers/filter.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/miscellaneous/utils.dart';
import 'package:cotwcastmate/model/translatables/fish.dart';
import 'package:cotwcastmate/widgets/parts/fish/fish.dart';
import 'package:flutter/material.dart';

class ListAnimals extends ListItems {
  const ListAnimals({
    super.key,
  }) : super("UI:FISH");

  @override
  ListAnimalsState createState() => ListAnimalsState();
}

class ListAnimalsState extends ListItemsState<Fish> {
  @override
  List<Fish> get items => HelperFilter.filterFish(controller.text).sorted(Fish.sortByName);

  @override
  void onTap(Fish item) {
    Navigator.push(context, MaterialPageRoute(builder: (e) => DetailFish(fish: item)));
  }

  @override
  WidgetFish buildEntry(int i, Fish item) {
    return WidgetFish(
      index: i,
      entry: item,
      background: item.isLegendary ? Interface.legendary.withOpacity(0.1) : Utils.backgroundAt(i),
      onTap: () {
        focus();
        onTap(item);
      },
    );
  }
}
