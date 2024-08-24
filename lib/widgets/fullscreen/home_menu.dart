import 'package:cotwcastmate/activities/about.dart';
import 'package:cotwcastmate/activities/list/reserves.dart';
import 'package:cotwcastmate/activities/settings.dart';
import 'package:cotwcastmate/generated/assets.gen.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/miscellaneous/utils.dart';
import 'package:cotwcastmate/miscellaneous/values.dart';
import 'package:cotwcastmate/widgets/app/margin.dart';
import 'package:cotwcastmate/widgets/app/padding.dart';
import 'package:cotwcastmate/widgets/button/button_icon.dart';
import 'package:cotwcastmate/widgets/icon/icon.dart';
import 'package:cotwcastmate/widgets/parts/home/menu.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:cotwcastmate/widgets/text/text_tap.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WidgetHomeMenu extends StatefulWidget {
  final Function _callback;

  const WidgetHomeMenu({
    super.key,
    required Function callback,
  }) : _callback = callback;

  Function get callback => _callback;

  @override
  WidgetHomeMenuState createState() => WidgetHomeMenuState();
}

class WidgetHomeMenuState extends State<WidgetHomeMenu> {
  final List<List<dynamic>> _general = [
    ["UI:RESERVES", Assets.graphics.icons.reserve, const ListReserves()],
  ];

  Widget _buildMenuItem(String text, String icon, Widget activity, BuildContext context) {
    return WidgetSectionMenu(tr(text), icon: icon, onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (e) => activity));
    });
  }

  Widget _buildHeader() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WidgetIcon.withSize(
          Assets.graphics.icons.fish,
          color: Interface.primaryLight,
          size: Values.section - 10,
        ),
        WidgetButtonIcon(
          Assets.graphics.icons.cancel,
          color: Interface.primaryLight,
          background: Interface.transparent,
          onTap: () {
            widget.callback();
          },
        ),
      ],
    );
  }

  List<Widget> _listGeneral() {
    return [
      WidgetMargin.fromLTRB(
        0,
        40,
        0,
        10,
        child: WidgetText(
          tr("UI:GENERAL").toUpperCase(),
          color: Interface.primaryLight,
          style: Style.normal.s24.w600,
        ),
      ),
      ..._general.map((e) => _buildMenuItem(e.elementAt(0), e.elementAt(1), e.elementAt(2), context)),
    ];
  }

  List<Widget> _listUncategorized() {
    return [
      WidgetSectionMenu(tr("UI:SETTINGS"), onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (e) => ActivitySettings(callback: () {
              setState(() {});
            }),
          ),
        );
      }),
      WidgetSectionMenu(tr("UI:ABOUT"), onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (e) => const ActivityAbout()));
      }),
    ];
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        WidgetTextTap(
          tr("UI:WIKI").toUpperCase(),
          color: Interface.primaryLight.withOpacity(0.8),
          style: Style.normal.s8.w600,
          onTap: () => Utils.redirectTo(
            Uri.parse("https://github.com/janstehno/cotw-castmate/wiki"),
          ),
        ),
        const SizedBox(width: 10),
        WidgetTextTap(
          tr("UI:PATCH_NOTES").toUpperCase(),
          color: Interface.primaryLight.withOpacity(0.8),
          style: Style.normal.s8.w600,
          onTap: () => Utils.redirectTo(
            Uri.parse("https://github.com/janstehno/cotw-castmate/wiki/Patch-notes"),
          ),
        ),
        const SizedBox(width: 10),
        WidgetTextTap(
          tr("UI:IDEAS").toUpperCase(),
          color: Interface.primaryLight.withOpacity(0.8),
          style: Style.normal.s8.w600,
          onTap: () => Utils.redirectTo(
            Uri.parse("https://github.com/janstehno/cotw-castmate/discussions"),
          ),
        ),
        const SizedBox(width: 10),
        WidgetTextTap(
          tr("UI:ISSUES").toUpperCase(),
          color: Interface.primaryLight.withOpacity(0.8),
          style: Style.normal.s8.w600,
          onTap: () => Utils.redirectTo(
            Uri.parse("https://github.com/janstehno/cotw-castmate/issues"),
          ),
        ),
      ],
    );
  }

  List<Widget> _listItems(BuildContext context) {
    return [
      _buildHeader(),
      ..._listGeneral(),
      const SizedBox(height: 30),
      ..._listUncategorized(),
      const SizedBox(height: 30),
      _buildFooter(),
      const SizedBox(height: 15),
    ];
  }

  Widget _buildBackground() {
    return Image.asset(
      Assets.graphics.images.blue.path,
      fit: BoxFit.cover,
      alignment: Alignment.center,
    );
  }

  Widget _buildShadow() {
    return Container(color: Interface.primaryDark.withOpacity(0.4));
  }

  Widget _buildList() {
    return Container(
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        child: WidgetPadding.all(
          40,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _listItems(context),
          ),
        ),
      ),
    );
  }

  Widget _buildWidgets(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _buildBackground(),
        _buildShadow(),
        _buildList(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets(context);
}
