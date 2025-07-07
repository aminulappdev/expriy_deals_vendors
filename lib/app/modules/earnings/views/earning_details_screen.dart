import 'package:expriy_deals_vendors/app/modules/earnings/model/all_earnings_model.dart';
import 'package:expriy_deals_vendors/app/modules/order/widgets/price_row.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EarningDetailsScreen extends StatefulWidget {
  final AllEarningsItemModel allEarningsItemModel;
  const EarningDetailsScreen({
    super.key,
    required this.allEarningsItemModel,
  });

  @override
  State<EarningDetailsScreen> createState() => _EarningDetailsScreenState();
}

class _EarningDetailsScreenState extends State<EarningDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  heightBox20,
                  CustomAppBar(name: 'earning_details_screen.title'.tr),
                  heightBox12,
                  heightBox10,
                  Row(
                    children: [
                      Container(
                        height: 86.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                              widget.allEarningsItemModel.user?.profile ??
                                  'https://fastly.picsum.photos/id/134/200/300.jpg?hmac=KN18cCDft4FPM0XJpr7EhZLtUP6Z4cZqtF8KThtTvsI',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      widthBox8,
                      SizedBox(
                        width: 200.w,
                        height: 76.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '${'earning_details_screen.full_name'.tr}: ',
                                  style: GoogleFonts.poppins(fontSize: 14.sp),
                                ),
                                Expanded(
                                    child: Text(
                                        widget.allEarningsItemModel.user
                                                ?.name ??
                                            '',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          overflow: TextOverflow.ellipsis,
                                        ))),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '${'earning_details_screen.email'.tr}: ',
                                  style: GoogleFonts.poppins(fontSize: 14.sp),
                                ),
                                Expanded(
                                  child: Text(
                                      widget.allEarningsItemModel.user?.email ??
                                          '',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '${'earning_details_screen.number'.tr}: ',
                                  style: GoogleFonts.poppins(fontSize: 14.sp),
                                ),
                                Expanded(
                                  child: Text(
                                      widget.allEarningsItemModel.user
                                              ?.phoneNumber ??
                                          'Empty',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  heightBox30,
                  Text(
                    'earning_details_screen.price_details'.tr,
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  heightBox8,
                  PriceRow(
                    name: '${'earning_details_screen.transaction_id'.tr}: ',
                    price: widget.allEarningsItemModel.trnId ?? '',
                    nameSize: 14.sp,
                    priceSize: 14.sp,
                  ),
                  heightBox10,
                  PriceRow(
                    name:
                        '${'earning_details_screen.account_holder_name'.tr}: ',
                    price: widget.allEarningsItemModel.user?.name ?? '',
                    nameSize: 14.sp,
                    priceSize: 14.sp,
                  ),
                  heightBox8,
                  PriceRow(
                    name: '${'earning_details_screen.received_amount'.tr}: ',
                    price: widget.allEarningsItemModel.price.toString(),
                    nameSize: 14.sp,
                    priceSize: 14.sp,
                  ),
                  heightBox8,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
