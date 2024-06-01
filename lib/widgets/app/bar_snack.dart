import 'package:flutter/material.dart';
import 'package:cotwcastmate/interface/graphics.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/interface/values.dart';
import 'package:cotwcastmate/miscellaneous/enums.dart';
import 'package:cotwcastmate/widgets/app/blurred.dart';
import 'package:cotwcastmate/widgets/button/button_icon.dart';
import 'package:cotwcastmate/widgets/icons/icon.dart';
import 'package:cotwcastmate/widgets/text/text.dart';

class WidgetSnackBar extends StatelessWidget {
  final String _text;
  final String? _buttonIcon;
  final ProcessType _process;
  final Function? _onButtonTap;

  const WidgetSnackBar({
    super.key,
    required String text,
    String? buttonIcon,
    required ProcessType process,
    Function? onButtonTap,
  })  : _text = text,
        _buttonIcon = buttonIcon,
        _process = process,
        _onButtonTap = onButtonTap;

  double get _height => Values.snackBar;

  Color get _color {
    switch (_process) {
      case ProcessType.success:
        return Interface.snackSuccess;
      case ProcessType.error:
        return Interface.snackError;
      case ProcessType.info:
        return Interface.primaryLight;
    }
  }

  Widget _buildIcon() {
    return WidgetIcon(
      Graphics.getProcessIcon(_process),
      color: _color,
    );
  }

  Widget _buildText() {
    return Container(
      alignment: Alignment.centerLeft,
      child: WidgetText(
        _text,
        color: Interface.primaryDark,
        style: Style.normal.s12.w400,
        maxLines: 2,
      ),
    );
  }

  Widget _buildButton() {
    return WidgetButtonIcon(
      _buttonIcon!,
      color: Interface.primaryDark,
      background: Interface.primary,
      onTap: () => _onButtonTap!(),
    );
  }

  Widget _buildWidgets() {
    return WidgetBlurred(
      height: _height,
      background: Interface.primaryDark,
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildIcon(),
          const SizedBox(width: 15),
          Expanded(child: _buildText()),
          if (_buttonIcon != null) const SizedBox(width: 15),
          if (_buttonIcon != null) _buildButton(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
