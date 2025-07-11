import 'package:expriy_deals_vendors/app/modules/earnings/controllers/all_earnings_controller.dart';
import 'package:expriy_deals_vendors/app/modules/earnings/views/earning_details_screen.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EarningScreen extends StatefulWidget {
  const EarningScreen({super.key});

  @override
  State<EarningScreen> createState() => _EarningScreenState();
}

class _EarningScreenState extends State<EarningScreen> {
  final AllEarningsController controller = Get.put(AllEarningsController());

  @override
  void initState() {
    super.initState();
    _fetchEarnings();
  }

  Future<void> _fetchEarnings() async {
    await controller.getEarnings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightBox20,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                widthBox12,
                Text(
                  'earning_screen.title'.tr,
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            heightBox12,
            Expanded(
              child: Obx(() {
                if (controller.inProgress) {
                  return const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  );
                } else if (controller.errorMessage.isNotEmpty) {
                  return Center(
                    child: Text(
                      controller.errorMessage,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.red,
                      ),
                    ),
                  );
                } else if (controller.allEarningsData == null ||
                    controller.allEarningsData!.isEmpty) {
                  return Center(
                    child: Text(
                      'earning_screen.no_earnings_data'.tr,
                      style: GoogleFonts.poppins(fontSize: 14.sp),
                    ),
                  );
                }
                return SingleChildScrollView(
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columnSpacing: 20.w,
                            columns: [
                              DataColumn(
                                label: Text(
                                  'earning_screen.serial_column'.tr,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'earning_screen.customer_name_column'.tr,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'earning_screen.date_column'.tr,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'earning_screen.amount_column'.tr,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'earning_screen.details_column'.tr,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                            rows: List.generate(
                              controller.allEarningsData!.length,
                              (index) {
                                final earning = controller.allEarningsData![index];
                                final formattedDate = earning.createdAt != null
                                    ? DateFormat('yyyy-MM-dd').format(earning.createdAt!)
                                    : 'N/A';
                                return DataRow(
                                  cells: [
                                    DataCell(
                                      SizedBox(
                                        width: 60.w,
                                        child: Text(
                                          (index + 1).toString().padLeft(2, '0'),
                                          style: GoogleFonts.poppins(fontSize: 14.sp),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      SizedBox(
                                        width: 130.w,
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 30.h,
                                              width: 30.w,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    earning.user?.profile ??
                                                        'https://fastly.picsum.photos/id/134/200/300.jpg?hmac=KN18cCDft4FPM0XJpr7EhZLtUP6Z4cZqtF8KThtTvsI',
                                                  ),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            widthBox8,
                                            Expanded(
                                              child: Text(
                                                earning.author?.name ?? 'Unknown Customer',
                                                style: GoogleFonts.poppins(fontSize: 14.sp),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      SizedBox(
                                        width: 100.w,
                                        child: Text(
                                          formattedDate,
                                          style: GoogleFonts.poppins(fontSize: 14.sp),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      SizedBox(
                                        width: 80.w,
                                        child: Text(
                                          '\$${earning.price?.toString() ?? 'N/A'}',
                                          style: GoogleFonts.poppins(fontSize: 14.sp),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      SizedBox(
                                        width: 80.w,
                                        child: TextButton(
                                          onPressed: () {
                                            Get.to(() => EarningDetailsScreen(
                                                  allEarningsItemModel: earning,
                                                ));
                                          },
                                          child: Text(
                                            'earning_screen.view_button'.tr,
                                            style: GoogleFonts.poppins(
                                              fontSize: 12.sp,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}