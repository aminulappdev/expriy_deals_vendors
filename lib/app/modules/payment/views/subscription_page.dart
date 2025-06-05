
// import 'package:expriy_deals_vendors/app/modules/payment/controllers/all_package_controller.dart';
// import 'package:expriy_deals_vendors/app/modules/payment/controllers/my_subscription_controller.dart';
// import 'package:expriy_deals_vendors/app/modules/payment/controllers/payment_services.dart';
// import 'package:expriy_deals_vendors/app/modules/payment/controllers/subscription_controller.dart';
// import 'package:expriy_deals_vendors/app/modules/profile/controllers/profile_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:google_fonts/google_fonts.dart';

// class SubscriptionScreen extends StatefulWidget {
//   static const String routeName = '/subscription-screen';
//   const SubscriptionScreen({super.key});

//   @override
//   State<SubscriptionScreen> createState() => _SubscriptionScreenState();
// }

// class _SubscriptionScreenState extends State<SubscriptionScreen> {
//   ProfileController profileController = Get.find<ProfileController>();
//   SubscriptionController subscriptionController =
//       Get.put(SubscriptionController());
//   AllPackageController allPackageController = Get.find<AllPackageController>();
//   final PaymentService paymentService = PaymentService();
//   final MySubscriptionController mySubscriptionController =
//       Get.find<MySubscriptionController>();
//   late String userId;
//   bool isStudent = false;
//   bool isMonthlyActive = false;
//   bool isYearlyActive = false;

//   @override
//   void initState() {
//     super.initState();
//     userId = profileController.profileData?.id ?? '';
    
//     allPackageController.getAllPackage();
//     mySubscriptionController.getMySubscriptions().then((_) {
//       _checkSubscriptionStatus();
//     }).catchError((error) {
//       print("Error fetching subscriptions: $error");
//     });
//   }

//   String? _getBillingCycle(String? subscriptionId) {
//     if (subscriptionId == null) return null;
//     final package = allPackageController.packageItemList?.firstWhere(
//       (pkg) => pkg.sId == subscriptionId,
//       orElse: () => null as dynamic, // workaround for nullable, but better to use try-catch
//     );
//     return package?.billingCycle?.toLowerCase();
//   }

//   void _checkSubscriptionStatus() {
//     try {
//       if (mySubscriptionController.subscriptionData == null ||
//           mySubscriptionController.subscriptionData!.isEmpty) {
//         isMonthlyActive = false;
//         isYearlyActive = false;
//       } else {
//         isMonthlyActive = mySubscriptionController.subscriptionData!.any(
//           (subscription) =>
//               (subscription.paymentStatus ?? "") == "paid" &&
//               (subscription.status ?? "") == "confirmed" &&
//               (_getBillingCycle(subscription.id) ?? "") == "monthly" &&
//               (subscription.expiredAt?.isAfter(DateTime.now()) ?? false),
//         );

//         isYearlyActive = mySubscriptionController.subscriptionData!.any(
//           (subscription) =>
//               (subscription.paymentStatus ?? "") == "paid" &&
//               (subscription.status ?? "") == "confirmed" &&
//               (_getBillingCycle(subscription.id) ?? "") == "yearly" &&
//               (subscription.expiredAt?.isAfter(DateTime.now()) ?? false),
//         );
//       }
//       setState(() {});
//     } catch (e) {
//       print("Error in _checkSubscriptionStatus: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       body: GetBuilder<AllPackageController>(
//         builder: (controller) {
//           if (controller.inProgress) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (controller.packageItemList == null ||
//               controller.packageItemList!.isEmpty) {
//             return const Center(child: Text("No packages available"));
//           }

//           return Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 12.h),
//                   const CustomAppBar(name: 'Subscriptions'),
//                   SizedBox(height: 24.h),
//                   SizedBox(
//                     height: 120,
//                     child: GetBuilder<MySubscriptionController>(
//                       builder: (controller) {
//                         if (controller.inProgress) {
//                           return const Center(
//                               child: CircularProgressIndicator());
//                         }
//                         final activeSubscriptions = controller
//                                 .subscriptionData?.where(
//                                   (subscription) =>
//                                       (subscription.paymentStatus ?? "") ==
//                                           "paid" &&
//                                       (subscription.status ?? "") == "confirmed" &&
//                                       (subscription.expiredAt?.isAfter(
//                                               DateTime.now()) ??
//                                           false),
//                                 )
//                                 .toList() ??
//                             [];

//                         if (activeSubscriptions.isEmpty) {
//                           return const Center(
//                               child: Text("No active subscription"));
//                         }

//                         return ListView.builder(
//                           padding: EdgeInsets.zero,
//                           itemCount: activeSubscriptions.length,
//                           itemBuilder: (context, index) {
//                             final subscription = activeSubscriptions[index];
//                             DateTime? expireDate = subscription.expiredAt;
//                             if (expireDate == null) return const SizedBox.shrink();
//                             DateTime today = DateTime.now();
//                             String formattedBookingDate =
//                                 DateFormat('MMMM dd, yyyy').format(expireDate);
//                             int daysLeft = expireDate.difference(today).inDays;
//                             String daysLeftText =
//                                 daysLeft > 0 ? '$daysLeft days left' : 'Expired';

//                             return Card(
//                               child: Container(
//                                 width: MediaQuery.of(context).size.width,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20)),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         (_getBillingCycle(subscription.id) ??
//                                                     "monthly") ==
//                                                 "monthly"
//                                             ? 'Monthly Plan'
//                                             : 'Yearly Plan',
//                                         style: TextStyle(
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.w600),
//                                       ),
//                                       heightBox4,
//                                       Text(
//                                         daysLeftText,
//                                         style: TextStyle(fontSize: 14),
//                                       ),
//                                       heightBox4,
//                                       Text(
//                                         'Expiry date $formattedBookingDate',
//                                         style: TextStyle(fontSize: 14),
//                                       ),
//                                       heightBox4,
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         );
//                       },
//                     ),
//                   ),
//                   Text(
//                     'Premium Membership',
//                     style: TextStyle(
//                       fontSize: 24.sp,
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.iconButtonThemeColor,
//                     ),
//                   ),
//                   SizedBox(height: 10.h),
//                   ListView.builder(
//                     padding: EdgeInsets.zero,
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: controller.packageItemList!.length,
//                     itemBuilder: (context, pkgIndex) {
//                       final package = controller.packageItemList![pkgIndex];
//                       int? price = isStudent
//                           ? (package.price ?? 0 / 2).toInt()
//                           : package.price;
//                       bool isPackageActive = (package.billingCycle?.toLowerCase() ??
//                               "monthly") ==
//                           "monthly"
//                           ? isMonthlyActive
//                           : isYearlyActive;

//                       return Container(
//                         margin: EdgeInsets.only(bottom: 24.h),
//                         padding: EdgeInsets.all(16.w),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(12.r),
//                           border: Border.all(color: Colors.grey.shade300),
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               package.title ?? '',
//                               style: TextStyle(
//                                 fontSize: 20.sp,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(height: 4.h),
//                             Text(
//                               package.subtitle ?? '',
//                               style: TextStyle(
//                                 fontSize: 14.sp,
//                                 color: Colors.grey.shade600,
//                               ),
//                             ),
//                             SizedBox(height: 10.h),
//                             Text(
//                               "₦$price / ${package.billingCycle?.toLowerCase() ?? 'monthly'}",
//                               style: GoogleFonts.roboto(
//                                 fontSize: 16.sp,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             SizedBox(height: 16.h),
//                             Text(
//                               "Features:",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 15.sp,
//                               ),
//                             ),
//                             SizedBox(height: 8.h),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: List.generate(
//                                 package.description?.length ?? 0,
//                                 (descIndex) => Padding(
//                                   padding:
//                                       const EdgeInsets.symmetric(vertical: 4),
//                                   child: Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       const Icon(Icons.check_circle,
//                                           size: 18, color: Colors.green),
//                                       SizedBox(width: 6.w),
//                                       Expanded(
//                                         child: Text(
//                                           package.description![descIndex] ?? '',
//                                           style: TextStyle(fontSize: 14.sp),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 24.h),
//                             SizedBox(
//                               width: double.infinity,
//                               child: GetBuilder<SubscriptionController>(
//                                 builder: (controller) {
//                                   return Stack(
//                                     alignment: Alignment.center,
//                                     children: [
//                                       Opacity(
//                                         opacity: isPackageActive ? 0.5 : 1.0,
//                                         child: GradientElevatedButton(
//                                           onPressed: (isPackageActive ||
//                                                   controller.inProgress)
//                                               ? () {} // Empty function when disabled
//                                               : () => buyNowBTN(package.sId!),
//                                           text: controller.inProgress
//                                               ? ''
//                                               : isPackageActive
//                                                   ? 'Active Subscription'
//                                                   : 'Buy Now',
//                                         ),
//                                       ),
//                                       if (controller.inProgress)
//                                         SizedBox(
//                                           width: 24,
//                                           height: 24,
//                                           child: CircularProgressIndicator(
//                                             strokeWidth: 2,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                     ],
//                                   );
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Future<void> buyNowBTN(String packageid) async {
//     try {
//       final bool isSuccess =
//           await subscriptionController.getSubcription(userId, packageid);
//       if (isSuccess) {
//         if (mounted) {
//           await paymentService.payment(
//             context,
//             'Subscription',
//             userId,
//             subscriptionController.subscriptionResponseData!.id!,
//           );
//           await mySubscriptionController.getMySubscriptions();
//           _checkSubscriptionStatus();
//         }
//       } else {
//         if (mounted) {
//           showSnackBarMessage(
//               context,
//               subscriptionController.errorMessage ?? "Something went wrong",
//               true);
//         }
//       }
//     } catch (e) {
//       if (mounted) {
//         showSnackBarMessage(context, "An error occurred: $e", true);
//       }
//     }
//   }
// }