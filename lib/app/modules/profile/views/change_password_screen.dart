import 'package:expriy_deals_vendors/app/modules/common/views/main_bottom_nav_bar.dart';
import 'package:expriy_deals_vendors/app/modules/profile/controllers/change_password_controller.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:expriy_deals_vendors/app/widgets/gradiant_elevated_button.dart';
import 'package:expriy_deals_vendors/app/widgets/show_snackBar_message.dart';
import 'package:expriy_deals_vendors/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class ChangePasswordScreen extends StatefulWidget {
  static const String routeName = '/reset-password-screen';
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController oldPasswordCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController confirmPasswordCtrl = TextEditingController();
  final ChangePasswordController changePasswordController =
      Get.find<ChangePasswordController>();

  bool _obscureText = true;

  String email = '';
  String accessToken = '';

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
              CustomAppBar(name: 'change_password_screen.title'.tr),
              heightBox16,
              heightBox12,
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: oldPasswordCtrl,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'change_password_screen.enter_password'.tr;
                        }
                        return null;
                      },
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        hintText: 'change_password_screen.current_password'.tr,
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                    heightBox8,
                    TextFormField(
                      controller: passwordCtrl,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'change_password_screen.enter_password'.tr;
                        }
                        return null;
                      },
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        hintText: 'change_password_screen.new_password'.tr,
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                    heightBox8,
                    TextFormField(
                      controller: confirmPasswordCtrl,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'change_password_screen.enter_password'.tr;
                        }
                        return null;
                      },
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        hintText: 'change_password_screen.confirm_password'.tr,
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                    heightBox24,
                    GetBuilder<ChangePasswordController>(
                      builder: (controller) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            CustomElevatedButton(
                              onPressed: controller.inProgress
                                  ? () {}
                                  : () => onTapToNextButton(),
                              text: controller.inProgress
                                  ? ''
                                  : 'change_password_screen.title'.tr,
                            ),
                            if (controller.inProgress)
                              const SizedBox(
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
      final bool isSuccess = await changePasswordController.changePassword(
        oldPasswordCtrl.text,
        passwordCtrl.text,
        confirmPasswordCtrl.text,
        StorageUtil.getData(StorageUtil.userAccessToken),
      );

      if (isSuccess) {
        if (mounted) {
          showSnackBarMessage(context, 'change_password_screen.success_message'.tr);
          Get.to(() => MainButtonNavbarScreen());
        }
      } else {
        if (mounted) {
          showSnackBarMessage(
              context, changePasswordController.errorMessage ?? 'change_password_screen.error_message'.tr, true);
        }
      }
    }
  }

  void clearTextField() {
    oldPasswordCtrl.clear();
    passwordCtrl.clear();
    confirmPasswordCtrl.clear();
  }

  @override
  void dispose() {
    oldPasswordCtrl.dispose();
    passwordCtrl.dispose();
    confirmPasswordCtrl.dispose();
    super.dispose();
  }
}