import 'package:get/get.dart';

import '../localization/localization_service.dart';

class LanguageController extends GetxController {
  RxString lang = LocalizationService.langs.first.obs;
  String getLanguageName(String languageCode) {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'fr':
        return 'French';
      case 'ar':
        return 'arabic(عربي)';
      // add more cases for other languages as needed
      default:
        return languageCode;
    }
  }
}