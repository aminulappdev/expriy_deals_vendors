import 'dart:async';
import 'package:expriy_deals_vendors/app/modules/authentication/views/reset_password_screen.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/widgets/auth_header_text.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:expriy_deals_vendors/app/widgets/gradiant_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerifyForgotScreen extends StatefulWidget {
  static const String routeName = '/otp-forgot-screen';
  const OTPVerifyForgotScreen({super.key});

  @override
  State<OTPVerifyForgotScreen> createState() => _OTPVerifyForgotScreenState();
}

class _OTPVerifyForgotScreenState extends State<OTPVerifyForgotScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController otpCtrl = TextEditingController();


  RxInt remainingTime = 60.obs;
  late Timer timer;
  RxBool enableResendCodeButtom = false.obs;

  String email = '';

 
 
  // void resendOTP() async {
  //   enableResendCodeButtom.value = false;
  //   remainingTime.value = 60;
  //   timer = Timer.periodic(
  //     const Duration(seconds: 1),
  //     (t) {
  //       remainingTime.value--;
  //       if (remainingTime.value == 0) {
  //         t.cancel();
  //         enableResendCodeButtom.value = true;
  //       }
  //     },
  //   );

  //   final bool isSuccess = await resendOTPController.resendOTP(email);

  //   if (isSuccess) {
  //     if (mounted) {
       
  //       showSnackBarMessage(context, 'OTP succsessfully sent');
  //     } else {
  //       if (mounted) {
  //         showSnackBarMessage(context, resendOTPController.errorMessage!, true);
  //       }
  //     }
  //   } else {
  //     if (mounted) {
  //       showSnackBarMessage(context, resendOTPController.errorMessage!, true);
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12.0.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightBox20,
              CustomAppBar(
                name: 'OTP Verification',
              ),
              heightBox16,
              AuthHeaderText(
                title: 'Verify Your Identity',
                subtitle:
                    'For your security, verify the code sent to your registered contact. Let’s confirm it’s you!',
                titleFontSize: 15,
                subtitleFontSize: 12,
                sizeBoxHeight: 350,
              ),
              heightBox20,
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: PinCodeTextField(
                        controller: otpCtrl,
                        length: 6,
                        animationType: AnimationType.fade,
                        keyboardType: TextInputType.number,
                        pinTheme: PinTheme(
                            borderWidth: 0.2,
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(12.r),
                            inactiveColor: const Color.fromARGB(218, 222, 220,
                                220), // Border color when not filled
                            fieldHeight: 55.h,
                            fieldWidth: 55.h,
                            activeFillColor: Colors.white,
                            inactiveFillColor: Colors.white,
                            selectedFillColor: Colors.white),
                        animationDuration: const Duration(milliseconds: 300),
                        backgroundColor: Colors.transparent,
                        enableActiveFill: true,
                        appContext: context,
                      ),
                    ),
                    heightBox8,
                    CustomElevatedButton(
                      onPressed: () {
                         Get.to(ResetPasswordScreen());
                      },
                      text: 'Confirm',
                    ),
                    heightBox12,
                    Obx(
                      () => Visibility(
                        visible: !enableResendCodeButtom.value,
                        replacement: GestureDetector(
                          onTap: () {
                          
                          },
                          child: Text('Resend code',
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500)),
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Resend code',
                                  style: GoogleFonts.poppins(
                                      color: Colors.black, fontSize: 16.sp)),
                              TextSpan(
                                  text: '$remainingTime',
                                  style: GoogleFonts.poppins(
                                      color: Colors.orange, fontSize: 16.sp)),
                              TextSpan(
                                  text: 's',
                                  style: GoogleFonts.poppins(
                                      color: Colors.black, fontSize: 16.sp)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> onTapToNextButton() async {
  //   if (_formKey.currentState!.validate()) {
  //     final bool isSuccess =
  //         await verifyOtpController.verifyOtp(otpCtrl.text, resendOTPController.accessToken.toString());

  //     if (isSuccess) {
  //       if (mounted) {
  //         showSnackBarMessage(context, 'Otp verification successfully done');
  //         Navigator.pushNamed(context, ResetPasswordScreen.routeName);
  //       } else {
  //         if (mounted) {
  //           showSnackBarMessage(
  //               context, verifyOtpController.errorMessage!, true);
  //         }
  //       }
  //     }
  //   }
  // }

  void clearTextField() {
    otpCtrl.clear();
  }

  @override
  void dispose() {
    super.dispose();

    otpCtrl.dispose();
  }
}
