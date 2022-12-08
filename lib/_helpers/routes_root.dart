import 'package:flutter/material.dart';
import 'package:view_project/pages/home_page/home_page.dart';

Map<String, Widget Function(BuildContext)> routesRoot = {
  '/': (context) => const MyHomePage(),

};
