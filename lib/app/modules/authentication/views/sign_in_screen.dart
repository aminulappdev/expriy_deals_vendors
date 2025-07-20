import 'package:email_validator/email_validator.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/controllers/forgot_password_controller.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/controllers/google_auth_controller.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/controllers/resend_otp_controller.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/controllers/sign_in_controller.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/views/forgot_password_screen.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/views/sign_up_screen.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/views/verify_email_screen.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/widgets/footer_section.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/widgets/forgot_password_row.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/widgets/liner_widget.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/widgets/welcome_text.dart';
import 'package:expriy_deals_vendors/app/modules/common/views/main_bottom_nav_bar.dart';
import 'package:expriy_deals_vendors/app/modules/onboarding/widgets/custom_scafold_background.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:expriy_deals_vendors/app/widgets/gradiant_elevated_button.dart';
import 'package:expriy_deals_vendors/app/widgets/show_snackBar_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  final SignInController signInController = Get.put(SignInController());
  final ForgotPasswordController forgotPasswordController =
      ForgotPasswordController();
  final ResendOTPController resendOTPController =
      Get.put(ResendOTPController());
  // final GoogleAuthController googleAuthController =
  //     Get.put(GoogleAuthController());

  bool _obscureText = true;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldBackground(
      child: Padding(
        padding: EdgeInsets.all(12.0.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightBox20,
              CustomAppBar(name: 'sign_in_screen.title'.tr),
              heightBox16,
              Align(
                alignment: Alignment.center,
                child: WelcomeText(
                  title: 'sign_in_screen.header_title'.tr,
                  subtitle: 'sign_in_screen.header_subtitle'.tr,
                ),
              ),
              heightBox50,
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('sign_in_screen.email'.tr,
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff626262))),
                    heightBox8,
                    TextFormField(
                      controller: emailCtrl,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      validator: (String? value) {
                        if (value!.isEmpty) return 'sign_in_screen.enter_email'.tr;
                        if (!EmailValidator.validate(value)) {
                          return 'sign_in_screen.enter_valid_email'.tr;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: 'example@gmail.com',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                    heightBox8,
                    Text('sign_in_screen.password'.tr,
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff626262))),
                    heightBox8,
                    TextFormField(
                      controller: passwordCtrl,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value) {
                        if (value!.isEmpty) return 'sign_in_screen.enter_password'.tr;
                        return null;
                      },
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey),
                          onPressed: () =>
                              setState(() => _obscureText = !_obscureText),
                        ),
                        hintText: '***********',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ForgotPasswordRow(
                        ontap: forgotPasswordBTN,
                      ),
                    ),
                    heightBox24,
                    GetBuilder<SignInController>(
                      builder: (controller) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            CustomElevatedButton(
                              onPressed: controller.inProgress
                                  ? () {}
                                  : () => onTapToNextButton(),
                              text: controller.inProgress ? '' : 'sign_in_screen.sign_in'.tr,
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
                    Liner(),
                    heightBox12,
                    AuthenticationFooterSection(
                      fTextName: 'sign_in_screen.dont_have_account'.tr,
                      fTextColor: Color(0xff33363F),
                      sTextName: 'sign_in_screen.sign_up'.tr,
                      sTextColor: Color(0xff33363F),
                      ontap: () {
                        Get.to(SignUpScreen());
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onTapToNextButton() async {
    if (_formKey.currentState!.validate()) {
      final bool isSuccess = await signInController.signIn(
        emailCtrl.text,
        passwordCtrl.text,
      );

      if (isSuccess) {
        if (mounted) {
          showSnackBarMessage(context, 'sign_in_screen.success_message'.tr);
          Get.offAll(MainButtonNavbarScreen());
        }
      } else if (signInController.errorMessage!.contains('verified')) {
        final bool isSuccess = await resendOTPController.resendOTP(
          emailCtrl.text,
        );

        if (isSuccess) {
          print('Resend otp success.............');
          Get.to(VerifyEmailScreen(
            token: resendOTPController.otpToken ?? 'Empty token',
          ));
        } else {
          if (mounted) {
            showSnackBarMessage(
                context, resendOTPController.errorMessage ?? 'Failed', true);
          }
        }
      } else {
        if (mounted) {
          showSnackBarMessage(
              context, signInController.errorMessage ?? 'Login failed', true);
        }
      }
    }
  }

  Future<void> forgotPasswordBTN() async {
    final bool isSuccess =
        await forgotPasswordController.forgotPassword(emailCtrl.text);
    if (emailCtrl.text.isEmpty) {
      showSnackBarMessage(context, 'sign_in_screen.fill_valid_email'.tr, true);
    } else if (isSuccess && mounted) {
      Get.to(ForgotPasswordScreen(
        email: emailCtrl.text,
        token: '${forgotPasswordController.accessToken}',
      ));
    } else if (mounted) {
      showSnackBarMessage(context,
          forgotPasswordController.errorMessage ?? 'Error occurred', true);
    }
  }

  void clearTextField() {
    emailCtrl.clear();
    passwordCtrl.clear();
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }
}