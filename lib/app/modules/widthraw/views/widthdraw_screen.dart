

import 'package:expriy_deals_vendors/app/modules/profile/controllers/profile_controller.dart';
import 'package:expriy_deals_vendors/app/modules/widthraw/controllers/my_widthdrae_controller.dart';
import 'package:expriy_deals_vendors/app/modules/widthraw/views/widthdraw_request_screen.dart';
import 'package:expriy_deals_vendors/app/utils/app_colors.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:expriy_deals_vendors/app/widgets/gradiant_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WidthdrawScreen extends StatefulWidget {
  const WidthdrawScreen({super.key});

  @override
  State<WidthdrawScreen> createState() => _WidthdrawScreenState();
}

class _WidthdrawScreenState extends State<WidthdrawScreen> {
  final MyWidthdrawController _myWidthdrawController =
      Get.find<MyWidthdrawController>();
  final ProfileController _profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    _profileController.getProfileData();
    _myWidthdrawController.getWidthdraw();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12.h),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              CustomAppBar(name: 'widthdraw_screen.title'.tr),
              heightBox12,
              Container(
                height: 192.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.iconButtonThemeColor.withOpacity(0.1),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'widthdraw_screen.your_balance'.tr,
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '\$${_profileController.profileData?.balance?.toStringAsFixed(2) ?? '0.00'}',
                        style: GoogleFonts.poppins(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      heightBox12,
                      SizedBox(
                        width: 240.w,
                        child: CustomElevatedButton(
                          onPressed: () {
                            Get.to(const WidthdrawRequestScreen());
                          },
                          text: 'widthdraw_screen.withdraw'.tr,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              heightBox12,
              _myWidthdrawController.inProgress
                  ? const Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : _myWidthdrawController.errorMessage.isNotEmpty
                      ? Expanded(
                          child: Center(
                            child: Text(
                              _myWidthdrawController.errorMessage,
                              style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      : _myWidthdrawController.myWidthdrawData == null ||
                              _myWidthdrawController.myWidthdrawData!.isEmpty
                          ? Expanded(
                              child: Center(
                                child: Text(
                                  'widthdraw_screen.no_withdrawal_details'.tr,
                                  style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
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
                                          padding: EdgeInsets.all(8.0.h),
                                          child: Text(
                                            'widthdraw_screen.withdraw_id'.tr,
                                            style: GoogleFonts.poppins(
                                              color: AppColors.iconButtonThemeColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Container(
                                          padding: EdgeInsets.all(8.0.h),
                                          child: Text(
                                            'widthdraw_screen.amount'.tr,
                                            style: GoogleFonts.poppins(
                                              color: AppColors.iconButtonThemeColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Container(
                                          padding: EdgeInsets.all(8.0.h),
                                          child: Text(
                                            'widthdraw_screen.status'.tr,
                                            style: GoogleFonts.poppins(
                                              color: AppColors.iconButtonThemeColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Container(
                                          padding: EdgeInsets.all(8.0.h),
                                          child: Text(
                                            'widthdraw_screen.date'.tr,
                                            style: GoogleFonts.poppins(
                                              color: AppColors.iconButtonThemeColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Container(
                                          padding: EdgeInsets.all(8.0.h),
                                          child: Text(
                                            'widthdraw_screen.details'.tr,
                                            style: GoogleFonts.poppins(
                                              color: AppColors.iconButtonThemeColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                    rows: _myWidthdrawController.myWidthdrawData!
                                        .map((withdraw) {
                                      return DataRow(cells: [
                                        DataCell(
                                          Text(withdraw.id ?? 'N/A'),
                                        ),
                                        DataCell(
                                          Text(
                                              '\$${withdraw.amount?.toStringAsFixed(2) ?? '0.00'}'),
                                        ),
                                        DataCell(
                                          Text(withdraw.status ?? 'N/A'),
                                        ),
                                       DataCell(Text('N/A')),
                                        DataCell(
                                          InkWell(
                                            onTap: () {
                                              // Get.to(WidthdrawRequestScreen(
                                              //     withdrawDetailsItemModel: withdraw));
                                            },
                                            child: Text(
                                              'widthdraw_screen.details'.tr,
                                              style: GoogleFonts.poppins(
                                                color:
                                                    AppColors.iconButtonThemeColor,
                                                fontWeight: FontWeight.normal,
                                                fontStyle: FontStyle.italic,
                                                fontSize: 14.sp,
                                              ),
                                            ),
                                          ),
                                        ),
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