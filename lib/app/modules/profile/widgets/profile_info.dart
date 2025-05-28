

import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileInfo extends StatelessWidget {
  final String name;
  final String email;
  final String imagePath;
  const ProfileInfo({
    super.key, required this.name, required this.email, required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25.r,
          backgroundImage: NetworkImage(imagePath,),        
        ),
        widthBox8,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: GoogleFonts.poppins(fontSize: 14.sp),
            ),
            Text(
              email,
              style: GoogleFonts.poppins(
                  fontSize: 12, color: Color(0xff626262)),
            ),
          ],
        )
      ],
    );
  }
}
