import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

class TitleHead extends StatelessWidget {
  const TitleHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 90, bottom: 60),
      child: Text(
        tr("login_page_title").toUpperCase(),
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 24,
            color: fromCssColor('#3C4E77'),
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
