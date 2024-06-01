import 'package:flutter/material.dart';
import 'package:cotwcastmate/interface/interface.dart';

class WidgetDivider extends StatelessWidget {
  const WidgetDivider({
    super.key,
  });

  Widget _buildWidgets() {
    return Container(
      height: 2,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, Interface.primaryLight.withOpacity(0.2), Colors.transparent],
          stops: const [0, 0.5, 1],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
