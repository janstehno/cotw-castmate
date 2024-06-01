import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/miscellaneous/utils.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class WidgetTextPattern extends StatelessWidget {
  final String _text;
  final Color? _color;
  final TextAlign? _textAlign;
  final TextStyle? _normalStyle;
  final TextStyle? _patternStyle;

  const WidgetTextPattern(
    String text, {
    super.key,
    Color? color,
    TextAlign? textAlign,
    TextStyle? normalStyle,
    TextStyle? patternStyle,
  })  : _text = text,
        _color = color,
        _textAlign = textAlign,
        _normalStyle = normalStyle,
        _patternStyle = patternStyle;

  EasyRichTextPattern _patternImportant() {
    return EasyRichTextPattern(
        targetString: "(\\*)(.*?)(\\*)",
        matchBuilder: (BuildContext context, RegExpMatch? match) {
          return TextSpan(
            text: match?[0]?.replaceAll("*", ""),
            style: (_patternStyle ?? Style.normal.s16.w600).copyWith(color: Interface.primary),
          );
        });
  }

  EasyRichTextPattern _patternLink() {
    return EasyRichTextPattern(
        targetString: "(\\|)(.*?)(\\|)",
        matchBuilder: (BuildContext context, RegExpMatch? match) {
          String? text = match?[0]?.replaceAll("|", "") ?? "";
          return TextSpan(
            text: text,
            style: (_patternStyle ?? Style.normal.s16.w600).copyWith(
              color: _color ?? Interface.primaryLight,
              decoration: TextDecoration.underline,
              decorationColor: _color ?? Interface.primaryLight,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Utils.redirectTo(Uri.parse(text));
              },
          );
        });
  }

  Widget _buildWidgets() {
    return EasyRichText(
      _text,
      selectable: false,
      textAlign: _textAlign ?? TextAlign.start,
      defaultStyle: (_normalStyle ?? Style.normal.s16.w400).copyWith(color: _color ?? Interface.primaryLight),
      patternList: [
        _patternImportant(),
        _patternLink(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
