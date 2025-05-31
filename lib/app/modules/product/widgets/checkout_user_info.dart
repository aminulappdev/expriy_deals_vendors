
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutUserInfo extends StatelessWidget {
  final String name;
  final String number;
  final String status;
  final String address;
  final String city;
  final String zipcode;
  final String country;
  final VoidCallback editOntap;
  final VoidCallback addressArrowOntap;
  const CheckoutUserInfo({
    super.key,
    required this.name,
    required this.number,
    required this.status,
    required this.address,
    required this.editOntap,
    required this.addressArrowOntap,
    required this.city,
    required this.zipcode,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: GoogleFonts.poppins(
                  fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
            Text(
              number,
              style: GoogleFonts.poppins(
                  fontSize: 10.sp, color: Color(0xff626262)),
            ),
            heightBox8,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      size: 18,
                    ),
                    widthBox4,
                    SizedBox(
                        width: 170,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              address,
                              style: GoogleFonts.poppins(fontSize: 10.sp),
                            ),
                            Text(
                              'City : $city',
                              style: GoogleFonts.poppins(fontSize: 10.sp),
                            ),
                            Text(
                              'Zipcode : $zipcode',
                              style: GoogleFonts.poppins(
                                fontSize: 10.sp,
                              ),
                            ),
                            Text(
                              'Country : $country',
                              style: GoogleFonts.poppins(
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
