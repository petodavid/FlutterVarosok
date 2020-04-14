import 'package:flutter/material.dart';
import 'package:flutter_device_locale/flutter_device_locale.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguage extends ChangeNotifier {
  Locale _appLocale;

  Locale get appLocal => _appLocale ?? Locale("en");

  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = await DeviceLocale.getCurrentLocale();
      return Null;
    }
    _appLocale = Locale(prefs.getString('language_code'));
    return Null;
  }

  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (_appLocale.languageCode == type.languageCode) {
      return;
    }
    if (type == Locale("en")) {
      _appLocale = Locale("en");
      await prefs.setString('language_code', 'en');
      notifyListeners();
      return;
    } else if (type == Locale("hu")) {
      _appLocale = Locale("hu");
      await prefs.setString('language_code', 'hu');
      notifyListeners();
      return;
    }
    _appLocale = Locale("en");
    await prefs.setString('language_code', 'en');
    notifyListeners();
  }
}
