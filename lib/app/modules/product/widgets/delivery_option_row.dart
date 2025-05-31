
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryOptionRow extends StatelessWidget {
  final String name;
  final VoidCallback ontap;
  const DeliveryOptionRow({
    super.key, required this.name, required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: GoogleFonts.poppins(fontSize: 14.sp),
        ),
        Row(
          children: [
            SizedBox(
                width: 68.w,
                child: Text(
                  'All options',
                  style: GoogleFonts.poppins(fontSize: 12.sp),
                )),
            GestureDetector(
              onTap: ontap,
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18.sp,
              ),
            )
          ],
        ),
      ],
    );
  }
}