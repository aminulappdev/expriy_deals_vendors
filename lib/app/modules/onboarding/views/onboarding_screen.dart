import 'package:expriy_deals_vendors/app/modules/authentication/views/sign_in_screen.dart';

import 'package:expriy_deals_vendors/app/modules/onboarding/views/page_view.dart';
import 'package:expriy_deals_vendors/app/utils/app_colors.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<String> buttonTexts = [
    'onboarding_screen.button_get_started'.tr,
    'onboarding_screen.button_keep_reading'.tr,
    'onboarding_screen.button_begin_first_letter'.tr
  ];

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          heightBox20,
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(
                  () {
                    _currentPage = index;
                  },
                );
              },
              children: [
                OnboardingPage(
                  showBackButton: false,
                  imageHeight: 280,
                  onBoardingRow: false,
                  title: 'onboarding_screen.page1_title'.tr,
                  subtitle: 'onboarding_screen.page1_subtitle'.tr,
                  pageController: _pageController,
                ),
                OnboardingPage(
                  showBackButton: true,
                  imageHeight: 280,
                  onBoardingRow: true,
                  title: 'onboarding_screen.page2_title'.tr,
                  subtitle: 'onboarding_screen.page2_subtitle'.tr,
                  pageController: _pageController,
                ),
                OnboardingPage(
                  showBackButton: true,
                  imageHeight: 280,
                  onBoardingRow: false,
                  title: 'onboarding_screen.page3_title'.tr,
                  subtitle: 'onboarding_screen.page3_subtitle'.tr,
                  pageController: _pageController,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: WormEffect(
                    dotHeight: 12.0.h,
                    dotWidth: 12.0.w,
                    spacing: 10.0,
                    dotColor: Colors.grey,
                    activeDotColor: AppColors.iconButtonThemeColor,
                  ),
                ),
              ],
            ),
          ),
          heightBox100,
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15.0.h),
                child: GestureDetector(
                  onTap: () {
                    if (_currentPage < 2) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Get.to(() => SignInScreen());
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        buttonTexts[_currentPage],
                        style: GoogleFonts.poppins(
                          fontSize: 20.sp,
                          color: AppColors.iconButtonThemeColor,
                        ),
                      ),
                      widthBox4,
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.iconButtonThemeColor,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 2,
                  width: 350,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.white,
                      AppColors.iconButtonThemeColor,
                    ]),
                  ),
                ),
              ),
            ],
          ),
          heightBox20,
        ],
      ),
    );
  }
}