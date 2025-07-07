import 'package:expriy_deals_vendors/app/modules/common/controllers/translator_controller.dart';
import 'package:expriy_deals_vendors/app/utils/get_storage.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(TranslationController());

    void changeLanguage(String langCode, String countryCode) {
      var locale = Locale(langCode, countryCode);
      Get.updateLocale(locale);
      box.write('language_code', langCode);
      box.write('country_code', countryCode);
    }

    return Scaffold(
      appBar: AppBar(title: Text('language'.tr)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  languageF('Español', () {
                    
                    changeLanguage('es', 'ES');
                  }),
                  heightBox14,
                  languageF('हिन्दी', () {
                    changeLanguage('hi', 'IN');
                  }),
                  heightBox14,
                  languageF('English', () {
                    changeLanguage('en', 'US');
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget languageF(String text, VoidCallback onTap, {Color? color}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 200,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
