import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './AppLocalizationsDelegate.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static Locale? globalLocale;
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = AppLocalizationsDelegate();

  Map<String, String>? _localizedStrings;

  Future<bool> load() async {
    globalLocale = locale;
    String jsonString = await rootBundle.loadString('assets/Language/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String translate(String key) {
    return _localizedStrings?[key]??"";
  }
}