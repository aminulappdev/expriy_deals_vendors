import 'package:expriy_deals_vendors/app/modules/profile/views/edit_profile_screen.dart';
import 'package:expriy_deals_vendors/app/modules/profile/widgets/profile_drawer_feature.dart';
import 'package:expriy_deals_vendors/app/utils/assets_path.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12.0.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightBox50,
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(AssetsPath.appleLogo),
                    ),
                    heightBox4,
                    Text(
                      'Md Aminul Islam',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                    Text('aminulappdev@gmail.com',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              heightBox12,
              ProfileDrawerFeature(
                feature: 'Edit Profile',
                icon: Icons.person,
                ontap: () {
                  Get.to(EditProfile());
                },
              ),
              ProfileDrawerFeature(
                feature: 'Address',
                icon: Icons.location_on,
                ontap: () {
                  // Navigator.pushNamed(context, MyOrderScreen.routeName);
                },
              ),
              ProfileDrawerFeature(
                feature: 'Payment',
                icon: Icons.payment,
                ontap: () {
                  // Navigator.pushNamed(context, HistoryScreen.routeName);
                },
              ),
              heightBox8,
              Text(
                'Settings',
                style: GoogleFonts.poppins(
                    fontSize: 12, fontWeight: FontWeight.w500),
              ),
              heightBox12,
              ProfileDrawerFeature(
                feature: 'Notification',
                icon: Icons.notifications,
                ontap: () {
                  // Navigator.pushNamed(context, NotificationScreen.routeName);
                },
              ),
              heightBox8,
              Text(
                'Support',
                style: GoogleFonts.poppins(
                    fontSize: 12, fontWeight: FontWeight.w500),
              ),
              heightBox12,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileDrawerFeature(
                    feature: 'Policies',
                    icon: Icons.security,
                    ontap: () {
                      // Navigator.pushNamed(context, InfoScreen.routeName,
                      //     arguments: {
                      //       'appBarTitle': 'Privacy and Policies',
                      //       'data':
                      //           '${controller.contentlist?[0].privacyPolicy}'
                      //     });
                    },
                  ),
                  ProfileDrawerFeature(
                    feature: 'About Us',
                    icon: Icons.groups_2_sharp,
                    ontap: () {
                      // Navigator.pushNamed(context, InfoScreen.routeName,
                      //     arguments: {
                      //       'appBarTitle': 'About Us',
                      //       'data': '${controller.contentlist?[0].aboutUs}'
                      //     });
                    },
                  ),
                  heightBox8,
                  heightBox14,
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 40,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Color(0xffFF0000).withOpacity(0.20),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.logout,
                            color: Colors.red,
                          ),
                          widthBox4,
                          Text(
                            'Logout',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void onTapLogoutBTN() {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) => AlertDialog(
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  //       title: Center(
  //         child: Text(
  //           textAlign: TextAlign.center,
  //           'Do you want to log out this profile?',
  //           style: GoogleFonts.poppins(fontSize: 20),
  //         ),
  //       ),
  //       actions: [
  //         GestureDetector(
  //           onTap: () async {
  //             // Google Sign-Out
  //             try {
  //               await GoogleSignIn().signOut();
  //               print('Google signed out');
  //             } catch (e) {
  //               print('Error signing out from Google: $e');
  //             }

  //             // Clear local token
  //             box.remove('user-login-access-token');
  //             print('Token after logout: ${box.read('user-login-access-token')}');

  //             // Redirect to Sign In
  //             Navigator.pushNamedAndRemoveUntil(
  //               context,
  //               SignInScreen.routeName,
  //               (Route<dynamic> route) => false,
  //             );
  //           },
  //           child: Container(
  //             height: 32.h,
  //             width: 120.w,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(10),
  //               color: Color(0xff305FA1).withOpacity(0.1),
  //               border: Border.all(color: Color(0xff305FA1)),
  //             ),
  //             child: Center(
  //               child: Text(
  //                 'YES',
  //                 style: TextStyle(color: Color(0xff305FA1), fontSize: 14),
  //               ),
  //             ),
  //           ),
  //         ),
  //         GestureDetector(
  //           onTap: () => Navigator.pop(context),
  //           child: Container(
  //             height: 32.h,
  //             width: 120.w,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(10),
  //               color: Color(0xffA13430).withOpacity(0.1),
  //               border: Border.all(color: Color(0xffA13430)),
  //             ),
  //             child: Center(
  //               child: Text(
  //                 'NO',
  //                 style: TextStyle(color: Color(0xffA13430), fontSize: 14.sp),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
