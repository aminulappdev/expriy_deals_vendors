import 'dart:io';

import 'package:expriy_deals_vendors/app/utils/app_colors.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:expriy_deals_vendors/app/widgets/gradiant_elevated_button.dart';
import 'package:expriy_deals_vendors/app/widgets/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatefulWidget {
  static const String routeName = '/profile-account-screen';
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? image;
  final ImagePickerHelper _imagePickerHelper = ImagePickerHelper();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController numberCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0.h),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                heightBox20,
                CustomAppBar(name: 'Update profile'),
                heightBox12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 40.r,
                          child: image != null
                              ? ClipOval(
                                  child: Image.file(
                                    image!,
                                    width: 80.h,
                                    height: 80.h,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                ),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0, 
                            child: InkWell(
                              onTap: () {
                                _imagePickerHelper.showAlertDialog(context,
                                    (File pickedImage) {
                                  setState(() {
                                    image = pickedImage;
                                  });
                                });
                              },
                              child: CircleAvatar(
                                  backgroundColor:
                                      AppColors.iconButtonThemeColor,
                                  radius: 16.r,
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 20.h,
                                  )),
                            ))
                      ],
                    ),
                    widthBox8,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '',
                          style: GoogleFonts.poppins(fontSize: 14.sp),
                        ),
                        Text(
                          '',
                          style: GoogleFonts.poppins(
                              fontSize: 12.sp, color: Color(0xff626262)),
                        ),
                      ],
                    )
                  ],
                ),
                heightBox12,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Store Name',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                    heightBox4,
                    TextFormField(
                      controller: nameCtrl,
                      decoration: InputDecoration(),
                    ),
                    heightBox12,
                    Text(
                      'Owner Name',
                      style:
                          TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                    heightBox4,
                    TextFormField(
                      initialValue: '',
                      enabled: false,
                      decoration: InputDecoration(),
                    ),
                    heightBox12,
                    Text(
                      'Email adress',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                    heightBox4,
                    TextFormField(
                      controller: numberCtrl,
                      decoration: InputDecoration(),
                    ),
                    heightBox12,
                    Text(
                      'Store Description',
                      style:
                          TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                    heightBox4,
                    TextFormField(
                      maxLines: 3,
                      initialValue: '',
                      enabled: false,
                      decoration: InputDecoration(),
                    ),
                    heightBox12,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Contact Information',
                          style:
                              TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                        ),
                        Icon(Icons.add)
                      ],
                    ),

                    heightBox4,
                    TextFormField(
                      initialValue: '',
                      enabled: false,
                      decoration: InputDecoration(),
                    ),
                    heightBox12,
                    Text(
                      'Location',
                      style:
                          TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                    heightBox4,
                    TextFormField(
                   
                      initialValue: '',
                      enabled: false,
                      decoration: InputDecoration(),
                    ),
                    heightBox12,
                    Text(
                      'Availability',
                      style:
                          TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                    heightBox4,
                    TextFormField(
                      
                      initialValue: '',
                      enabled: false,
                      decoration: InputDecoration(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                  ],

                ),
                CustomElevatedButton(onPressed: () {}, text: 'Save')
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> onTapToNextButton() async {
  //   if (_formKey.currentState!.validate()) {
  //     final bool isSuccess = await updateProfileController.updateProfile(
  //       name: nameCtrl.text,
  //       number: numberCtrl.text,
  //       image: image, // 🟢 এটুকু যোগ করো
  //     );

  //     if (isSuccess) {
  //       if (mounted) {
  //         Get.find<ProfileController>().getProfileData();
  //         showSnackBarMessage(context, 'Profile updated');
  //         Navigator.pushNamed(context, MainButtonNavbarScreen.routeName);
  //       } else {
  //         if (mounted) {
  //           showSnackBarMessage(
  //               context, updateProfileController.errorMessage!, true);
  //         }
  //       }
  //     } else {
  //       if (mounted) {
  //         // print('Error show ----------------------------------');
  //         showSnackBarMessage(
  //             context, updateProfileController.errorMessage!, true);
  //       }
  //     }
  //   }
  // }
}
