// ignore_for_file: deprecated_member_use

import 'package:expriy_deals_vendors/app/modules/order/controllers/order_details_controller.dart';
import 'package:expriy_deals_vendors/app/utils/app_colors.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final OrderDetailsController orderDetailsController =
      Get.find<OrderDetailsController>();

  @override
  void initState() {
    super.initState();
    // Fetch order details when the screen initializes
    orderDetailsController.getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Obx(
          () => Column(
            children: [
              SizedBox(height: 40.h),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 48.h,
                      decoration: BoxDecoration(
                        color: const Color(0xffFAFAFA),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Colors.grey[300]!,
                        ),
                      ),
                      child: Row(
                        children: [
                          widthBox8,
                          GestureDetector(
                            onTap: () {
                              // Implement search functionality if needed
                            },
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
                              onChanged: (value) {
                                // Implement search filtering if needed
                              },
                              decoration: const InputDecoration(
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Row(
              //       children: [
              //         Text(
              //           'Pending',
              //           style: TextStyle(color: AppColors.iconButtonThemeColor),
              //         ),
              //         widthBox8,
              //         CircleAvatar(
              //           backgroundColor: AppColors.iconButtonThemeColor,
              //           radius: 13,
              //           child: const Icon(
              //             Icons.arrow_drop_down_outlined,
              //             color: Colors.white,
              //           ),
              //         ),
              //       ],
              //     ),
              //     Row(
              //       children: [
              //         CircleAvatar(
              //           radius: 13,
              //           backgroundColor:
              //               AppColors.iconButtonThemeColor.withOpacity(0.10),
              //           child: const Icon(
              //             Icons.visibility,
              //             size: 16,
              //           ),
              //         ),
              //         widthBox8,
              //         CircleAvatar(
              //           radius: 13,
              //           backgroundColor:
              //               AppColors.iconButtonThemeColor.withOpacity(0.10),
              //           child: const Icon(
              //             Icons.delete,
              //             size: 16,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              heightBox12,
              // Display loading, error, or data using DataTable
              orderDetailsController.inProgress
                  ? const Expanded(
                      child: Center(child: CircularProgressIndicator()))
                  : orderDetailsController.errorMessage != null
                      ? Expanded(
                          child: Center(
                            child: Text(
                              orderDetailsController.errorMessage!,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        )
                      : orderDetailsController.addToCartData == null ||
                              orderDetailsController.addToCartData!.isEmpty
                          ? const Expanded(
                              child: Center(
                                child: Text(
                                  'No order details available',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            )
                          : Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: DataTable(
                                    border: TableBorder.all(
                                      color: Colors.grey[300]!,
                                      width: 1.0,
                                    ),
                                    columnSpacing: 20.0,
                                    dataRowHeight: 48.0,
                                    headingRowHeight: 56.0,
                                    columns: [
                                      DataColumn(
                                        label: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Order ID',
                                            style: TextStyle(
                                              color: AppColors
                                                  .iconButtonThemeColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Customer',
                                            style: TextStyle(
                                              color: AppColors
                                                  .iconButtonThemeColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Product Name',
                                            style: TextStyle(
                                              color: AppColors
                                                  .iconButtonThemeColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Quantity',
                                            style: TextStyle(
                                              color: AppColors
                                                  .iconButtonThemeColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Status',
                                            style: TextStyle(
                                              color: AppColors
                                                  .iconButtonThemeColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Amount',
                                            style: TextStyle(
                                              color: AppColors
                                                  .iconButtonThemeColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                    rows: orderDetailsController.addToCartData!
                                        .map((order) {
                                      return DataRow(cells: [
                                        DataCell(Text(order.datumId ?? 'N/A')),
                                        DataCell(
                                            Text(order.user?.name ?? 'N/A')),
                                        DataCell(
                                            Text(order.product?.name ?? 'N/A')),
                                        DataCell(Text(
                                            order.quantity?.toString() ?? '0')),
                                        DataCell(Text(order.status ?? 'N/A')),
                                        DataCell(Text(
                                            '\$${order.totalPrice?.toStringAsFixed(2) ?? '0.00'}')),
                                      ]);
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
            ],
          ),
        ),
      ),
    );
  }
}
