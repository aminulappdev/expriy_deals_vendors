import 'dart:math';
import 'package:davi/davi.dart';
import 'package:expriy_deals_vendors/app/modules/widthraw/views/widthdraw_request_screen.dart';
import 'package:expriy_deals_vendors/app/utils/app_colors.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/gradiant_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class Data {
  Data({required this.stringValue, required this.intValue});
  final String stringValue;
  final int intValue;
}

class WidthdrawScreen extends StatefulWidget {
  const WidthdrawScreen({super.key});

  @override
  State<WidthdrawScreen> createState() => _WidthdrawScreenState();
}

class _WidthdrawScreenState extends State<WidthdrawScreen> {
  late DaviModel<Data> _model;

  @override
  void initState() {
    super.initState();
    final random = Random();
    final rows = List.generate(
      20,
      (i) => Data(
        stringValue: random.nextInt(0xFFFFFF).toRadixString(16).toUpperCase(),
        intValue: random.nextInt(100),
      ),
    );
    _model = DaviModel<Data>(
      rows: rows,
      columns: [
        DaviColumn(name: 'Order ID', cellValue: (p) => p.data.stringValue),
        DaviColumn(name: 'Customer', cellValue: (p) => p.data.intValue),
        DaviColumn(name: 'Product name', cellValue: (p) => p.data.intValue),
        DaviColumn(name: 'Quantity', cellValue: (p) => p.data.intValue),
        DaviColumn(name: 'Status', cellValue: (p) => p.data.intValue),
        DaviColumn(name: 'Amount', cellValue: (p) => p.data.intValue),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Text('Earnings',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
            // CustomAppBar(name: 'Order Details'),
            heightBox12,
            Container(
              height: 192,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // ignore: deprecated_member_use
                color: AppColors.iconButtonThemeColor.withOpacity(0.1)
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Your Balance'),
                    Text('\$1000',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w600),),
                    heightBox12,
                    SizedBox(
                      width: 240,
                      child: CustomElevatedButton(onPressed: () {
                        Get.to(const WidthdrawRequestScreen());
                      }, text: 'Withdraw'),
                    )
                
                  ],
                ),
              ),
            ),
            heightBox12,
            Expanded(child: Davi<Data>(_model)),
          ],
        ),
      ),
    );
  }
}
