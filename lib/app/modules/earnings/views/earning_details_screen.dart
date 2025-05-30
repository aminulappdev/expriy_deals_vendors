import 'package:expriy_deals_vendors/app/modules/order/widgets/price_row.dart';
import 'package:expriy_deals_vendors/app/utils/assets_path.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:flutter/material.dart';


class EarningDetailsScreen extends StatefulWidget {
  final String orderId;
  const EarningDetailsScreen({super.key, required this.orderId});

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
                  CustomAppBar(name: 'Earning Details'),
                  heightBox12,
                  heightBox10,
                  Row(
                    children: [
                      Container(
                        height: 86,
                        width: 122,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(AssetsPath.headphone),
                                fit: BoxFit.fill)),
                      ),
                      widthBox8,
                      SizedBox(
                        width: 220,
                        height: 76,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Full name : '),
                                Text('Md Aminul Islam'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Email : '),
                                Text('aminul@gmail.com'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Number : '),
                                Text('0197564512'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  heightBox30,
                  Text(
                    'Price Details',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  heightBox8,
                  PriceRow(
                      name: 'Transaction ID : ',
                      price: '10',
                      nameSize: 14,
                      priceSize: 14),
                  heightBox10,
                  PriceRow(
                      name: 'A/C holder name:',
                      price: '50',
                      nameSize: 14,
                      priceSize: 14),
                  heightBox8,
                  PriceRow(
                      name: 'A/C number:',
                      price: '10',
                      nameSize: 14,
                      priceSize: 14),
                  heightBox8,
                  PriceRow(
                      name: 'Received amount:',
                      price: '10',
                      nameSize: 14,
                      priceSize: 14),
                  heightBox8,
                  PriceRow(
                      name: 'Detect Percentage:',
                      price: '10',
                      nameSize: 14,
                      priceSize: 14),
                  heightBox8,
                  PriceRow(
                      name: 'Final Amount:',
                      price: '10',
                      nameSize: 14,
                      priceSize: 14),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
