import 'package:expriy_deals_vendors/app/modules/bank/controllers/bank_details_controller.dart';
import 'package:expriy_deals_vendors/app/modules/bank/views/create_bank_info_screen.dart';
import 'package:expriy_deals_vendors/app/modules/bank/views/update_bank_info_screen.dart';
import 'package:expriy_deals_vendors/app/utils/app_colors.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BankInfoScreen extends StatefulWidget {
  const BankInfoScreen({super.key});

  @override
  State<BankInfoScreen> createState() => _BankInfoScreenState();
}

class _BankInfoScreenState extends State<BankInfoScreen> {
  final BankDetailsController bankDetailsController =
      Get.find<BankDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightBox24,
            CustomAppBar(name: 'bank_info_screen.title'.tr, isBack: true),
            heightBox12,
            Align(
              alignment: Alignment.topRight,
              child: Obx(() {
                final hasBankDetails =
                    bankDetailsController.bankDetailsData != null;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Tooltip(
                      message: hasBankDetails
                          ? 'bank_info_screen.existing_details_tooltip'.tr
                          : 'bank_info_screen.create_tooltip'.tr,
                      child: InkWell(
                        onTap: hasBankDetails
                            ? null
                            : () {
                                Get.to(() => const CreateBankInfoScreen());
                              },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: hasBankDetails
                                  ? Colors.grey
                                  : AppColors.iconButtonThemeColor,
                              width: 1.w,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.add,
                              size: 20.sp,
                              color: hasBankDetails ? Colors.grey : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (hasBankDetails) ...[
                      widthBox8,
                      Tooltip(
                        message: 'bank_info_screen.edit_tooltip'.tr,
                        child: InkWell(
                          onTap: () {
                            Get.to(() => UpdateBankInfoScreen(
                                accountId: bankDetailsController
                                        .bankDetailsData?.id ??
                                    ''));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.iconButtonThemeColor,
                                width: 1.w,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.edit,
                                size: 20.sp,
                                color: AppColors.iconButtonThemeColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                );
              }),
            ),
            Obx(() {
              if (bankDetailsController.inProgress == true) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heightBox8,
                    CardInfoCard(
                      title: 'bank_info_screen.account_number'.tr,
                      subtitle: bankDetailsController
                              .bankDetailsData?.accountNumber ??
                          'N/A',
                    ),
                    heightBox8,
                    CardInfoCard(
                      title: 'bank_info_screen.routing_number'.tr,
                      subtitle: bankDetailsController
                              .bankDetailsData?.routingNumber ??
                          'N/A',
                    ),
                    heightBox8,
                    CardInfoCard(
                      title: 'bank_info_screen.bank_name'.tr,
                      subtitle:
                          bankDetailsController.bankDetailsData?.bankName ??
                              'N/A',
                    ),
                    heightBox8,
                    CardInfoCard(
                      title: 'bank_info_screen.bank_holder_name'.tr,
                      subtitle: bankDetailsController
                              .bankDetailsData?.bankHolderName ??
                          'N/A',
                    ),
                    heightBox8,
                    CardInfoCard(
                      title: 'bank_info_screen.bank_address'.tr,
                      subtitle:
                          bankDetailsController.bankDetailsData?.bankAddress ??
                              'N/A',
                    ),
                  ],
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}

class CardInfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  const CardInfoCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xffCACACA), width: 1.w),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            heightBox4,
            Text(
              subtitle,
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}