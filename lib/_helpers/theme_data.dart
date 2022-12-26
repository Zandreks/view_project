import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:from_css_color/from_css_color.dart';

class ThemeConfig {
  static ThemeData getThemeConfig(bool isDarkMode, BuildContext context) {
    RoundedRectangleBorder border = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    );

    return ThemeData(
      primarySwatch: Colors.blue,
      checkboxTheme: CheckboxThemeData(
        side: BorderSide(
          color: fromCssColor('#C6D1DD'),
        ),
        splashRadius: 8
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        hintStyle: TextStyle(
            fontSize: 16.0,
            color: fromCssColor('#A0A0A0'),
            fontWeight: FontWeight.w400),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: fromCssColor('#C6D1DD'), width: 1.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        titleTextStyle: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black, fontSize: 16),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme:
            IconThemeData(color: isDarkMode ? Colors.white : Colors.black),
        shape: Border(
          bottom: BorderSide(
              color: isDarkMode ? Colors.white24 : Colors.black26, width: 0),
        ),
      ),
      scaffoldBackgroundColor:
          isDarkMode ? const Color(0xFF000000) : fromCssColor("#F5F4F7"),
      // cardTheme: CardTheme(elevation: 0, shape: border),
      dividerColor: isDarkMode ? Colors.white38 : Colors.black38,
      textButtonTheme: TextButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: border,
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: border,
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.black54 : Colors.white70,
          ),
        ),
      ),
      primaryColor: isDarkMode ? Colors.black : Colors.white,
      backgroundColor: isDarkMode ? Colors.black : const Color(0xffF1F5FB),
      indicatorColor:
          isDarkMode ? const Color(0xff0E1D36) : const Color(0xffF1F5FB),
      hintColor: isDarkMode ? const Color(0xffF1F5FB) : const Color(0xff000000),
      highlightColor:
          isDarkMode ? const Color(0xff372901) : const Color(0xffF1F5FB),
      disabledColor: Colors.grey,
      cardColor: isDarkMode ? const Color(0xFF151515) : Colors.white,
      canvasColor: isDarkMode ? Colors.black : Colors.grey[50],
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkMode
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
    );
  }
}
