
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'ar.dart';
import 'en.dart';
import 'fr.dart';

class LocalizationService extends Translations {
  // Default locale
  static final locale = Locale('en');

  // fallbackLocale saves the day when the locale gets in trouble
  static final fallbackLocale = Locale('en');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'French',
    'English',
    'arabic(عربي)'.tr,
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    Locale('fr'),
    Locale('en'),
    Locale('ar'),
  ];

  // Keys and their translations
  // Translations are separated maps in lang file
  @override
  Map<String, Map<String, String>> get keys => {
        'fr': frTranslation,
        'en': enTranslation,
        'ar': arTranslation,
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
  }

  // Finds language in langs list and returns it as Locale
  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale!;
  }
}