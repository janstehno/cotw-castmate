import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends ChangeNotifier {
  static const List<Locale> languageCodes = [
    Locale("en"),
    Locale("es"),
    Locale("fr"),
  ];

  final List<String> _languages = [
    "English",
    "Español",
    "Français",
  ];

  late int _language;
  late bool _imperialUnits;
  late bool _tackleEffectiveness;
  late bool _tackleTrophyRange;
  late SharedPreferences _sharedPreferences;

  Settings({
    required language,
    required imperialUnits,
    required tackleEffectiveness,
    required tackleTrophyRange,
  })  : _language = language,
        _imperialUnits = imperialUnits,
        _tackleEffectiveness = tackleEffectiveness,
        _tackleTrophyRange = tackleTrophyRange;

  bool get imperialUnits => _imperialUnits;

  bool get tackleEffectiveness => _tackleEffectiveness;

  bool get tackleTrophyRange => _tackleTrophyRange;

  int get language => _language;

  List<String> get languages => _languages;

  Locale getLocale(int i) => languageCodes[i];

  String getLocaleName(int i) => _languages[i];

  Future<void> changeLanguage(int languageId) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _language = languageId;
    await _sharedPreferences.setInt("language", languageId);
    notifyListeners();
  }

  Future<void> changeUnits(bool imperialUnits) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _imperialUnits = imperialUnits;
    await _sharedPreferences.setBool("imperialUnits", imperialUnits);
    notifyListeners();
  }

  Future<void> changeTackleEffectiveness() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _tackleEffectiveness = !_tackleEffectiveness;
    await _sharedPreferences.setBool("tackleEffectiveness", _tackleEffectiveness);
    notifyListeners();
  }

  Future<void> changeTackleTrophyRange() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _tackleTrophyRange = !_tackleTrophyRange;
    await _sharedPreferences.setBool("tackleTrophyRange", _tackleTrophyRange);
    notifyListeners();
  }
}
