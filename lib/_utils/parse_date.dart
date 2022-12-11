import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


String getParseDate(String date,Locale locale) {
  DateTime dateTime = DateFormat('y-M-dTH:m:s.z',locale.languageCode).parse(date);

  DateFormat formatter = DateFormat('d MMMM y H:m',locale.languageCode);
  String formatted = formatter.format(dateTime);
  return formatted;
}

