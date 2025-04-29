

import 'package:expriy_deals_vendors/app/utils/app_colors.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDrawerFeature extends StatelessWidget {
  final String feature;
  final IconData icon;
  final VoidCallback ontap ;
  const ProfileDrawerFeature({
    super.key,
    required this.feature,
    required this.icon,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 8.h),
      child: InkWell(
        onTap: ontap,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 16.r,
                      backgroundColor: AppColors.iconButtonThemeColor.withAlpha(20),
                      child: Center(
                        child: Icon(
                          icon,
                          color: AppColors.iconButtonThemeColor,
                          size: 18.sp,
                        ),
                      ),
                    ),
                    widthBox8,
                    Text(
                      feature,
                      style: GoogleFonts.poppins(fontSize: 14.sp,fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
            heightBox4,
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
