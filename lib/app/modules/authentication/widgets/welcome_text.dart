
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeText extends StatelessWidget {
  final String title;
  final String subtitle;
  const WelcomeText({
    super.key, required this.title, required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(  
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Text(title,style: GoogleFonts.poppins(fontSize: 24.sp,fontWeight: FontWeight.w600),),
      heightBox12,
      Text(subtitle,style: GoogleFonts.poppins(fontSize: 12.sp,fontWeight: FontWeight.w400),),
    ],);
  }
}