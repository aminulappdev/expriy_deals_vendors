import 'package:expriy_deals_vendors/app/modules/order/widgets/price_row.dart';
import 'package:expriy_deals_vendors/app/utils/assets_path.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetailsScreen extends StatefulWidget {
  final String orderId;
  static const String routeName = '/order-details-screen';
  const OrderDetailsScreen({super.key, required this.orderId});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
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
                  CustomAppBar(name: 'Order Details'),
                  heightBox12,
                  Card(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 60.h,
                                  width: 60.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          image:
                                              AssetImage(AssetsPath.headphone),
                                          fit: BoxFit.fill)),
                                ),
                                widthBox8,
                                SizedBox(
                                  width: 230.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            color: Colors.transparent,
                                            width: 130,
                                            child: Text(
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              'tr',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 15.sp),
                                            ),
                                          ),
                                          Container(
                                            height: 23.h,
                                            width: 70.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                    color: Colors.black12)),
                                            child: Center(
                                                child: Text(
                                              'hg',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.red),
                                            )),
                                          )
                                        ],
                                      ),
                                      heightBox12,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '\$50',
                                            style: GoogleFonts.poppins(
                                                fontSize: 14.sp),
                                          ),
                                          Text(
                                            'Qty: 1',
                                            style: GoogleFonts.poppins(
                                                fontSize: 14.sp),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  heightBox10,
                  Text('Order Id : '),
                  heightBox4,
                  Text('Delivery Address : '),
                  heightBox4,
                  Text('Date : '),
                  heightBox4,
                  Text('Payment Method : '),
                  heightBox30,
                  Text(
                    'Price Details',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  heightBox8,
                  PriceRow(
                      name: 'Price ', price: '10', nameSize: 14, priceSize: 14),
                  heightBox10,
                  PriceRow(
                      name: 'Delivery Fee',
                      price: '50',
                      nameSize: 14,
                      priceSize: 14),
                  heightBox5,
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black,
                  ),
                  heightBox10,
                  PriceRow(
                    name: 'Total',
                    nameSize: 14,
                    priceSize: 14,
                    price: '',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
