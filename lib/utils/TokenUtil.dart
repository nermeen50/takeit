import 'Constants.dart';
import 'PreferenceManger.dart';

class TokenUtil {
  static String _token = '';

  static Future<void> loadTokenToMemory() async {
    _token = await PreferenceManager.getInstance().getString(Constants.token);
    print("loadTokenToMemory${_token}");
  }

  static String getTokenFromMemory() {
    print("getTokenFromMemory${_token}");

    return _token;
  }

  static void saveToken(String token) {
    PreferenceManager.getInstance().saveString(Constants.token, token);
    print("saveToken${token}");

    loadTokenToMemory();
  }

  static void clearToken() {
    PreferenceManager.getInstance().remove(Constants.token);
    _token = '';
  }
}
