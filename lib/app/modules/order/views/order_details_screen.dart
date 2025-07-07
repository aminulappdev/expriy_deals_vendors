import 'package:expriy_deals_vendors/app/modules/order/controllers/order_details_controller.dart';
import 'package:expriy_deals_vendors/app/modules/order/controllers/update_status_controller.dart';
import 'package:expriy_deals_vendors/app/modules/order/model/order_details_model.dart';
import 'package:expriy_deals_vendors/app/modules/order/widgets/price_row.dart';
import 'package:expriy_deals_vendors/app/utils/assets_path.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetailsScreen extends StatefulWidget {
  final OrderDetailsItemModel orderDetailsItemModel;

  const OrderDetailsScreen({super.key, required this.orderDetailsItemModel});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  final OrderDetailsController controller = Get.put(OrderDetailsController());
  final UpdateStatusController updateStatusController =
      Get.put(UpdateStatusController());

  String? selectedStatus;

  @override
  void initState() {
    super.initState();
    selectedStatus =
        widget.orderDetailsItemModel.status?.capitalizeFirst ?? 'order_details_screen.status_pending'.tr;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heightBox20,
                    CustomAppBar(name: 'order_details_screen.title'.tr),
                    heightBox12,
                    Card(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
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
                                        image: AssetImage(AssetsPath.headphone),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
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
                                                widget.orderDetailsItemModel
                                                        .product?.name ??
                                                    'Unknown Product',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 15.sp),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 23.h,
                                              width: 90.w,
                                              child: Obx(() => controller
                                                      .inProgress
                                                  ? Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                              strokeWidth: 2))
                                                  : DropdownButtonFormField<
                                                      String>(
                                                      value: selectedStatus,
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        8.w,
                                                                    vertical:
                                                                        0),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black12),
                                                        ),
                                                      ),
                                                      items: [
                                                        DropdownMenuItem(
                                                          value: 'order_details_screen.status_pending'.tr,
                                                          child: Text('order_details_screen.status_pending'.tr),
                                                        ),
                                                        DropdownMenuItem(
                                                          value: 'order_details_screen.status_ongoing'.tr,
                                                          child: Text('order_details_screen.status_ongoing'.tr),
                                                        ),
                                                        DropdownMenuItem(
                                                          value: 'order_details_screen.status_delivered'.tr,
                                                          child: Text('order_details_screen.status_delivered'.tr),
                                                        ),
                                                        DropdownMenuItem(
                                                          value: 'order_details_screen.status_cancel'.tr,
                                                          child: Text('order_details_screen.status_cancel'.tr),
                                                        ),
                                                      ],
                                                      onChanged: (value) async {
                                                        if (value != null) {
                                                          setState(() {
                                                            selectedStatus =
                                                                value;
                                                          });
                                                          bool success = await updateStatusController
                                                              .updateStatus(
                                                                  value
                                                                      .toLowerCase(),
                                                                  widget.orderDetailsItemModel
                                                                          .id ??
                                                                      '');
                                                          if (success) {
                                                            Get.snackbar(
                                                              'Success',
                                                              'order_details_screen.success_message'.trParams({
                                                                'status': value
                                                              }),
                                                            );
                                                            setState(() {
                                                              controller
                                                                  .getCart();
                                                            });
                                                          } else {
                                                            Get.snackbar(
                                                              'Error',
                                                              controller
                                                                      .errorMessage ??
                                                                  'order_details_screen.error_message'.tr,
                                                            );
                                                            setState(() {
                                                              selectedStatus = widget
                                                                      .orderDetailsItemModel
                                                                      .status
                                                                      ?.capitalizeFirst ??
                                                                  'order_details_screen.status_pending'.tr;
                                                            });
                                                          }
                                                        }
                                                      },
                                                      style: GoogleFonts.poppins(
                                                        fontSize: 10.sp,
                                                        color: Colors.red,
                                                      ),
                                                      isDense: true,
                                                      iconSize: 20,
                                                    )),
                                            ),
                                          ],
                                        ),
                                        heightBox12,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              widget.orderDetailsItemModel
                                                      .product?.price
                                                      ?.toString() ??
                                                  'N/A',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14.sp),
                                            ),
                                            Text(
                                              'Quantity: ${widget.orderDetailsItemModel.quantity ?? 0}',
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
                    Text(
                      'order_details_screen.order_id'.tr + ': ${widget.orderDetailsItemModel.id ?? 'N/A'}',
                      style: GoogleFonts.poppins(fontSize: 14.sp),
                    ),
                    heightBox4,
                    Text(
                      'order_details_screen.delivery_address'.tr + ': ${widget.orderDetailsItemModel.billingDetails?.address ?? 'N/A'}',
                      style: GoogleFonts.poppins(fontSize: 14.sp),
                    ),
                    heightBox4,
                    Text(
                      'order_details_screen.date'.tr + ': ${widget.orderDetailsItemModel.createdAt ?? 'N/A'}',
                      style: GoogleFonts.poppins(fontSize: 14.sp),
                    ),
                    heightBox30,
                    Text(
                      'order_details_screen.price_details'.tr,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    heightBox8,
                    PriceRow(
                      name: 'order_details_screen.price'.tr,
                      price: widget.orderDetailsItemModel.product?.price
                              ?.toString() ??
                          'N/A',
                      nameSize: 14.sp,
                      priceSize: 14.sp,
                    ),
                    heightBox10,
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black,
                    ),
                    heightBox10,
                    PriceRow(
                      name: 'order_details_screen.total'.tr,
                      nameSize: 14.sp,
                      priceSize: 14.sp,
                      price: widget.orderDetailsItemModel.product?.price
                              ?.toString() ??
                          'N/A',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}