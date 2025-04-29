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
  static const String routeName = '/verify-email-forgot-screen';
  const VerifyEmailScreenWithForgot({super.key});

  @override
  State<VerifyEmailScreenWithForgot> createState() =>
      _VerifyEmailScreenWithForgotState();
}

class _VerifyEmailScreenWithForgotState
    extends State<VerifyEmailScreenWithForgot> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                name: 'Check Email',
              ),
              heightBox100,
              CircleAvatar(
                backgroundColor: Color(0xFFD9A48E).withValues(alpha: 0.1),
                backgroundImage: AssetImage(AssetsPath.emailLogo),
                radius: 36.r,
              ),
              heightBox16,
              AuthHeaderText(
                title: 'A letter has been sent.',
                subtitle:
                    'Your next step is inside your inbox. Check your email to unlock it.',
                titleFontSize: 20,
                subtitleFontSize: 12,
                sizeBoxHeight: 215,
              ),
              heightBox30,
              CustomElevatedButton(
                onPressed: () {
                  Get.to(OTPVerifyForgotScreen());
                  // Navigator.pushNamed(context, OTPVerifyForgotScreen.routeName);
                },
                text: 'Read My Letter',
              ),
              heightBox8,
            ],
          ),
        ),
      ),
    );
  }
}
