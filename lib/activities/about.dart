import 'package:cotwcastmate/generated/assets.gen.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/miscellaneous/utils.dart';
import 'package:cotwcastmate/widgets/app/bar_app.dart';
import 'package:cotwcastmate/widgets/app/padding.dart';
import 'package:cotwcastmate/widgets/app/scaffold.dart';
import 'package:cotwcastmate/widgets/button/button_icon.dart';
import 'package:cotwcastmate/widgets/button/button_text.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:cotwcastmate/widgets/text/text_pattern.dart';
import 'package:cotwcastmate/widgets/title/title.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ActivityAbout extends StatelessWidget {
  const ActivityAbout({
    super.key,
  });

  Widget _buildAbout() {
    return WidgetPadding.a30(
      child: Wrap(
        spacing: 15,
        runSpacing: 15,
        children: [
          WidgetText(
            tr("UI:ABOUT_APP"),
            color: Interface.primaryLight,
            style: Style.normal.s16.w400,
            autoSize: false,
          ),
          WidgetTextPattern(tr("UI:ABOUT_NEKHEBU")),
          WidgetButtonText(
            "Call of the Wild TackleBox",
            color: Interface.primaryDark,
            background: Interface.primary,
            onTap: () => Utils.redirectTo(
              Uri.parse("https://github.com/codeaid.github.io/cotw-tacklebox"),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _listLanguage() {
    return [
      WidgetTitle(tr("UI:LANGUAGE")),
      WidgetPadding.a30(
        child: WidgetText(
          tr("UI:ABOUT_LANGUAGE"),
          color: Interface.primaryLight,
          style: Style.normal.s16.w400,
          autoSize: false,
        ),
      ),
    ];
  }

  List<Widget> _listDonationPlatforms() {
    return [
      WidgetButtonIcon(
        Assets.graphics.icons.paypal,
        color: Interface.primaryDark,
        background: Interface.primary,
        onTap: () => Utils.redirectTo(Uri.parse("https://paypal.me/toastovac")),
      ),
      WidgetButtonIcon(
        Assets.graphics.icons.coffee,
        color: Interface.primaryDark,
        background: Interface.primary,
        onTap: () => Utils.redirectTo(Uri.parse("https://buymeacoffee.com/toastovac")),
      ),
      WidgetButtonIcon(
        Assets.graphics.icons.patreon,
        color: Interface.primaryDark,
        background: Interface.primary,
        onTap: () => Utils.redirectTo(Uri.parse("https://patreon.com/Toastovac")),
      ),
    ];
  }

  List<Widget> _listDonation() {
    return [
      WidgetTitle(tr("UI:DONATION")),
      WidgetPadding.a30(
        child: Wrap(
          spacing: 15,
          runSpacing: 15,
          children: [
            WidgetText(
              tr("UI:ABOUT_DONATION"),
              color: Interface.primaryLight,
              style: Style.normal.s16.w400,
              autoSize: false,
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: _listDonationPlatforms(),
            )
          ],
        ),
      ),
    ];
  }

  Widget _buildWidgets(BuildContext context) {
    return WidgetScaffold(
      appBar: WidgetAppBar(
        tr("UI:ABOUT"),
        context: context,
      ),
      children: [
        _buildAbout(),
        ..._listLanguage(),
        ..._listDonation(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets(context);
}
