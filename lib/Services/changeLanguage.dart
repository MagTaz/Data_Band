import 'package:shared_preferences/shared_preferences.dart';

class ChangeLanguage {
  static Future<String> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('languageCode') ?? 'en';
  }

  static void setLanguage(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('languageCode', languageCode);
  }
}
