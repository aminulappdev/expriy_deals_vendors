import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/controllers/create_user_controller.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/views/sign_in_screen.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/widgets/agree_condition_widget.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/widgets/footer_section.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/widgets/welcome_text.dart';
import 'package:expriy_deals_vendors/app/modules/common/views/review_screen.dart';
import 'package:expriy_deals_vendors/app/modules/onboarding/widgets/custom_scafold_background.dart';
import 'package:expriy_deals_vendors/app/utils/app_colors.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:expriy_deals_vendors/app/widgets/gradiant_elevated_button.dart';
import 'package:expriy_deals_vendors/app/widgets/image_picker.dart';
import 'package:expriy_deals_vendors/app/widgets/show_snackBar_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart' as ph;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController desCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController shopnameCtrl = TextEditingController();
  final CreateUserController createUserController =
      Get.put(CreateUserController());

  File? image;
  final ImagePickerHelper _imagePickerHelper = ImagePickerHelper();

  bool showButton = false;
  double? latitude;
  double? longitude;

  Future<void> requestLocationPermission() async {
    final ph.PermissionStatus status = await ph.Permission.location.request();
    if (status.isGranted) {
      // Permission granted; you can now retrieve the location.
    } else if (status.isDenied) {
      print('Location_permission_denied');
    }
  }

  Future<void> getCurrentLocation() async {
    final loc.Location location = loc.Location();
    try {
      final loc.LocationData locationData = await location.getLocation();
      setState(() {
        latitude = locationData.latitude!;
        longitude = locationData.longitude!;
        print('Location is $latitude and $longitude');
      });
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  void toggleShowButton() {
    setState(() {
      showButton = !showButton;
    });
  }

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
              CustomAppBar(
                name: 'sign_up_screen.title'.tr,
              ),
              heightBox16,
              Align(
                alignment: Alignment.center,
                child: WelcomeText(
                  title: 'sign_up_screen.header_title'.tr,
                  subtitle: 'sign_up_screen.header_subtitle'.tr,
                ),
              ),
              heightBox50,
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('sign_up_screen.full_name'.tr,
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff626262))),
                    heightBox8,
                    TextFormField(
                      controller: nameCtrl,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'sign_up_screen.enter_name'.tr;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: 'sign_up_screen.enter_name'.tr,
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                    heightBox8,
                    Text('sign_up_screen.shop_name'.tr,
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff626262))),
                    heightBox8,
                    TextFormField(
                      controller: shopnameCtrl,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'sign_up_screen.enter_shop_name'.tr;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: 'sign_up_screen.enter_shop_name'.tr,
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                    heightBox8,
                    Text('sign_up_screen.email'.tr,
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
                        if (value!.isEmpty) {
                          return 'sign_up_screen.enter_email'.tr;
                        }
                        if (EmailValidator.validate(value) == false) {
                          return 'sign_up_screen.enter_valid_email'.tr;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: 'example@gmail.com',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                    heightBox8,
                    Text('sign_up_screen.upload_tax_documents'.tr,
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff626262))),
                    heightBox8,
                    image != null
                        ? Column(
                            children: [
                              Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff626262)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    _imagePickerHelper.showAlertDialog(context,
                                        (File pickedImage) {
                                      setState(() {
                                        image = pickedImage;
                                      });
                                    });
                                  },
                                  child: Center(
                                    child: Text(
                                      'sign_up_screen.upload_again'.tr,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                              heightBox4,
                              Center(
                                child: Image.file(
                                  image!,
                                  width: MediaQuery.of(context).size.width,
                                  height: 250.h,
                                  fit: BoxFit.fill,
                                ),
                              )
                            ],
                          )
                        : Container(
                            height: 140,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff626262)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              onTap: () {
                                _imagePickerHelper.showAlertDialog(context,
                                    (File pickedImage) {
                                  setState(() {
                                    image = pickedImage;
                                  });
                                });
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    size: 40,
                                  ),
                                  Text(
                                    'sign_up_screen.upload'.tr,
                                    style: TextStyle(fontSize: 24),
                                  )
                                ],
                              ),
                            ),
                          ),
                    heightBox8,
                    Center(
                      child: InkWell(
                        onTap: () async {
                          await requestLocationPermission();
                          await getCurrentLocation();
                        },
                        child: Container(
                          height: 36.h,
                          width: 250.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: AppColors.iconButtonThemeColor)),
                          child: Center(child: Text('sign_up_screen.share_location'.tr)),
                        ),
                      ),
                    ),
                    AgreeConditionCheck(
                      onChanged: (value) {
                        setState(() {
                          showButton = value;
                        });
                      },
                    ),
                    heightBox24,
                    Visibility(
                      visible: showButton && latitude != null,
                      replacement: Opacity(
                        opacity: 0.5,
                        child: CustomElevatedButton(
                          text: 'sign_up_screen.verify_email'.tr,
                          onPressed: () {
                            showSnackBarMessage(context,
                                'sign_up_screen.share_location_error'.tr, true);
                          },
                        ),
                      ),
                      child: GetBuilder<CreateUserController>(
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
                                    : 'sign_up_screen.verify_email'.tr,
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
                    ),
                    heightBox12,
                    AuthenticationFooterSection(
                      fTextName: 'sign_up_screen.already_have_account'.tr,
                      fTextColor: Color(0xff33363F),
                      sTextName: 'sign_up_screen.log_in'.tr,
                      sTextColor: Color.fromARGB(255, 253, 107, 45),
                      ontap: () {
                        Get.to(SignInScreen());
                      },
                    ),
                    heightBox100
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
    print('Work');
    if (_formKey.currentState!.validate()) {
      final bool isSuccess = await createUserController.createUser(
          nameCtrl.text,
          shopnameCtrl.text,
          emailCtrl.text,
          image,
          passwordCtrl.text,
          latitude ?? 0.0,
          longitude ?? 0.0);

      if (isSuccess) {
        if (mounted) {
          clearTextField();
          showSnackBarMessage(context, 'sign_up_screen.success_message'.tr);
          Get.to(ReviewScreen());
        }
      } else {
        if (mounted) {
          showSnackBarMessage(
              context, createUserController.errorMessage!, true);
        }
      }
    }
  }

  void clearTextField() {
    emailCtrl.clear();
    nameCtrl.clear();
    shopnameCtrl.clear();
    emailCtrl.clear();
    passwordCtrl.clear();
    image = null;
  }

  @override
  void dispose() {
    super.dispose();
    emailCtrl.dispose();
    nameCtrl.dispose();
    shopnameCtrl.dispose();
    passwordCtrl.dispose();
  }
}