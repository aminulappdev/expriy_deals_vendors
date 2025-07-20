import 'package:expriy_deals_vendors/app/modules/bank/views/bank_info_screen.dart';
import 'package:expriy_deals_vendors/app/modules/common/views/language_screen.dart';
import 'package:expriy_deals_vendors/app/modules/common/views/notification_screen.dart';
import 'package:expriy_deals_vendors/app/modules/profile/controllers/profile_controller.dart';
import 'package:expriy_deals_vendors/app/modules/profile/controllers/shop_controller.dart';
import 'package:expriy_deals_vendors/app/modules/profile/controllers/stripe_request_controller.dart';
import 'package:expriy_deals_vendors/app/modules/profile/views/change_password_screen.dart';
import 'package:expriy_deals_vendors/app/modules/profile/views/edit_profile_screen.dart';
import 'package:expriy_deals_vendors/app/modules/profile/views/edit_shop.dart';
import 'package:expriy_deals_vendors/app/modules/profile/views/info_screen.dart';
import 'package:expriy_deals_vendors/app/modules/profile/widgets/profile_drawer_feature.dart';
import 'package:expriy_deals_vendors/app/modules/widthraw/views/widthdraw_screen.dart';
import 'package:expriy_deals_vendors/app/utils/assets_path.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/utils/show_dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final StripeRequestController stripeRequestController =
      Get.put(StripeRequestController());

  static final customCacheManager = CacheManager(
    Config(
      'customCacheKey',
      stalePeriod: const Duration(days: 15),
      maxNrOfCacheObjects: 100,
    ),
  );

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    final controller = Get.find<ProfileController>();
    final shopController = Get.find<ShopController>();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12.0.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightBox50,
              Center(
                child: Obx(() {
                  return controller.inProgress
                      ? const CircularProgressIndicator()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  controller.profileData?.profile != null
                                      ? NetworkImage(
                                          controller.profileData!.profile!)
                                      : const AssetImage(AssetsPath.logo),
                            ),
                            heightBox4,
                            Text(
                              controller.profileData?.name ?? 'No name',
                              style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              controller.profileData?.email ?? 'No email',
                              style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        );
                }),
              ),
              heightBox12,
              ProfileDrawerFeature(
                feature: 'profile_screen.edit_profile'.tr,
                icon: Icons.person,
                ontap: () {
                  if (controller.profileData != null) {
                    Get.to(EditProfile(profileData: controller.profileData!));
                  } else {
                    Get.snackbar('Error',
                        'profile_screen.error_profile_not_available'.tr);
                  }
                },
              ),
              ProfileDrawerFeature(
                feature: 'profile_screen.edit_shop'.tr,
                icon: Icons.shop,
                ontap: () {
                  if (shopController.shopData != null) {
                    print(
                        'Shop data profile page: ${shopController.shopData?.name}');
                    Get.to(EditShopScreen(
                      shopData: shopController.shopData!,
                    ));
                  } else {
                    Get.snackbar(
                        'Error', 'profile_screen.error_shop_not_available'.tr);
                  }
                },
              ),
              ProfileDrawerFeature(
                feature: 'profile_screen.bank_details'.tr,
                icon: Icons.payment,
                ontap: () => Get.to(const BankInfoScreen()),
              ),
              heightBox8,
              ProfileDrawerFeature(
                feature: 'profile_screen.widthdraw'.tr,
                icon: Icons.payment,
                ontap: () => Get.to(const WidthdrawScreen()),
              ),
              heightBox8,
              ProfileDrawerFeature(
                feature: 'profile_screen.connect_account'.tr,
                icon: Icons.link,
                ontap: () => _launchURL(),
              ),
              heightBox8,
              Text(
                'profile_screen.settings'.tr,
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              heightBox12,
              ProfileDrawerFeature(
                feature: 'profile_screen.notification'.tr,
                icon: Icons.notifications,
                ontap: () => Get.to(NotificationScreen()),
              ),
              heightBox8,
              ProfileDrawerFeature(
                feature: 'profile_screen.language'.tr,
                icon: Icons.language,
                ontap: () => Get.to(LanguageScreen()),
              ),
              heightBox8,
              ProfileDrawerFeature(
                feature: 'profile_screen.change_password'.tr,
                icon: Icons.lock,
                ontap: () => Get.to(const ChangePasswordScreen()),
              ),
              heightBox8,
              Text(
                'profile_screen.support'.tr,
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ProfileDrawerFeature(
                feature: 'profile_screen.policies'.tr,
                icon: Icons.security,
                ontap: () => Get.to(InfoScreen(
                    appBarTitle: 'profile_screen.policies'.tr,
                    param: 'privacyPolicy')),
              ),
              ProfileDrawerFeature(
                feature: 'profile_screen.about_us'.tr,
                icon: Icons.groups_2_sharp,
                ontap: () => Get.to(InfoScreen(
                    appBarTitle: 'profile_screen.about_us'.tr,
                    param: 'aboutUs')),
              ),
              heightBox14,
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () =>
                      DialogUtils.showLogoutDialog(context, controller.logout),
                  child: Container(
                    height: 40,
                    width: 140,
                    decoration: BoxDecoration(
                      color: const Color(0xffFF0000).withOpacity(0.20),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.logout, color: Colors.red),
                        widthBox4,
                        Text(
                          'profile_screen.logout'.tr,
                          style: GoogleFonts.poppins(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL() async {
    final String? link = await stripeRequestController.stripeRequest();
    if (link != null) {
      final Uri url = Uri.parse(link);
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    } else {
      Get.snackbar('Error', 'profile_screen.error_link_not_available'.tr);
    }
  }
}