// import 'package:antoinette/app/modules/common/controllers/all_notification_controllers.dart';
// import 'package:antoinette/app/utils/app_colors.dart';
// import 'package:antoinette/app/utils/responsive_size.dart';
// import 'package:antoinette/app/widgets/costom_app_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';

// class NotificationScreen extends StatefulWidget {
//   const NotificationScreen({super.key});
//   static const String routeName = '/notification-screen';
//   @override
//   State<NotificationScreen> createState() => _NotificationScreenState();
// }

// class _NotificationScreenState extends State<NotificationScreen> {
//   AllNotificationController allNotificationController =
//       Get.find<AllNotificationController>();
//   final ScrollController scrollController = ScrollController();

//   @override
//   void initState() {
//     allNotificationController.getNotificationList();
//     scrollController.addListener(_loadMoreData);

//     super.initState();
//   }

//   void _loadMoreData() {
//     if (scrollController.position.extentAfter < 500 &&
//         !allNotificationController.inProgress) {
//       allNotificationController.getNotificationList();
//     }
//     {
//       allNotificationController.getNotificationList();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GetBuilder<AllNotificationController>(builder: (controller) {
//         if (controller.inProgress && controller.page == 1) {
//           return Center(child: CircularProgressIndicator());
//         }
//         return Padding(
//           padding: EdgeInsets.all(12.0.h),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               heightBox20,
//               CustomAppBar(name: 'Notification'),          
//               Expanded(
//                 child: ListView.builder(
//                   controller: scrollController,
//                   itemCount: controller.allNotification.length,
//                   itemBuilder: (context, index) {
//                      DateTime? isoDate = controller.notificationList[index].date;
//                      // ignore: unused_local_variable
//                      String readableDate = DateFormat('MMMM dd, yyyy').format(isoDate!);
//                      String readableTime = DateFormat('h:mm a').format(isoDate);
//                     return Padding(
//                       padding: EdgeInsets.symmetric(vertical: 4),
//                       child: Container(
//                         width: MediaQuery.of(context).size.width,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(
//                                 color: AppColors.iconButtonThemeColor)),
//                         child: Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   SizedBox(
//                                       width: 200.h,
//                                       child: Text(
//                                         '${controller.notificationList[index].message}',
//                                         style: TextStyle(
//                                             color: AppColors
//                                                 .iconButtonThemeColor,
//                                             fontSize: 15.sp,
//                                             fontWeight: FontWeight.w600),
//                                       )),                                  
//                                   Text(readableTime)
//                                 ],
//                               ),
//                               heightBox4,
//                               Text(
//                                 '${controller.notificationList[index].description}',
//                                 style: TextStyle(fontSize: 12),
//                               ) 
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               )
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }
