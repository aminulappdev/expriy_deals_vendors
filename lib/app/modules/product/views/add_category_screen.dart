import 'package:email_validator/email_validator.dart';
import 'package:expriy_deals_vendors/app/modules/common/views/main_bottom_nav_bar.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:expriy_deals_vendors/app/widgets/gradiant_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});
  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  bool _obscureText = true;
  bool isChecked = false;

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
              CustomAppBar(name: 'Add category'),
              heightBox16,
              Text('Item Name',
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
                decoration:
                    InputDecoration(hintStyle: TextStyle(color: Colors.grey)),
              ),
              heightBox8,
              Text('Uplpad image'),
              heightBox12,
              InkWell(
                onTap: () {},
                child: Container(
                  height: 140,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 40,
                      ),
                      Text(
                        'Add product',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              heightBox8,
              CustomElevatedButton(
                  onPressed: () {
                    Get.to(MainButtonNavbarScreen());
                  },
                  text: 'Save'),
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> onTapGoogleSignIn() async {
  //   final controller = Get.find<GoogleAuthController>();
  //   final bool isSuccess = await controller.signInWithGoogle();

  //   if (isSuccess) {
  //     if (context.mounted) {
  //       showSnackBarMessage(context, 'Google দিয়ে লগইন সফল হয়েছে');
  //     }
  //   } else {
  //     String message = controller.errorMessage ?? 'Google লগইন ব্যর্থ হয়েছে';

  //     if (message.contains('credentials')) {
  //       if (context.mounted) {
  //         showDialog(
  //           context: context,
  //           builder: (_) => AlertDialog(
  //             title: Text("অ্যাকাউন্ট সমস্যা"),
  //             content: Text("এই ইমেইলটি আগে থেকেই রেজিস্টার করা আছে ইমেইল-পাসওয়ার্ড দিয়ে। দয়া করে অন্য Google অ্যাকাউন্ট সিলেক্ট করুন।"),
  //             actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text("ঠিক আছে"))],
  //           ),
  //         );
  //       }
  //     } else {
  //       if (context.mounted) {
  //         showSnackBarMessage(context, message, true);
  //       }
  //     }
  //   }
  // }

  // Future<void> onTapToNextButton() async {
  //   if (_formKey.currentState!.validate()) {
  //     final bool isSuccess = await signInController.signIn(emailCtrl.text, passwordCtrl.text, isChecked);

  //     if (isSuccess) {
  //       if (mounted) {
  //         showSnackBarMessage(context, 'Login successfully done');
  //         Navigator.pushNamedAndRemoveUntil(context, MainButtonNavbarScreen.routeName, (route) => false);
  //       }
  //     } else {
  //       if (mounted) {
  //         showSnackBarMessage(context, signInController.errorMessage ?? 'Login failed', true);
  //       }
  //     }
  //   }
  // }

  // Future<void> forgotPasswordBTN() async {
  //   final bool isSuccess = await forgotPasswordController.forgotPassword(emailCtrl.text);
  //   if (isSuccess && mounted) {
  //     Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
  //   } else if (mounted) {
  //     showSnackBarMessage(context, forgotPasswordController.errorMessage ?? 'Error occurred', true);
  //   }
  // }

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
