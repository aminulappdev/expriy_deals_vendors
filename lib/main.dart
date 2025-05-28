import 'package:expriy_deals_vendors/app/modules/onboarding/views/onboarding_screen.dart';
import 'package:expriy_deals_vendors/app_binding.dart';
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
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          initialBinding: ControllerBinder(),
          debugShowCheckedModeBanner: false,
          title: 'expriy-deals',
          theme: ThemeData(
            primaryColor: Color(0xffA57EA5).withOpacity(0.1),      
            inputDecorationTheme: inputDecoration(),
            useMaterial3: true,
            fontFamily: 'Poppins',
            textTheme: TextTheme(),
            
          ),
        home: OnboardingScreen(),
        );
      },
    );
  }
}

InputDecorationTheme inputDecoration() {
  return InputDecorationTheme(
    hintStyle: const TextStyle(fontWeight: FontWeight.w300),
    fillColor: Colors.transparent,
    filled: true,
    border: inputBorder(),
    enabledBorder: inputBorder(),
    focusedBorder: inputBorder(),
    errorBorder: inputBorder(),
  );
}

OutlineInputBorder inputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(color: const Color(0xffCACACA), width: 1),
    borderRadius: BorderRadius.circular(14),
  );
}
