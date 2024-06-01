import 'package:collection/collection.dart';
import 'package:cotwcastmate/helpers/json.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/model/translatables/fish.dart';
import 'package:cotwcastmate/model/translatables/habitat.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:flutter/material.dart';

class ListFishHabitats extends StatelessWidget {
  final Fish _fish;

  const ListFishHabitats(
    Fish fish, {
    super.key,
  }) : _fish = fish;

  List<Habitat> get _habitats => _fish.habitats.map((e) => HelperJSON.getHabitat(e)).sorted(Habitat.sortByType);

  Widget _buildHabitat(Habitat habitat) {
    return WidgetText(
      habitat.name,
      color: Interface.primaryLight,
      style: Style.normal.s16.w400,
    );
  }

  List<Widget> _listHabitats() {
    return _habitats.map((e) => _buildHabitat(e)).toList();
  }

  Widget _buildWidgets() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _listHabitats(),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
