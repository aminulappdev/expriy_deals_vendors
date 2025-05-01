import 'dart:math';
import 'package:davi/davi.dart';
import 'package:expriy_deals_vendors/app/utils/app_colors.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Data {
  Data({required this.stringValue, required this.intValue});
  final String stringValue;
  final int intValue;
}

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
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
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: Color(0xffFAFAFA),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Colors.grey[300]!,
                      ),
                    ),
                    child: Row(
                      children: [
                        widthBox8,
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 34.h,
                            width: 34.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.iconButtonThemeColor,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.search_rounded,
                                size: 24.h,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        widthBox8,
                        Expanded(
                          child: TextFormField(
                            onChanged: (_) {},
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            heightBox12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Pending',
                      style: TextStyle(color: AppColors.iconButtonThemeColor),
                    ),
                    widthBox8,
                    CircleAvatar(
                      backgroundColor: AppColors.iconButtonThemeColor,
                      radius: 13,
                      child: Icon(Icons.arrow_drop_down_outlined,color: Colors.white,),
                    )
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 13,
                      backgroundColor:
                          AppColors.iconButtonThemeColor.withOpacity(0.10),
                      child: Icon(Icons.visibility,size: 16,),
                    ),
                    widthBox8,
                    CircleAvatar(
                      radius: 13,
                      backgroundColor:
                          AppColors.iconButtonThemeColor.withOpacity(0.10),
                      child: Icon(Icons.delete,size: 16,),
                    ),
                  ],
                )
              ],
            ),
            heightBox12,
            Expanded(child: Davi<Data>(_model)),
          ],
        ),
      ),
    );
  }
}
