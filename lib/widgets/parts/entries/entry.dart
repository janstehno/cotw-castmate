import 'package:cotwcastmate/miscellaneous/utils.dart';
import 'package:cotwcastmate/miscellaneous/values.dart';
import 'package:cotwcastmate/model/translatables/translatable.dart';
import 'package:cotwcastmate/widgets/app/padding.dart';
import 'package:flutter/material.dart';

abstract class WidgetEntry<I extends Translatable> extends StatelessWidget {
  final int _index;
  final I _entry;
  final Color? _background;
  final Function _onTap;

  const WidgetEntry({
    super.key,
    required int index,
    required I entry,
    Color? background,
    required Function onTap,
  })  : _index = index,
        _entry = entry,
        _background = background,
        _onTap = onTap;

  double get _height => Values.entry;

  I get entry => _entry;

  Widget buildText();

  Widget? buildSubText() {
    return null;
  }

  Widget _buildLeft() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildText(),
        buildSubText() ?? const SizedBox.shrink(),
      ],
    );
  }

  Widget? buildRight() {
    return null;
  }

  Widget _buildRow() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: _buildLeft()),
        buildRight() ?? const SizedBox.shrink(),
      ],
    );
  }

  Widget _buildWidgets() {
    return GestureDetector(
      onTap: () => _onTap(),
      child: SizedBox(
        height: _height,
        child: WidgetPadding.h30(
          background: _background ?? Utils.backgroundAt(_index),
          child: _buildRow(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
