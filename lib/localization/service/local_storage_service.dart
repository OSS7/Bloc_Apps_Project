import 'package:shared_preferences/shared_preferences.dart';

class LanguageCacheHelper {
  Future<void> setLanguageCode(String languageCode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("LANG", languageCode);
  }

  Future<String> getLanguageCode() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final langCode = sharedPreferences.getString("LANG");
    if (langCode != null) {
      return langCode;
    } else {
      return "en";
    }
  }
}
