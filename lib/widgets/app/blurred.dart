import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

class WidgetBlurred extends StatelessWidget {
  final Widget _child;
  final double? _width;
  final double? _height;
  final Color _background;
  final EdgeInsets _padding;
  final BorderRadius _borderRadius;

  const WidgetBlurred({
    super.key,
    required Widget child,
    double? width,
    double? height,
    Color background = Colors.transparent,
    EdgeInsets padding = const EdgeInsets.all(0),
    BorderRadius borderRadius = const BorderRadius.all(Radius.zero),
  })  : _child = child,
        _width = width,
        _height = height,
        _background = background,
        _padding = padding,
        _borderRadius = borderRadius;

  Widget _buildWidgets() {
    return BlurryContainer(
      blur: 10,
      width: _width,
      height: _height,
      color: _background,
      padding: _padding,
      borderRadius: _borderRadius,
      elevation: 1,
      child: _child,
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
