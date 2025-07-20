import 'package:expriy_deals_vendors/app/modules/common/views/main_bottom_nav_bar.dart';
import 'package:expriy_deals_vendors/app/modules/onboarding/views/onboarding_screen.dart';
import 'package:expriy_deals_vendors/app/utils/get_storage.dart';
import 'package:expriy_deals_vendors/app_binding.dart';
import 'package:expriy_deals_vendors/get_storage.dart';
import 'package:expriy_deals_vendors/translate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const AntoinetteApp());
}

class AntoinetteApp extends StatelessWidget {
  const AntoinetteApp({super.key});

  @override
  Widget build(BuildContext context) {
    String langCode = box.read('language_code') ?? 'en'; // Default to English
    String countryCode = box.read('country_code') ?? 'US'; // Default to US
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          translations: AppTranslations(),
          locale: Locale(langCode, countryCode), // Default: English (en_US)
          fallbackLocale: const Locale('en', 'US'), // Fallback to English (en_US)
          initialBinding: ControllerBinder(),
          debugShowCheckedModeBanner: false,
          title: 'ExpiryDeals Seller',
          theme: ThemeData(
            primaryColor: const Color(0xffA57EA5).withOpacity(0.1),
            inputDecorationTheme: inputDecoration(),
            useMaterial3: true,
            fontFamily: 'Poppins',
            textTheme: const TextTheme(),
          ),
          home: StorageUtil.getData(StorageUtil.userAccessToken) != null
              ? const MainButtonNavbarScreen()
              : const OnboardingScreen(),
        );
      },
    );
  }
}

InputDecorationTheme inputDecoration() {
  return const InputDecorationTheme(
    hintStyle: TextStyle(fontWeight: FontWeight.w300),
    fillColor: Colors.transparent,
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xffCACACA), width: 1),
      borderRadius: BorderRadius.all(Radius.circular(14)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xffCACACA), width: 1),
      borderRadius: BorderRadius.all(Radius.circular(14)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xffCACACA), width: 1),
      borderRadius: BorderRadius.all(Radius.circular(14)),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xffCACACA), width: 1),
      borderRadius: BorderRadius.all(Radius.circular(14)),
    ),
  );
}