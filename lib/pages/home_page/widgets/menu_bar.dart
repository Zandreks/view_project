import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:view_project/pages/login_page/providers/login_provider.dart';

import '../../../common/radio_button.dart';

class MenuBar extends StatefulWidget {
  const MenuBar({Key? key}) : super(key: key);

  @override
  State<MenuBar> createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  @override
  Widget build(BuildContext context) {
    LoginProvider provider = context.read<LoginProvider>();
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: SvgPicture.asset(
          "assets/icons/menu.svg",
        ),
        items: [
          DropdownMenuItem(
            enabled: false,
            value: "lang",
            child: Row(
              children: [
                Icon(Icons.language, color: fromCssColor("#8B96A5"), size: 22),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  tr('menu_bar_leng'),
                  style: TextStyle(
                      color: fromCssColor('#121F3E'),
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ],
            ),
          ),
          DropdownMenuItem(
            value: "kk",
            child: RadioButton(
              label: tr("edit_language_item_kazakh"),
              padding: const EdgeInsets.symmetric(horizontal: 0),
              value: const Locale('kk'),
              groupValue: context.locale,
              onChanged: onChangedLocale,
            ),
          ),
          DropdownMenuItem(
            value: "ru",
            child: RadioButton(
              label: tr("edit_language_item_russian"),
              padding: const EdgeInsets.symmetric(horizontal: 0),
              value: const Locale('ru'),
              groupValue: context.locale,
              onChanged: onChangedLocale,
            ),
          ),
          DropdownMenuItem(
            value: "logout",
            onTap: () => provider.logout(context),
            child: Row(
              children: [
                Icon(Icons.logout, color: fromCssColor("#8B96A5"), size: 22),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  tr('menu_bar_logout'),
                  style: TextStyle(
                      color: fromCssColor('#121F3E'),
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ],
            ),
          ),
        ],
        onChanged: (value) {},
        itemPadding: const EdgeInsets.only(left: 20, right: 20),
        dropdownWidth: 300,
        dropdownPadding: const EdgeInsets.only(top: 20, bottom: 20),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        dropdownElevation: 8,
        offset: const Offset(0, 8),
      ),
    );
  }

  Future<void> onChangedLocale(Locale locale) async {
    context.setLocale(Locale(locale.languageCode));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("locale", locale.languageCode);
  }
}
