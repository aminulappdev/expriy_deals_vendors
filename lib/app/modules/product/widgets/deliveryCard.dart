
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryCard extends StatelessWidget {
  final String deliveryType;
  final String date;
  final String price;
  const DeliveryCard({
    super.key, required this.deliveryType, required this.date, required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 73.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  deliveryType,
                  style: GoogleFonts.poppins(fontSize: 14.sp),
                ),
                heightBox8,
                Text(
                  date,
                  style: GoogleFonts.poppins(fontSize: 12.sp),
                ),
              ],
            ),
            Text(
              price,
              style: GoogleFonts.poppins(fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}