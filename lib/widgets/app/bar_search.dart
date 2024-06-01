import 'package:cotwcastmate/generated/assets.gen.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/values.dart';
import 'package:cotwcastmate/widgets/app/padding.dart';
import 'package:cotwcastmate/widgets/icons/icon.dart';
import 'package:cotwcastmate/widgets/text/text_field.dart';
import 'package:flutter/material.dart';

class WidgetSearchBar extends StatelessWidget {
  final TextEditingController _controller;

  const WidgetSearchBar({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;

  double get _height => Values.searchBar;

  Widget _buildSearchIcon() {
    return WidgetIcon(
      Assets.graphics.icons.search,
      color: Interface.primaryLight,
    );
  }

  Widget _buildTextField() {
    return Container(
      height: _height,
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: WidgetTextField(controller: _controller),
    );
  }

  Widget _buildRemoveIcon() {
    return GestureDetector(
      onTap: () => _controller.text = "",
      child: WidgetIcon.withSize(
        Assets.graphics.icons.cancel,
        color: Interface.disabled,
        size: 15,
      ),
    );
  }

  Widget _buildWidgets() {
    return WidgetPadding.h30(
      background: Interface.primaryAccentDarker,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildSearchIcon(),
          Expanded(child: _buildTextField()),
          _buildRemoveIcon(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
