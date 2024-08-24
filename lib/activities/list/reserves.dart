import 'package:cotwcastmate/activities/detail/reserve.dart';
import 'package:cotwcastmate/activities/list/items.dart';
import 'package:cotwcastmate/helpers/filter.dart';
import 'package:cotwcastmate/model/translatables/reserve.dart';
import 'package:cotwcastmate/widgets/parts/reserve/reserve.dart';
import 'package:flutter/material.dart';

class ListReserves extends ListItems {
  const ListReserves({
    super.key,
  }) : super("UI:RESERVES");

  @override
  ListReservesState createState() => ListReservesState();
}

class ListReservesState extends ListItemsState<Reserve> {
  @override
  List<Reserve> get items => HelperFilter.filterReserves(controller.text).toList();

  @override
  void onTap(Reserve item) {
    Navigator.push(context, MaterialPageRoute(builder: (e) => DetailReserve(reserve: item)));
  }

  @override
  WidgetReserve buildEntry(int i, Reserve item) {
    return WidgetReserve(
      index: i,
      entry: item,
      onTap: () {
        onTap(item);
      },
    );
  }
}
