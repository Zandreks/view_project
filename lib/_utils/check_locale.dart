import 'package:shared_preferences/shared_preferences.dart';

checkLocale() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getString("locale") == null) {
    prefs.setString("locale", "ru");
  }
}