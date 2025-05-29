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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightBox24,
            CustomAppBar(name: 'Create Bank Info', isBack: true),
            heightBox12,
            Align(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => const CreateBankInfoScreen());
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: AppColors.iconButtonThemeColor,
                              width: 1.w),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.add,
                              size: 20.sp,
                              color: AppColors.iconButtonThemeColor),
                        )),
                  ),
                  widthBox8,
                  InkWell(
                    onTap: () { Get.to(() => const UpdateBankInfoScreen());},
                    child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: AppColors.iconButtonThemeColor,
                              width: 1.w),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.edit,
                              size: 20.sp,
                              color: AppColors.iconButtonThemeColor),
                        )),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heightBox8,
                CardInfoCard(
                  title: 'Account number',
                  subtitle: '1234567890',
                ),
                heightBox8,
                CardInfoCard(
                  title: 'Routing number',
                  subtitle: '1234567890',
                ),
                heightBox8,
                CardInfoCard(
                  title: 'Bank name',
                  subtitle: 'Meghna Bank',
                ),
                heightBox8,
                CardInfoCard(
                  title: 'Bankholder name',
                  subtitle: 'Md Aminul Islam',
                ),
                heightBox8,
                CardInfoCard(
                  title: 'Bank address',
                  subtitle: 'Banasree, Dhaka, Bangladesh',
                ),
              ],
            )
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
                color: const Color(0xff000000),
              ),
            ),
            heightBox4,
            Text(
              subtitle,
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xff000000),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
