

import 'package:expriy_deals_vendors/app/utils/app_colors.dart';
import 'package:expriy_deals_vendors/app/utils/assets_path.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryPriceCalulator extends StatelessWidget {
  final String deliveryType;
  final String quantity;
  final String price;
  final VoidCallback minusTap;
  final VoidCallback plusTap;
  const DeliveryPriceCalulator({
    super.key,
    required this.deliveryType,
    required this.quantity,
    required this.price,
    required this.minusTap,
    required this.plusTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 91.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 77.h,
                    width: 75.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AssetsPath.headphone),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(12.r)),
                  ),
                  widthBox8,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        deliveryType,
                        style: GoogleFonts.poppins(fontSize: 14.sp),
                      ),
                      heightBox14,
                      Row(
                        children: [
                          GestureDetector(
                            onTap: minusTap,
                            child: CircleAvatar(
                              radius: 13.r,
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.remove),
                            ),
                          ),
                          widthBox8,
                          Text(
                            quantity,
                            style: GoogleFonts.poppins(fontSize: 21.sp),
                          ),
                          widthBox8,
                          GestureDetector(
                            onTap: plusTap,
                            child: CircleAvatar(
                              radius: 13.r,
                              backgroundColor: AppColors.iconButtonThemeColor,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  price,
                  style: GoogleFonts.poppins(fontSize: 20.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
