import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:view_project/_helpers/theme_provider.dart';

class ProvidersRoot extends StatelessWidget {
  ProvidersRoot({Key? key, required this.app}) : super(key: key);
  final Widget app;

  final List<SingleChildWidget> _providers = [
    ChangeNotifierProvider<ThemeModel>(create: (_) => ThemeModel()),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: _providers, child: app);
  }
}
