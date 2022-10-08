
import 'package:v_room_app/utils/Constants.dart';
import 'package:v_room_app/utils/PreferenceManger.dart';

class SettingsSession {
  static final SettingsSession _instance = SettingsSession._internal();
  String _languageCode = 'en';

  void loadLanguage() {
    PreferenceManager.getInstance()
        .getString(Constants.languageCode)
        .then((value) {
      if (value == null || value.isEmpty) {
        PreferenceManager.getInstance()
            .saveString(Constants.languageCode, 'en');
        _languageCode = 'en';
      } else {
        _languageCode = value;
      }
    });
  }

  String get languageCode => _languageCode;

  void changeLangugeCode(String lang) {
    _languageCode = lang;
  }

  static SettingsSession instance() {
    return _instance;
  }

  void destroy() {}

  SettingsSession._internal();
}
