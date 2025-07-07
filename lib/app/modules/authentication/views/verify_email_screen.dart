import 'package:expriy_deals_vendors/app/modules/authentication/views/otp_screen.dart';
import 'package:expriy_deals_vendors/app/utils/assets_path.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:expriy_deals_vendors/app/widgets/gradiant_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyEmailScreen extends StatefulWidget {
  final String token;
  const VerifyEmailScreen({
    super.key,
    required this.token,
  });

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12.0.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              heightBox20,
              CustomAppBar(
                name: 'verify_email_screen.title'.tr,
              ),
              heightBox100,
              CircleAvatar(
                backgroundColor: Color(0xFFD9A48E).withValues(alpha: 0.1),
                backgroundImage: AssetImage(AssetsPath.emailLogo),
                radius: 36,
              ),
              heightBox16,
              Text(
                'verify_email_screen.check_email'.tr,
                style: GoogleFonts.poppins(
                    fontSize: 20.sp, fontWeight: FontWeight.w400),
              ),
              heightBox12,
              SizedBox(
                width: 210.w,
                child: Text(
                  'verify_email_screen.check_email_subtitle'.tr,
                  style: GoogleFonts.poppins(
                      fontSize: 12.sp, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
              heightBox30,
              CustomElevatedButton(
                onPressed: () { 
                   Get.to(OTPVerifyScreen(token: widget.token));
                },
                text: 'verify_email_screen.confirm_button'.tr,
              ),
              heightBox8,
            ],
          ),
        ),
      ),
    );
  }
}