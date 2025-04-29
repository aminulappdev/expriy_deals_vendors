

import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthHeaderText extends StatelessWidget {
  final String title;
  final String subtitle;
  final  double titleFontSize;
  final  double subtitleFontSize;
  final double sizeBoxHeight;

  const AuthHeaderText({
    super.key, required this.title, required this.subtitle, required this.titleFontSize, required this.subtitleFontSize, required this.sizeBoxHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
              fontSize: titleFontSize.sp, fontWeight: FontWeight.w400),
        ),
        heightBox12,
        SizedBox(
          width: sizeBoxHeight.w,
          child: Text(
           subtitle,
            style: GoogleFonts.poppins(
                fontSize: subtitleFontSize.sp, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
