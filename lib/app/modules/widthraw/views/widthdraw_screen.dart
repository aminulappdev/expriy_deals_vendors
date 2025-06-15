// ignore_for_file: deprecated_member_use

import 'package:expriy_deals_vendors/app/modules/profile/controllers/profile_controller.dart';
import 'package:expriy_deals_vendors/app/modules/widthraw/controllers/my_widthdrae_controller.dart';
import 'package:expriy_deals_vendors/app/modules/widthraw/views/widthdraw_request_screen.dart';
import 'package:expriy_deals_vendors/app/utils/app_colors.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/gradiant_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
    // Fetch withdrawal data when the screen initializes
    _profileController.getProfileData();
    _myWidthdrawController.getWidthdraw();
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
                'Earnings',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              heightBox12,
              Container(
                height: 192,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.iconButtonThemeColor.withOpacity(0.1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Your Balance'),
                      Text(
                        '\$${_profileController.profileData?.balance ?? '0.00'}',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w600),
                      ),
                      heightBox12,
                      SizedBox(
                        width: 240,
                        child: CustomElevatedButton(
                          onPressed: () {
                            Get.to(const WidthdrawRequestScreen());
                          },
                          text: 'Withdraw',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              heightBox12,
              // Display loading, error, or data using DataTable
              _myWidthdrawController.inProgress
                  ? const Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : _myWidthdrawController.errorMessage.isNotEmpty
                      ? Expanded(
                          child: Center(
                            child: Text(
                              _myWidthdrawController.errorMessage,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        )
                      : _myWidthdrawController.myWidthdrawData == null ||
                              _myWidthdrawController.myWidthdrawData!.isEmpty
                          ? const Expanded(
                              child: Center(
                                child: Text(
                                  'No withdrawal details available',
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
                                            'Withdraw ID',
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
                                            'Date',
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
                                    rows: _myWidthdrawController
                                        .myWidthdrawData!
                                        .map((withdraw) {
                                      return DataRow(cells: [
                                        DataCell(Text(withdraw.id ?? 'N/A')),
                                        DataCell(Text(
                                            '\$${withdraw.amount?.toStringAsFixed(2) ?? '0.00'}')),
                                        DataCell(
                                            Text(withdraw.status ?? 'N/A')),
                                        DataCell(Text('N/A')),
                                        DataCell(InkWell(
                                          onTap: () {
                                            // Get.to(WidthdrawRequestScreen(
                                            //     withdrawDetailsItemModel:
                                            //         withdraw));
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
