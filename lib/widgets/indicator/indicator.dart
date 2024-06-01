import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cotwcastmate/generated/assets.gen.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/values.dart';

class WidgetIndicator extends StatelessWidget {
  final bool _active;

  const WidgetIndicator({
    super.key,
    required bool active,
  }) : _active = active;

  double get _size => Values.indicatorSize;

  Widget _buildCheck() {
    if (_active) {
      return SvgPicture.asset(
        Assets.graphics.icons.check,
        colorFilter: const ColorFilter.mode(Interface.primaryDark, BlendMode.srcIn),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildWidgets() {
    return AnimatedContainer(
      width: _size,
      height: _size,
      padding: const EdgeInsets.all(3),
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: _active ? Interface.primary : Interface.disabled,
        borderRadius: BorderRadius.circular(5),
      ),
      child: _buildCheck(),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
