import 'package:cotwcastmate/interface/interface.dart';
import 'package:cotwcastmate/interface/settings.dart';
import 'package:cotwcastmate/interface/style.dart';
import 'package:cotwcastmate/widgets/app/bar_app.dart';
import 'package:cotwcastmate/widgets/app/padding.dart';
import 'package:cotwcastmate/widgets/app/scaffold.dart';
import 'package:cotwcastmate/widgets/handling/drop_down.dart';
import 'package:cotwcastmate/widgets/handling/drop_down_item.dart';
import 'package:cotwcastmate/widgets/section/section_indicator_tap_align.dart';
import 'package:cotwcastmate/widgets/text/text.dart';
import 'package:cotwcastmate/widgets/title/title.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActivitySettings extends StatefulWidget {
  final Function _callback;

  const ActivitySettings({
    super.key,
    required Function callback,
  }) : _callback = callback;

  Function get callback => _callback;

  @override
  ActivitySettingsState createState() => ActivitySettingsState();
}

class ActivitySettingsState extends State<ActivitySettings> {
  Settings get _settings => Provider.of<Settings>(context, listen: false);

  DropdownMenuItem _buildDropdownItem(String language) {
    return WidgetDropDownItem(
      text: _settings.getLocaleName(_settings.languages.indexOf(language)),
      value: _settings.languages.indexOf(language),
    );
  }

  List<DropdownMenuItem> _listLanguages() {
    return _settings.languages.map((e) => _buildDropdownItem(e)).toList();
  }

  List<Widget> _listLanguage() {
    return [
      WidgetTitle(tr("UI:LANGUAGE")),
      WidgetDropDown(
        value: _settings.language,
        items: _listLanguages(),
        onChange: (dynamic value) {
          setState(() {
            _settings.changeLanguage(value);
            EasyLocalization.of(context)!.setLocale(_settings.getLocale(value));
            widget.callback();
          });
        },
      ),
    ];
  }

  Widget _buildUnitsMetric() {
    return WidgetSectionTapAlign(
      tr("UI:UNITS_METRIC"),
      indicatorRight: false,
      active: !(_settings.imperialUnits),
      onTap: () {
        setState(() {
          _settings.changeUnits(false);
        });
      },
    );
  }

  Widget _buildUnitsImperials() {
    return WidgetSectionTapAlign(
      tr("UI:UNITS_IMPERIAL"),
      active: _settings.imperialUnits,
      onTap: () {
        setState(() {
          _settings.changeUnits(true);
        });
      },
    );
  }

  List<Widget> _listUnits() {
    return [
      WidgetTitle(tr("UI:UNITS")),
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: _buildUnitsMetric()),
          Expanded(child: _buildUnitsImperials()),
        ],
      )
    ];
  }

  Widget _buildTackleEffectivenessDescription() {
    return WidgetPadding.h30(
      child: WidgetText(
        tr("UI:TACKLE_EFFECTIVENESS_DESCRIPTION"),
        color: Interface.disabled,
        style: Style.normal.s12.w400,
        autoSize: false,
      ),
    );
  }

  List<Widget> _listTackleEffectiveness() {
    return [
      WidgetSectionTapAlign(
        tr("UI:TACKLE_EFFECTIVENESS"),
        active: _settings.tackleEffectiveness,
        indicatorRight: false,
        onTap: () {
          setState(() {
            _settings.changeTackleEffectiveness();
          });
        },
      ),
      _buildTackleEffectivenessDescription(),
    ];
  }

  Widget _buildTackleTrophyDistributionDescription() {
    return WidgetPadding.h30(
      child: WidgetText(
        tr("UI:TACKLE_TROPHY_RANGE_DESCRIPTION"),
        color: Interface.disabled,
        style: Style.normal.s12.w400,
        autoSize: false,
      ),
    );
  }

  List<Widget> _listTackleTrophyRange() {
    return [
      WidgetSectionTapAlign(
        tr("UI:TACKLE_TROPHY_RANGE"),
        active: _settings.tackleTrophyRange,
        indicatorRight: false,
        onTap: () {
          setState(() {
            _settings.changeTackleTrophyRange();
          });
        },
      ),
      _buildTackleTrophyDistributionDescription(),
    ];
  }

  Widget _buildWidgets() {
    return WidgetScaffold(
      appBar: WidgetAppBar(
        tr("UI:SETTINGS"),
        context: context,
      ),
      children: [
        ..._listLanguage(),
        ..._listUnits(),
        WidgetTitle(tr("UI:INTERFACE")),
        ..._listTackleEffectiveness(),
        ..._listTackleTrophyRange(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidgets();
}
