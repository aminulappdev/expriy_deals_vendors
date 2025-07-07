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
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

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
              CustomAppBar(name: 'add_category_screen.title'.tr),
              heightBox16,
              Text(
                'add_category_screen.item_name'.tr,
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff626262),
                ),
              ),
              heightBox8,
              TextFormField(
                controller: emailCtrl,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.emailAddress,
                validator: (String? value) {
                  if (value!.isEmpty) return 'add_category_screen.enter_email'.tr;
                  if (!EmailValidator.validate(value)) {
                    return 'add_category_screen.invalid_email'.tr;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              heightBox8,
              Text(
                'add_category_screen.upload_image'.tr,
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff626262),
                ),
              ),
              heightBox12,
              InkWell(
                onTap: () {},
                child: Container(
                  height: 140,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 40,
                      ),
                      Text(
                        'add_category_screen.add_product'.tr,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              heightBox8,
              CustomElevatedButton(
                onPressed: () {
                  Get.to(MainButtonNavbarScreen());
                },
                text: 'add_category_screen.save'.tr,
              ),
            ],
          ),
        ),
      ),
    );
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