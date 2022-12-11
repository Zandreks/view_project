import 'package:flutter/material.dart';
import 'package:view_project/pages/home_page/home_page.dart';
import 'package:view_project/pages/login_page/login_page.dart';

Map<String, Widget Function(BuildContext)> routesRoot = {
  '/home': (context) => const MyHomePage(),
  '/login': (context) => const LoginPage(),

};
