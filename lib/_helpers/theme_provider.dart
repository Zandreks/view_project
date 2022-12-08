import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModel with ChangeNotifier {
  ThemeMode? _mode;

  ThemeMode? get mode => _mode;

  ThemeModel() {
    checkTheme();
  }

  Future<void> toggleMode() async {
    _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    bool isDarkMode = _mode == ThemeMode.dark;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isDarkMode", isDarkMode);
    notifyListeners();
  }

  Future<void> checkTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDarkMode = prefs.getBool("isDarkMode");
    if (isDarkMode != null && isDarkMode == true) {
      _mode = ThemeMode.dark;
      notifyListeners();
    } else {
      _mode = ThemeMode.light;
      notifyListeners();
    }
  }
}
