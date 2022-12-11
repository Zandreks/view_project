import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './radio_button.dart';

class EditLanguageForm extends StatelessWidget {
  const EditLanguageForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> onChangedLocale(Locale locale) async {
      context.setLocale(locale);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("locale", locale.languageCode);
    }

    return Column(
      children: [
        RadioButton(
          label: tr("edit_language_item_russian"),
          padding: const EdgeInsets.symmetric(horizontal: 0),
          value: const Locale('ru'),
          groupValue: context.locale,
          onChanged: onChangedLocale,
        ),
        RadioButton(
          label: tr("edit_language_item_kazakh"),
          padding: const EdgeInsets.symmetric(horizontal: 0),
          value: const Locale('kk'),
          groupValue: context.locale,
          onChanged: onChangedLocale,
        ),
        RadioButton(
          label: tr("edit_language_item_english"),
          padding: const EdgeInsets.symmetric(horizontal: 0),
          value: const Locale('en'),
          groupValue: context.locale,
          onChanged: onChangedLocale,
        ),
      ],
    );
  }
}
