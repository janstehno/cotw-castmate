import 'package:cotwcastmate/interface/interface.dart';
import 'package:flutter/material.dart';

class WidgetDivider extends StatelessWidget {
  const WidgetDivider({
    super.key,
  });

  Widget _buildWidgets() {
    return Container(
      height: 2,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, Interface.primaryLight.withValues(alpha: 0.2), Colors.transparent],
          stops: const [0, 0.5, 1],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
