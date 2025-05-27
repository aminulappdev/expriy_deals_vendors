import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/controllers/create_user_controller.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/views/sign_in_screen.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/views/verify_email_screen.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/widgets/agree_condition_widget.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/widgets/footer_section.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/widgets/welcome_text.dart';
import 'package:expriy_deals_vendors/app/modules/onboarding/widgets/custom_scafold_background.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:expriy_deals_vendors/app/widgets/gradiant_elevated_button.dart';
import 'package:expriy_deals_vendors/app/widgets/image_picker.dart';
import 'package:expriy_deals_vendors/app/widgets/show_snackBar_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


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
  final CreateUserController createUserController =
      Get.put(CreateUserController());

  File? image;
  final ImagePickerHelper _imagePickerHelper = ImagePickerHelper();

  bool _obscureText = true;

  bool showButton = false;

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
                name: 'Sign Up',
              ),
              heightBox16,
              Align(
                alignment: Alignment.center,
                child: WelcomeText(
                  title: 'Create New Account',
                  subtitle: 'Please fill your detail information.',
                ),
              ),
              heightBox50,
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Full Name',
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
                          return 'Enter name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: 'Enter your full name',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                    heightBox8,
                    Text('Description',
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff626262))),
                    heightBox8,
                    TextFormField(
                      controller: desCtrl,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Enter description';
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: 'Enter your description',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                    heightBox8,
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
                        if (value!.isEmpty) {
                          return 'Enter email';
                        }
                        if (EmailValidator.validate(value) == false) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: 'example@gmail.com',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                    heightBox8,
                    Text('Uplpoad your tax documents',
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
                                      'Upload again',
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
                                    'Upload',
                                    style: TextStyle(fontSize: 24),
                                  )
                                ],
                              ),
                            ),
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
                        if (value!.isEmpty) {
                          return 'Enter password';
                        }
                        return null;
                      },
                      obscureText: _obscureText,
                      decoration: InputDecoration(
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
                        hintText: '***********',
                        hintStyle: TextStyle(color: Colors.grey),
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
                      visible: showButton,
                      replacement: Opacity(
                        opacity: 0.5,
                        child: CustomElevatedButton(
                          text: 'Verify Email',
                          onPressed: () {},
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
                                text:
                                    controller.inProgress ? '' : 'Verify Email',
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
                      fTextName: 'Already have an account? ',
                      fTextColor: Color(0xff33363F),
                      sTextName: 'Log In',
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
          desCtrl.text,
          emailCtrl.text,
          image,
          passwordCtrl.text);

      if (isSuccess) {
        if (mounted) {
          print(
              'Otp Token : ${createUserController.createUserData?.otpToken?.token}');
          showSnackBarMessage(context, 'New user created');
          Get.to(VerifyEmailScreen(
            token: '${createUserController.createUserData?.otpToken?.token}',
          ));
          // print('My token ---------------------------------------');
          // print(signUpController.token);
        } else {
          if (mounted) {
            showSnackBarMessage(
                context, createUserController.errorMessage!, true);
          }
        }
      }
    }
  }

  void clearTextField() {
    emailCtrl.clear();
    nameCtrl.clear();
    emailCtrl.clear();
    passwordCtrl.clear();
  }

  @override
  void dispose() {
    super.dispose();

    emailCtrl.dispose();
    nameCtrl.dispose();
    emailCtrl.dispose();
    passwordCtrl.dispose();
  }
}
