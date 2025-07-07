import 'package:expriy_deals_vendors/app/modules/authentication/views/otp_forgot_screen.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/widgets/auth_header_text.dart';
import 'package:expriy_deals_vendors/app/utils/assets_path.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:expriy_deals_vendors/app/widgets/gradiant_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VerifyEmailScreenWithForgot extends StatefulWidget {
  final String token;
  const VerifyEmailScreenWithForgot({super.key, required this.token});

  @override
  State<VerifyEmailScreenWithForgot> createState() =>
      _VerifyEmailScreenWithForgotState();
}

class _VerifyEmailScreenWithForgotState
    extends State<VerifyEmailScreenWithForgot> {
  @override
  void initState() {
    super.initState();
  }

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
                name: 'verify_email_forgot_screen.title'.tr,
              ),
              heightBox100,
              CircleAvatar(
                backgroundColor: Color(0xFFD9A48E).withValues(alpha: 0.1),
                backgroundImage: AssetImage(AssetsPath.emailLogo),
                radius: 36.r,
              ),
              heightBox16,
              AuthHeaderText(
                title: 'verify_email_forgot_screen.header_title'.tr,
                subtitle: 'verify_email_forgot_screen.header_subtitle'.tr,
                titleFontSize: 20, 
                subtitleFontSize: 12,
                sizeBoxHeight: 215,
              ),
              heightBox30,
              CustomElevatedButton(
                onPressed: () {
                  Get.to(OTPVerifyForgotScreen(
                    token: widget.token,
                  ));
                },
                text: 'verify_email_forgot_screen.confirm_button'.tr,
              ),
              heightBox8,
            ],
          ),
        ),
      ),
    );
  }
}