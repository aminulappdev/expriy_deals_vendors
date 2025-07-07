import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TranslationController extends GetxController {
  var locale = const Locale('en', 'US').obs;
  final box = GetStorage();

  TranslationController() {
    // Load saved language preference on initialization
    final savedLanguage = box.read('languageCode');
    final savedCountry = box.read('countryCode');
    if (savedLanguage != null && savedCountry != null) {
      locale.value = Locale(savedLanguage, savedCountry);
    }
  }

  void changeLanguage(String languageCode, String countryCode) {
    locale.value = Locale(languageCode, countryCode);
    Get.updateLocale(locale.value);
    // Save language preference
    box.write('languageCode', languageCode);
    box.write('countryCode', countryCode);
  }
}