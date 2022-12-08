import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '_helpers/global_snackbar.dart';
import '_helpers/providers_root.dart';
import '_helpers/routes_root.dart';
import '_helpers/theme_data.dart';
import '_helpers/theme_provider.dart';
import '_utils/check_locale.dart';
import 'config/environment.dart';

void main() async {
  const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: Environment.development,
  );

  Environment().initConfig(environment);
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  checkLocale();
  runApp(
    ProvidersRoot(
      app: EasyLocalization(
        child: const MyApp(),
        supportedLocales: const [Locale('ru'), Locale('en'), Locale('kk')],
        path: 'assets/translations',
        startLocale: const Locale('ru'),
        fallbackLocale: const Locale('ru'),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeModel model = context.watch<ThemeModel>();
    bool isDarkMode = model.mode == ThemeMode.dark;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.getThemeConfig(isDarkMode, context),
      key: ValueKey('${context.locale}'),
      title: '',
      scaffoldMessengerKey: snackBarKey,
      initialRoute: '/',
      routes: routesRoot,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}


