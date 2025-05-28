// ignore_for_file: unused_field

import 'dart:io';
import 'package:expriy_deals_vendors/app/modules/common/views/main_bottom_nav_bar.dart';
import 'package:expriy_deals_vendors/app/modules/profile/controllers/edit_profile_controller.dart';
import 'package:expriy_deals_vendors/app/modules/profile/controllers/profile_controller.dart';
import 'package:expriy_deals_vendors/app/modules/profile/model/profile_model.dart';
import 'package:expriy_deals_vendors/app/utils/app_colors.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:expriy_deals_vendors/app/widgets/gradiant_elevated_button.dart';
import 'package:expriy_deals_vendors/app/widgets/image_picker.dart';
import 'package:expriy_deals_vendors/app/widgets/show_snackBar_message.dart';
import 'package:expriy_deals_vendors/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class EditProfile extends StatefulWidget {
  final ProfileData profileData;
  const EditProfile({super.key, required this.profileData});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final EditProfileController editProfileController =
      Get.find<EditProfileController>();
  File? image;
  final ImagePickerHelper _imagePickerHelper = ImagePickerHelper();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController contactCtrl = TextEditingController();
  TextEditingController locationCtrl = TextEditingController();
  TextEditingController cityCtrl = TextEditingController();
  TextEditingController stateCtrl = TextEditingController();
  TextEditingController zipcodeCtrl = TextEditingController();
  TextEditingController countrynCtrl = TextEditingController();

  static final customCacheManager = CacheManager(
    Config(
      'customCacheKey', // ক্যাশের জন্য আলাদা নাম
      stalePeriod: const Duration(days: 15),
      maxNrOfCacheObjects: 100,
    ),
  );

  @override
  void initState() {
    nameCtrl.text = widget.profileData.name ?? 'no data';
    emailCtrl.text = widget.profileData.email ?? 'no data';
    contactCtrl.text = widget.profileData.phoneNumber ?? 'no data';
    locationCtrl.text = widget.profileData.address ?? 'no data';
    cityCtrl.text = widget.profileData.city ?? 'no data';
    stateCtrl.text = widget.profileData.state ?? 'no data';
    zipcodeCtrl.text = widget.profileData.zipCode ?? 'no data';
    countrynCtrl.text = widget.profileData.country ?? 'no data';
    super.initState();
  }

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
                              // : CachedNetworkImage(
                              //     cacheManager: customCacheManager,
                              //     key: UniqueKey(),
                              //     height: 80,
                              //     width: 80,
                              //     fit: BoxFit.fill,
                              //     maxHeightDiskCache: 200,
                              //     imageUrl: widget.profileData.profile ??
                              //         'https://fastly.picsum.photos/id/879/200/300.jpg?hmac=07llkorYxtpw0EwxaeqFKPC5woveWVLykQVnIOyiwd8',
                              //   )
                              : Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(widget
                                                .profileData.profile ??
                                            'https://fastly.picsum.photos/id/879/200/300.jpg?hmac=07llkorYxtpw0EwxaeqFKPC5woveWVLykQVnIOyiwd8')),
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
                  ],
                ),
                heightBox12,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
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
                      'Email adress',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                    heightBox4,
                    TextFormField(
                      enabled: false,
                      controller: emailCtrl,
                      decoration: InputDecoration(),
                    ),
                    heightBox12,
                    Text(
                      'Contact Information',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                    heightBox4,
                    TextFormField(
                      controller: contactCtrl,
                      decoration: InputDecoration(),
                    ),
                    heightBox12,
                    Text(
                      'Adress',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                    heightBox4,
                    TextFormField(
                      controller: locationCtrl,
                      decoration: InputDecoration(),
                    ),
                    heightBox12,
                    Text(
                      'City',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                    heightBox4,
                    TextFormField(
                      controller: cityCtrl,
                      decoration: InputDecoration(),
                    ),
                    heightBox12,
                    Text(
                      'State',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                    heightBox4,
                    TextFormField(
                      controller: stateCtrl,
                      decoration: InputDecoration(),
                    ),
                    heightBox12,
                    Text(
                      'Zipcode',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                    heightBox4,
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: zipcodeCtrl,
                      decoration: InputDecoration(),
                    ),
                    heightBox12,
                    Text(
                      'Country',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                    heightBox4,
                    TextFormField(
                      controller: countrynCtrl,
                      decoration: InputDecoration(),
                    ),
                    heightBox12,
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
                GetBuilder<EditProfileController>(
                  builder: (controller) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomElevatedButton(
                          onPressed: controller.inProgress
                              ? () {}
                              : () => onTapToNextButton(),
                          text: controller.inProgress ? '' : 'Update',
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onTapToNextButton() async {
    if (_formKey.currentState!.validate()) {
      final bool isSuccess = await editProfileController.updateProfile(
          image,
          nameCtrl.text,
          emailCtrl.text,
          contactCtrl.text,
          locationCtrl.text,
          cityCtrl.text,
          stateCtrl.text,
          zipcodeCtrl.text,
          countrynCtrl.text,
          StorageUtil.getData(StorageUtil.userAccessToken));

      if (isSuccess) {
        if (mounted) {
          Get.find<ProfileController>().getProfileData();
          showSnackBarMessage(context, 'Profile updated');
          Get.to(MainButtonNavbarScreen());
        } else {
          if (mounted) {
            showSnackBarMessage(
                context, editProfileController.errorMessage!, true);
          }
        }
      } else {
        if (mounted) {
          // print('Error show ----------------------------------');
          showSnackBarMessage(
              context, editProfileController.errorMessage!, true);
        }
      }
    }
  }
}
