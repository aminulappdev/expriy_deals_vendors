import 'package:expriy_deals_vendors/app/modules/order/controllers/order_details_controller.dart';
import 'package:expriy_deals_vendors/app/modules/order/views/order_details_screen.dart';
import 'package:expriy_deals_vendors/app/utils/app_colors.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
                'order_screen.title'.tr,
                style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              heightBox12,
              orderDetailsController.inProgress
                  ? const Expanded(
                      child: Center(child: CircularProgressIndicator()))
                  : orderDetailsController.errorMessage != null
                      ? Expanded(
                          child: Center(
                            child: Text(
                              orderDetailsController.errorMessage!,
                              style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        )
                      : orderDetailsController.addToCartData == null ||
                              orderDetailsController.addToCartData!.isEmpty
                          ? Expanded(
                              child: Center(
                                child: Text(
                                  'order_screen.no_order_details'.tr,
                                  style: GoogleFonts.poppins(fontSize: 16.sp),
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
                                            'order_screen.order_id_column'.tr,
                                            style: GoogleFonts.poppins(
                                              fontSize: 14.sp,
                                              color: AppColors.iconButtonThemeColor,
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
                                            'order_screen.customer_column'.tr,
                                            style: GoogleFonts.poppins(
                                              fontSize: 14.sp,
                                              color: AppColors.iconButtonThemeColor,
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
                                            'order_screen.product_name_column'.tr,
                                            style: GoogleFonts.poppins(
                                              fontSize: 14.sp,
                                              color: AppColors.iconButtonThemeColor,
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
                                            'order_screen.quantity_column'.tr,
                                            style: GoogleFonts.poppins(
                                              fontSize: 14.sp,
                                              color: AppColors.iconButtonThemeColor,
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
                                            'order_screen.status_column'.tr,
                                            style: GoogleFonts.poppins(
                                              fontSize: 14.sp,
                                              color: AppColors.iconButtonThemeColor,
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
                                            'order_screen.amount_column'.tr,
                                            style: GoogleFonts.poppins(
                                              fontSize: 14.sp,
                                              color: AppColors.iconButtonThemeColor,
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
                                            'order_screen.details_column'.tr,
                                            style: GoogleFonts.poppins(
                                              fontSize: 14.sp,
                                              color: AppColors.iconButtonThemeColor,
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
                                            Get.to(() => OrderDetailsScreen(
                                                orderDetailsItemModel: order));
                                          },
                                          child: Text(
                                            'order_screen.details_column'.tr,
                                            style: GoogleFonts.poppins(
                                              fontSize: 14.sp,
                                              color: AppColors.iconButtonThemeColor,
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