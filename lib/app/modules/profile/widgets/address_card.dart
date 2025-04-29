
import 'package:expriy_deals_vendors/app/utils/app_colors.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressCardWidget extends StatelessWidget {
  final String name;
  final String address;
  final VoidCallback editOntap;
  final bool isShowBatch;
  const AddressCardWidget({
    super.key,
    required this.name,
    required this.address,
    required this.editOntap,
    required this.isShowBatch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isShowBatch ? 102.h : 80.h,
      width: 353.w,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 12.r,
                        backgroundColor: Color(0xffA57EA5).withAlpha(10),
                        child: Center(
                          child: Icon(
                            Icons.location_pin,
                            color: AppColors.iconButtonThemeColor,
                            size: 18.sp,
                          ),
                        ),
                      ),
                      widthBox8,
                      Text(
                        name,
                        style: GoogleFonts.poppins(fontSize: 14.sp),
                      ),
                    ],
                  ),
                  GestureDetector(
                      onTap: (){
                        //  Navigator.pushNamed(context, AddAdderssScreen.routeName, arguments: name);
                      },
                      child: Icon(
                        Icons.edit_outlined,
                        color: AppColors.iconButtonThemeColor,
                        size: 18.sp,
                      )),
                ],
              ),
              Center(
                  child: Text(
                address,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontSize: 14),
              )),
              heightBox12,
              isShowBatch
                  ? Center(
                      child: Container(
                        height: 24.h,
                        width: 124.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: const Color(0xffD9A48E))),
                        child: Center(
                            child: Text(
                          'Default shipping',
                          style: GoogleFonts.poppins(
                              fontSize: 10.sp, color: Color(0xffD9A48E)),
                        )),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
