import 'package:cotwcastmate/widgets/title/title.dart';
import 'package:flutter/material.dart';

class WidgetTitleTap extends WidgetTitle {
  final Function _onTap;

  const WidgetTitleTap(
    super.text, {
    super.key,
    required Function onTap,
  }) : _onTap = onTap;

  @override
  Widget buildWidgets() {
    return GestureDetector(
      onTap: () => _onTap(),
      child: super.buildWidgets(),
    );
  }

  @override
  Widget build(BuildContext context) => buildWidgets();
}
