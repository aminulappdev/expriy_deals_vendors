
import 'package:expriy_deals_vendors/app/utils/app_colors.dart';
import 'package:expriy_deals_vendors/app/utils/assets_path.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool onBoardingRow;
  final bool showBackButton;
  final double imageHeight;
  final PageController pageController; 

  const OnboardingPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onBoardingRow,
    required this.imageHeight,
    required this.showBackButton,
    required this.pageController, 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            heightBox20,
            // Visibility(
            //   visible: !showBackButton,
            //   replacement: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       GestureDetector(
            //         onTap: () {          
            //           pageController.previousPage(
            //             duration: Duration(milliseconds: 300),
            //             curve: Curves.easeInOut,
            //           );
            //         },
            //         child: CircleAvatar(
            //           backgroundColor: AppColors.iconButtonThemeColor,
            //           radius: 24.r,
            //           child: Icon(
            //             Icons.arrow_back,
            //           ),
            //         ),
            //       ),
            //       GestureDetector(
            //         onTap: () {
            //           // Navigator.pushNamed(context, MainButtonNavbarScreen.routeName);
            //         },
            //         child: Text(
            //           'Skip',
            //           style: GoogleFonts.poppins(
            //             fontSize: 16.sp,
            //             color: AppColors.iconButtonThemeColor,
            //             fontWeight: FontWeight.w400,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            //   child: Align(
            //     alignment: Alignment.centerRight,
            //     child: GestureDetector(
            //       onTap: () {
            //           // Navigator.pushNamed(context, SignInScreen.routeName);
            //       },
            //       child: Text(
            //         'Skip',
            //         style: GoogleFonts.poppins(
            //           fontSize: 16.sp,
            //           color: AppColors.iconButtonThemeColor,
            //           fontWeight: FontWeight.w400,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            heightBox100,
            heightBox24,
            Column(
              children: [
                Image(image: AssetImage(AssetsPath.onboarding),height: imageHeight, width: imageHeight,fit: BoxFit.fill,),
                Text(
                    title,
                    style: TextStyle(
                        fontFamily: 'Cormorant Garamond', fontSize: 24.sp),
                    textAlign: TextAlign.center,
                  ),
                   Text(
                    subtitle,
                    style: TextStyle(
                        fontFamily: 'Cormorant Garamond', fontSize: 12.sp),
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
        
           
          ],
        ),
      ),
    );
  }
}
