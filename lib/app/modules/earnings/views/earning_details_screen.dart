import 'package:expriy_deals_vendors/app/modules/earnings/model/all_earnings_model.dart';
import 'package:expriy_deals_vendors/app/modules/order/widgets/price_row.dart';
import 'package:expriy_deals_vendors/app/utils/assets_path.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:flutter/material.dart';

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
                  CustomAppBar(name: 'Earning Details'),
                  heightBox12,
                  heightBox10,
                  Row(
                    children: [
                      Container(
                        height: 86,
                        width: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(AssetsPath.headphone),
                                fit: BoxFit.fill)),
                      ),
                      widthBox8,
                      SizedBox(
                        width: 200,
                        height: 76,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Full name : '),
                                Text(widget.allEarningsItemModel.user?.name ??
                                    '',style: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 14),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Email : '),
                                SizedBox(
                                  width: 150,
                                  child: Text(widget.allEarningsItemModel.user?.email ??
                                      '',style: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 14),),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Number : '),
                                Text(widget.allEarningsItemModel.user
                                        ?.phoneNumber ??
                                    'Empty',style: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 14),),
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
                      price: widget.allEarningsItemModel.trnId ?? '',
                      nameSize: 14,
                      priceSize: 14),
                  heightBox10,
                  PriceRow(
                      name: 'A/C holder name:',
                      price: widget.allEarningsItemModel.user?.name ?? '',
                      nameSize: 14,
                      priceSize: 14),
                  heightBox8,
                  PriceRow(
                      name: 'Received amount:',
                      price: widget.allEarningsItemModel.price.toString(),
                      nameSize: 14,
                      priceSize: 14),
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
