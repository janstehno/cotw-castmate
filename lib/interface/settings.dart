import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends ChangeNotifier {
  static const List<Locale> languageCodes = [
    Locale("en"),
  ];

  final List<String> _languages = [
    "English",
  ];

  late int _language;
  late bool _imperialUnits;
  late SharedPreferences _sharedPreferences;

  Settings({
    required language,
    required imperialUnits,
  }) {
    _language = language;
    _imperialUnits = imperialUnits;
  }

  bool get imperialUnits => _imperialUnits;

  int get language => _language;

  List<String> get languages => _languages;

  Locale getLocale(int i) => languageCodes[i];

  String getLocaleName(int i) => _languages[i];

  Future<void> changeUnits(bool imperialUnits) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _imperialUnits = imperialUnits;
    await _sharedPreferences.setBool("imperialUnits", imperialUnits);
    notifyListeners();
  }

  Future<void> changeLanguage(int languageId) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _language = languageId;
    await _sharedPreferences.setInt("language", languageId);
    notifyListeners();
  }
}
