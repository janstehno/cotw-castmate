import 'package:cotwcastmate/activities/about.dart';
import 'package:cotwcastmate/activities/list/fish.dart';
import 'package:cotwcastmate/activities/list/reserves.dart';
import 'package:cotwcastmate/activities/settings.dart';
import 'package:cotwcastmate/generated/assets.gen.dart';
import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/interface/values.dart';
import 'package:cotwcastmate/miscellaneous/utils.dart';
import 'package:cotwcastmate/widgets/app/bar_scroll.dart';
import 'package:cotwcastmate/widgets/app/padding.dart';
import 'package:cotwcastmate/widgets/icons/icon.dart';
import 'package:cotwcastmate/widgets/section/home/menu.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:cotwcastmate/widgets/text/text_pattern.dart';
import 'package:cotwcastmate/widgets/text/text_tap.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ActivityHome extends StatefulWidget {
  const ActivityHome({
    super.key,
  });

  @override
  ActivityHomeState createState() => ActivityHomeState();
}

class ActivityHomeState extends State<ActivityHome> {
  final List<List<dynamic>> _menuItems = [
    ["UI:RESERVES", Assets.graphics.icons.reserve, const ListReserves()],
    ["UI:FISH", Assets.graphics.icons.fish, const ListAnimals()],
    ["UI:ABOUT", Assets.graphics.icons.about, const ActivityAbout()],
  ];

  Widget _buildName() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetText(
          "COTW CASTMATE",
          color: Interface.primaryDark,
          style: Style.normal.s24.w800,
        ),
        WidgetText(
          tr("UI:NOT_OFFICIAL").toUpperCase(),
          color: Interface.primaryDark.withOpacity(0.4),
          style: Style.normal.s8.w400,
        ),
        WidgetText(
          Values.version,
          color: Interface.primaryDark.withOpacity(0.4),
          style: Style.normal.s12.w400,
        ),
      ],
    );
  }

  Widget _buildLink(String icon, [Function? onTap]) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap();
      },
      child: WidgetIcon.withSize(
        icon,
        size: 17,
        color: Interface.primaryDark,
      ),
    );
  }

  Widget _buildLinks() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLink(Assets.graphics.icons.post, () => Utils.mailTo()),
            const SizedBox(width: 10),
            _buildLink(
              Assets.graphics.icons.reddit,
              () => Utils.redirectTo(
                Uri.parse("https://www.reddit.com/user/Toastovac/"),
              ),
            ),
            const SizedBox(width: 10),
            _buildLink(
              Assets.graphics.icons.github,
              () => Utils.redirectTo(
                Uri.parse("https://github.com/janstehno/cotw-castmate?tab=readme-ov-file#cotw-castmate"),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return WidgetPadding.a30(
      background: Interface.primaryAccent,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _buildName()),
          _buildLinks(),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String text, String icon, Widget activity) {
    return WidgetSectionMenu(tr(text), icon: icon, onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (e) => activity));
    });
  }

  List<Widget> _listMenuItems() {
    return _menuItems.map((e) => _buildMenuItem(e.elementAt(0), e.elementAt(1), e.elementAt(2))).toList();
  }

  List<Widget> _listMenu() {
    return [
      ..._listMenuItems(),
      _buildMenuItem(
        "UI:SETTINGS",
        Assets.graphics.icons.settings,
        ActivitySettings(callback: () => setState(() {})),
      ),
    ];
  }

  Widget _buildMenu() {
    return WidgetPadding.h30v20(
      alignment: Alignment.bottomLeft,
      child: WidgetScrollBar(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _listMenu(),
          ),
        ),
      ),
    );
  }

  List<Widget> _listOther() {
    return [
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
    ];
  }

  Widget _buildOther() {
    return Container(
      color: Interface.primaryDark.withOpacity(0.8),
      padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _listOther(),
      ),
    );
  }

  Widget _buildDisclaimer() {
    return WidgetPadding.h30v20(
      background: Interface.primaryDark.withOpacity(0.4),
      child: WidgetTextPattern(
        tr("UI:DISCLAIMER"),
        color: Interface.disabled,
        normalStyle: Style.normal.s10.w400,
        patternStyle: Style.normal.s10.w600,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildBackground() {
    return Image.asset(
      Assets.graphics.images.cotw.path,
      fit: BoxFit.cover,
      alignment: Alignment.center,
    );
  }

  Widget _buildShadow() {
    return Container(color: Interface.primaryDark.withOpacity(0.4));
  }

  Widget _buildWidgets() {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          _buildBackground(),
          _buildShadow(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildHeader(),
              Expanded(child: _buildMenu()),
              _buildDisclaimer(),
              _buildOther(),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
