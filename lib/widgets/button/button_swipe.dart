import 'package:cotwcastmate/generated/assets.gen.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/widgets/button/button_icon.dart';
import 'package:cotwcastmate/widgets/icon/icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WidgetButtonSwipe extends WidgetButtonIcon {
  const WidgetButtonSwipe(
    super.icon, {
    super.key,
    super.background,
    required super.onTap,
  }) : super(width: 0);

  @override
  double get buttonHeight => super.buttonHeight - 10;

  Widget _buildIcon() {
    return SizedBox(
      width: buttonHeight,
      height: buttonHeight,
      child: WidgetIcon(
        icon,
        color: Interface.primaryLight,
      ),
    );
  }

  Widget _buildArrows() {
    return SpinKitThreeBounce(
      size: buttonHeight,
      itemBuilder: (context, i) {
        if (i == 2) return const SizedBox.shrink();
        return WidgetIcon(
          Assets.graphics.icons.swipeRight,
          color: Interface.primaryLight,
        );
      },
    );
  }

  @override
  Widget buildCenter() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: buttonHeight),
        _buildIcon(),
        const SizedBox(width: 5),
        _buildArrows(),
      ],
    );
  }
}
