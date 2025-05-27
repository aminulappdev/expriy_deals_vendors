import 'dart:async';
import 'package:expriy_deals_vendors/app/modules/authentication/controllers/otp_verify_controller.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/views/sign_in_screen.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/widgets/auth_header_text.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:expriy_deals_vendors/app/widgets/gradiant_elevated_button.dart';
import 'package:expriy_deals_vendors/app/widgets/show_snackBar_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerifyScreen extends StatefulWidget {
  final String token;
  const OTPVerifyScreen({super.key, required this.token});

  @override
  State<OTPVerifyScreen> createState() => _OTPVerifyScreenState();
}

class _OTPVerifyScreenState extends State<OTPVerifyScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController otpCtrl = TextEditingController();
  final OtpVerifyController otpVerifyController =
      Get.put(OtpVerifyController());

  RxInt remainingTime = 60.obs;
  late Timer timer;
  RxBool enableResendCodeButtom = false.obs;

  @override
  void initState() {
    resendOTP();
    super.initState();
  }

  void resendOTP() {
    enableResendCodeButtom.value = false;
    remainingTime.value = 60;
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (t) {
        remainingTime.value--;
        if (remainingTime.value == 0) {
          t.cancel();
          enableResendCodeButtom.value = true;
        }
      },
    );
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
                name: 'OTP Verification',
              ),
              heightBox16,
              AuthHeaderText(
                title: 'Enter OTP',
                subtitle: 'We have just sentb you 6 digitcode via uour email.',
                titleFontSize: 20,
                subtitleFontSize: 12,
                sizeBoxHeight: 200,
              ),
              heightBox20,
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PinCodeTextField(
                      length: 6,
                      obscureText: false,
                      controller: otpCtrl,
                      keyboardType: TextInputType.number,
                      animationType: AnimationType.fade,
                      animationDuration: Duration(milliseconds: 300),
                      onChanged: (value) {},
                      pinTheme: PinTheme(
                          selectedColor: Colors.black,
                          activeColor: Colors.orange,
                          borderWidth: 0.5,
                          shape: PinCodeFieldShape.circle,
                          borderRadius: BorderRadius.circular(100.r),
                          inactiveColor: const Color(0xffD9A48E),
                          fieldHeight: 50.h,
                          fieldWidth: 50.h,
                          activeFillColor: Colors.white,
                          // ignore: deprecated_member_use
                          inactiveFillColor: Color(0xffD9A48E).withOpacity(0.1),
                          selectedFillColor: Colors.white),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      appContext: context,
                    ),
                    heightBox8,
                    GetBuilder<OtpVerifyController>(
                      builder: (controller) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            CustomElevatedButton(
                              onPressed: controller.inProgress
                                  ? () {}
                                  : () => onTapToNextButton(),
                              text: controller.inProgress ? '' : 'Confirm',
                            ),
                            if (controller.inProgress)
                              SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                    heightBox12,
                    Obx(
                      () => Visibility(
                        visible: !enableResendCodeButtom.value,
                        replacement: GestureDetector(
                          onTap: () {
                            resendOTP();
                          },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Didn’t receive code? ',
                                    style: GoogleFonts.poppins(
                                        color: Colors.black, fontSize: 16.sp)),
                                TextSpan(
                                    text: 'Resend code',
                                    style: GoogleFonts.poppins(
                                        color: Colors.orange, fontSize: 16.sp)),
                              ],
                            ),
                          ),
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Resend code',
                                  style: GoogleFonts.poppins(
                                      color: Colors.black, fontSize: 16.sp)),
                              TextSpan(
                                  text: ' $remainingTime',
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
              heightBox100,
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onTapToNextButton() async {
    if (_formKey.currentState!.validate()) {
      final bool isSuccess =
          await otpVerifyController.otyVerify(otpCtrl.text, widget.token);
      print(
          'My token ---------------------------------------\n-------\n------');
      print(widget.token);

      if (isSuccess) {
        if (mounted) {
          showSnackBarMessage(context, 'Otp verification successfully done');
          Get.to(SignInScreen());
        } else {
          if (mounted) {
            showSnackBarMessage(
                context, otpVerifyController.errorMessage!, true);
          }
        }
      }
    }
  }

  void clearTextField() {
    otpCtrl.clear();
  }

  @override
  void dispose() {
    super.dispose();

    otpCtrl.dispose();
  }
}
