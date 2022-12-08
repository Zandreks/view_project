import 'package:flutter/material.dart';

class ThemeConfig {
  static ThemeData getThemeConfig(bool isDarkMode, BuildContext context) {
    RoundedRectangleBorder border = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    );

    return ThemeData(
      primarySwatch: Colors.blue,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding:
        const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(color:isDarkMode?Colors.white: Colors.black, fontSize: 16),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color:isDarkMode?Colors.white: Colors.black),
        shape: Border(
          bottom: BorderSide(color: isDarkMode ? Colors.white24: Colors.black26, width: 1),
        ),
      ),
      scaffoldBackgroundColor: isDarkMode?const Color(0xFF000000) : const Color(0xfff3f3f3),
      cardTheme: CardTheme(elevation: 0, shape: border),
      dividerColor: isDarkMode?Colors.white38: Colors.black38,
      textButtonTheme: TextButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: border,
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: border,
          minimumSize: const Size.fromHeight(56),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: border,
          minimumSize: const Size(56,0),
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: isDarkMode? Colors.black54: Colors.white70,
          ),
        ),
      ),
      primaryColor: isDarkMode ? Colors.black : Colors.white,
      backgroundColor: isDarkMode ? Colors.black : const Color(0xffF1F5FB),
      indicatorColor: isDarkMode ? const Color(0xff0E1D36) : const Color(0xffF1F5FB),
      hintColor: isDarkMode ? const Color(0xffF1F5FB) : const Color(0xff000000),
      highlightColor: isDarkMode ? const Color(0xff372901) : const Color(0xffF1F5FB),
      disabledColor: Colors.grey,
      cardColor: isDarkMode ? const Color(0xFF151515) : Colors.white,
      canvasColor: isDarkMode ? Colors.black : Colors.grey[50],
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkMode ? const ColorScheme.dark() : const ColorScheme.light()),
    );
  }
}
