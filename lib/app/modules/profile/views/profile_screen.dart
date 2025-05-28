// ignore_for_file: deprecated_member_use
import 'package:expriy_deals_vendors/app/modules/profile/controllers/profile_controller.dart';
import 'package:expriy_deals_vendors/app/modules/profile/views/change_password_screen.dart';
import 'package:expriy_deals_vendors/app/modules/profile/views/edit_profile_screen.dart';
import 'package:expriy_deals_vendors/app/modules/profile/views/info_screen.dart';
import 'package:expriy_deals_vendors/app/modules/profile/widgets/profile_drawer_feature.dart';
import 'package:expriy_deals_vendors/app/utils/app_text.dart';
import 'package:expriy_deals_vendors/app/utils/assets_path.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/utils/show_dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                              backgroundImage: controller.profileData?.profile != null
                                  ? NetworkImage(controller.profileData!.profile!)
                                  : const AssetImage(AssetsPath.appleLogo),
                            ),
                            heightBox4,
                            Text(
                              controller.profileData?.name ?? 'No name',
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              controller.profileData?.email ?? 'No email',
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                          ],
                        );
                }),
              ),
              heightBox12,
              ProfileDrawerFeature(
                feature: 'Edit Profile',
                icon: Icons.person,
                ontap: () {
                  if (controller.profileData != null) {
                    Get.to(EditProfile(profileData: controller.profileData!));
                  } else {
                    Get.snackbar('Error', 'Profile data not available');
                  }
                },
              ),
              
              // ProfileDrawerFeature(
              //   feature: 'Payment',
              //   icon: Icons.payment,
              //   ontap: () => Get.to(const PaymentSuccessScreen()),
              // ),
              heightBox8,
              Text(
                'Settings',
                style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              heightBox12,
              ProfileDrawerFeature(
                feature: 'Notification',
                icon: Icons.notifications,
                ontap: () {
                  // NotificationScreen নেভিগেশন যোগ করুন
                },
              ),
              heightBox8,
              ProfileDrawerFeature(
                feature: 'Change password',
                icon: Icons.lock,
                ontap: () => Get.to(const ChangePasswordScreen()),
              ),
              heightBox8,
              ProfileDrawerFeature(
                feature: 'Delete account',
                icon: Icons.delete,
                ontap: () {},
              ),
              heightBox8,
              Text(
                'Support',
                style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              heightBox12,
              ProfileDrawerFeature(
                feature: 'Policies',
                icon: Icons.security,
                ontap: () => Get.to(const InfoScreen(appBarTitle: 'Privacy & Policies', data: DemoText.policies)),
              ),
              ProfileDrawerFeature(
                feature: 'About Us',
                icon: Icons.groups_2_sharp,
                ontap: () => Get.to(const InfoScreen(appBarTitle: 'About Us', data: DemoText.aboutUs)),
              ),
              heightBox8,
              heightBox14,
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () => DialogUtils.showLogoutDialog(context, controller.logout),
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
                        const Text(
                          'Logout',
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
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
}