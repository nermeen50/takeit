import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:v_room_app/singleton/SettingsSession.dart';
import 'package:v_room_app/utils/Constants.dart';

final localProvider =
    ChangeNotifierProvider<LocalProvider>((ref) => LocalProvider());

class LocalProvider extends ChangeNotifier {
  Locale _appLocale = Locale('ar');

  Locale get appLocal => _appLocale ?? Locale("en");
  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString(Constants.languageCode) == null) {
      _appLocale = Locale('en');
      return Null;
    }
    _appLocale = Locale(prefs.getString(Constants.languageCode));
    notifyListeners();
    return Null;
  }

  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (_appLocale == type) {
      return;
    }
    if (type == Locale("ar")) {
      _appLocale = Locale("ar");
      await prefs.setString(Constants.languageCode, 'ar');
      await prefs.setString(Constants.countryCode, '');
      print('object${_appLocale}');
    } else {
      _appLocale = Locale("en");
      await prefs.setString(Constants.languageCode, 'en');
      await prefs.setString(Constants.countryCode, 'US');
      print('object${_appLocale}');
    }
    SettingsSession.instance().loadLanguage();
    notifyListeners();
  }
}
