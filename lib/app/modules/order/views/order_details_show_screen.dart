// ignore_for_file: deprecated_member_use

import 'package:expriy_deals_vendors/app/modules/order/controllers/order_details_controller.dart';
import 'package:expriy_deals_vendors/app/modules/order/views/order_details_screen.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Text(
                'My Orders',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
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
                                      DataColumn(
                                        label: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Details',
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
                                        DataCell(InkWell(
                                          onTap: () {
                                            Get.to(OrderDetailsScreen(
                                                orderDetailsItemModel: order));
                                          },
                                          child: Text(
                                            'Details',
                                            style: TextStyle(
                                              color: AppColors
                                                  .iconButtonThemeColor,
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        )),
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
