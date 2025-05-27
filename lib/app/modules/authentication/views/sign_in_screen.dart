import 'package:email_validator/email_validator.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/controllers/forgot_password_controller.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/controllers/google_auth_controller.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/controllers/resend_otp_controller.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/controllers/sign_in_controller.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/views/forgot_password_screen.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/views/sign_up_screen.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/views/verify_email_screen.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/widgets/continue_elevated_button.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/widgets/footer_section.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/widgets/forgot_password_row.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/widgets/liner_widget.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/widgets/welcome_text.dart';
import 'package:expriy_deals_vendors/app/modules/common/views/main_bottom_nav_bar.dart';
import 'package:expriy_deals_vendors/app/modules/onboarding/widgets/custom_scafold_background.dart';
import 'package:expriy_deals_vendors/app/utils/assets_path.dart';
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
  final GoogleAuthController googleAuthController =
      Get.put(GoogleAuthController());

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
              CustomAppBar(name: 'Sign In'),
              heightBox16,
              Align(
                alignment: Alignment.center,
                child: WelcomeText(
                  title: 'Hi, Welcome back!',
                  subtitle: 'Sign in to continue exploring the best deals',
                ),
              ),
              heightBox50,
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email',
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
                        if (value!.isEmpty) return 'Enter email';
                        if (!EmailValidator.validate(value)) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: 'example@gmail.com',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                    heightBox8,
                    Text('Password',
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff626262))),
                    heightBox8,
                    TextFormField(
                      controller: passwordCtrl,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value) {
                        if (value!.isEmpty) return 'Enter password';
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
                              text: controller.inProgress ? '' : 'Sign in',
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
                    ContinueElevatedButton(
                      name: 'Continue with google',
                      logoPath: AssetsPath.googleLogoUp,
                      ontap: () => onTapGoogleSignIn(context),
                    ),

                    heightBox12,
                    // ContinueElevatedButton(
                    //   name: 'Continue with apple',
                    //   logoPath: AssetsPath.appleLogo,
                    //   ontap: () {},
                    // ),
                    // heightBox12,
                    AuthenticationFooterSection(
                      fTextName: 'Don’t have an account? ',
                      fTextColor: Color(0xff33363F),
                      sTextName: 'Sign up',
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

  Future<void> onTapGoogleSignIn(BuildContext context) async {
    final controller = Get.find<GoogleAuthController>();

    bool isSuccess = await controller.signInWithGoogle();

    if (isSuccess) {
      if (context.mounted) {
        showSnackBarMessage(context, 'Google দিয়ে সফলভাবে লগইন হয়েছে');
      }
    } else {
      String message = controller.errorMessage ?? 'Google লগইন ব্যর্থ হয়েছে';

      if (message.contains('credentials')) {
        if (context.mounted) {
          await showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text("অ্যাকাউন্ট সমস্যা"),
              content: Text(
                  "এই ইমেইলটি ইতিমধ্যে ইমেইল-পাসওয়ার্ড দিয়ে রেজিস্টার করা আছে। অনুগ্রহ করে অন্য Google অ্যাকাউন্ট সিলেক্ট করুন।"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("ঠিক আছে"),
                )
              ],
            ),
          );

          // ডায়ালগ বন্ধ করার পর আবার নতুন করে সাইন-ইন চেষ্টা করো
          await onTapGoogleSignIn(context);
        }
      } else {
        if (context.mounted) {
          showSnackBarMessage(context, message, true);
        }
      }
    }
  }

  Future<void> onTapToNextButton() async {
    if (_formKey.currentState!.validate()) {
      final bool isSuccess = await signInController.signIn(
        emailCtrl.text,
        passwordCtrl.text,
      );

      if (isSuccess) {
        if (mounted) {
          showSnackBarMessage(context, 'Login successfully done');
          Get.offAll(MainButtonNavbarScreen());
        }
      } else if (signInController.errorMessage!.contains('verified')) {
        final bool isSuccess = await resendOTPController.resendOTP(
          emailCtrl.text,
        );

        if (isSuccess) {
          // ignore: avoid_print
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
      showSnackBarMessage(context, 'Fill-up your valid email', true);
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
