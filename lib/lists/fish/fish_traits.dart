import 'package:collection/collection.dart';
import 'package:cotwcastmate/helpers/json.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/model/translatables/fish.dart';
import 'package:cotwcastmate/model/translatables/trait.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:flutter/material.dart';

class ListFishTraits extends StatelessWidget {
  final Fish _fish;

  const ListFishTraits(
    Fish fish, {
    super.key,
  }) : _fish = fish;

  List<Trait> get _traits => _fish.traits.map((e) => HelperJSON.getTrait(e)).sorted(Trait.sortByName);

  Widget _buildTrait(Trait trait) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetText(
          trait.name,
          color: Interface.primaryLight,
          style: Style.normal.s16.w400,
        ),
        WidgetText(
          trait.description,
          color: Interface.disabled,
          style: Style.normal.s10.w400,
          autoSize: false,
        ),
        const SizedBox(height: 3),
      ],
    );
  }

  List<Widget> _listTraits() {
    return _traits.map((e) => _buildTrait(e)).toList();
  }

  Widget _buildWidgets() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _listTraits(),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
