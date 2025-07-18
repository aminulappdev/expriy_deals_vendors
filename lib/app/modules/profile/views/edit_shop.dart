import 'dart:io';
import 'package:expriy_deals_vendors/app/modules/common/views/main_bottom_nav_bar.dart';
import 'package:expriy_deals_vendors/app/modules/profile/controllers/edit_profile_controller.dart';
import 'package:expriy_deals_vendors/app/modules/profile/controllers/edit_shop_controller.dart';
import 'package:expriy_deals_vendors/app/modules/profile/controllers/shop_controller.dart';
import 'package:expriy_deals_vendors/app/modules/profile/model/my_shop_model.dart';
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
import 'package:google_fonts/google_fonts.dart';

class EditShopScreen extends StatefulWidget {
  const EditShopScreen({super.key, required this.shopData});
  final MyShopData shopData;

  @override
  State<EditShopScreen> createState() => _EditShopScreenState();
}

class _EditShopScreenState extends State<EditShopScreen> {
  final EditProfileController editProfileController =
      Get.find<EditProfileController>();
  File? image;
  final ImagePickerHelper _imagePickerHelper = ImagePickerHelper();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController shopNameCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();

  final ShopController shopController = Get.put(ShopController());
  final EditShopController editShopController = Get.put(EditShopController());

  static final customCacheManager = CacheManager(
    Config(
      'customCacheKey',
      stalePeriod: const Duration(days: 15),
      maxNrOfCacheObjects: 100,
    ),
  );

  @override
  void initState() {
    super.initState();
    shopNameCtrl.text = widget.shopData.name ?? '';
    descriptionCtrl.text = widget.shopData.description ?? '';
    addressCtrl.text = widget.shopData.address ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0.h),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: GetBuilder<ShopController>(builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  heightBox20,
                  CustomAppBar(name: 'edit_shop_screen.title'.tr),
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
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                          widget.shopData.logo ??
                                              'https://fastly.picsum.photos/id/879/200/300.jpg?hmac=07llkorYxtpw0EwxaeqFKPC5woveWVLykQVnIOyiwd8',
                                        ),
                                      ),
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
                                backgroundColor: AppColors.iconButtonThemeColor,
                                radius: 16.r,
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 20.h,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  heightBox12,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'edit_shop_screen.shop_name'.tr,
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      heightBox4,
                      TextFormField(
                        controller: shopNameCtrl,
                        decoration: InputDecoration(
                          hintText: 'edit_shop_screen.shop_name'.tr,
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'edit_shop_screen.enter_shop_name'.tr;
                          }
                          return null;
                        },
                      ),
                      heightBox12,
                      Text(
                        'edit_shop_screen.description'.tr,
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      heightBox4,
                      TextFormField(
                        controller: descriptionCtrl,
                        decoration: InputDecoration(
                          hintText: 'edit_shop_screen.description'.tr,
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'edit_shop_screen.enter_description'.tr;
                          }
                          return null;
                        },
                      ),
                      heightBox12,
                      Text(
                        'edit_shop_screen.address'.tr,
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      heightBox4,
                      TextFormField(
                        controller: addressCtrl,
                        decoration: InputDecoration(
                          hintText: 'edit_shop_screen.address'.tr,
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'edit_shop_screen.enter_address'.tr;
                          }
                          return null;
                        },
                      ),
                      heightBox12,
                      SizedBox(height: 20.h),
                    ],
                  ),
                  GetBuilder<EditShopController>(
                    builder: (controller) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomElevatedButton(
                            onPressed: controller.inProgress
                                ? () {}
                                : () => onTapToNextButton(),
                            text: controller.inProgress ? '' : 'edit_shop_screen.title'.tr,
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
              );
            }),
          ),
        ),
      ),
    );
  }

  Future<void> onTapToNextButton() async {
    if (_formKey.currentState!.validate()) {
      final bool isSuccess = await editShopController.updateShop(
        image,
        shopNameCtrl.text,
        descriptionCtrl.text,
        addressCtrl.text,
        StorageUtil.getData(StorageUtil.userAccessToken),
      );

      if (isSuccess) {
        if (mounted) {
          await shopController.getShopData();
          showSnackBarMessage(context, 'edit_shop_screen.success_message'.tr);
          Get.to(() => MainButtonNavbarScreen());
        }
      } else {
        if (mounted) {
          showSnackBarMessage(
              context, editShopController.errorMessage ?? 'edit_shop_screen.error_message'.tr, true);
        }
      }
    }
  }

  @override
  void dispose() {
    shopNameCtrl.dispose();
    descriptionCtrl.dispose();
    addressCtrl.dispose();
    super.dispose();
  }
}