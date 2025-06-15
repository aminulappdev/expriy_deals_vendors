import 'package:expriy_deals_vendors/app/modules/common/controllers/notification_controller.dart';
import 'package:expriy_deals_vendors/app/utils/app_colors.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final AllNotificationController allNotificationController =
      Get.put(AllNotificationController());

  bool isShowNotification = true;

  @override
  void initState() {
    allNotificationController.getNotificationList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AllNotificationController>(builder: (controller) {
        if (controller.inProgress) {
          return Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: EdgeInsets.all(12.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightBox24,
              CustomAppBar(name: 'Notification'),
              heightBox5,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('All notifications'),
                ],
              ),
              heightBox8,
              isShowNotification == true
                  ? Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount:
                            controller.notificationList?.data.length ?? 0,
                        itemBuilder: (context, index) {
                          DateTime? isoDate = controller
                              .notificationList?.data[index].createdAt;

                          // ignore: unused_local_variable
                          String readableDate =
                              DateFormat('MMMM dd, yyyy').format(isoDate!);
                          String readableTime =
                              DateFormat('h:mm a').format(isoDate);
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 8),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: AppColors.iconButtonThemeColor)),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                            width: 200.h,
                                            child: Text(
                                              '${controller.notificationList!.data[index].message}',
                                              style: TextStyle(
                                                  color: AppColors
                                                      .iconButtonThemeColor,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                        Text(
                                          readableTime,
                                          style: TextStyle(fontSize: 12),
                                        )
                                      ],
                                    ),
                                    heightBox4,
                                    Text(
                                      '${controller.notificationList!.data[index].description}',
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Container(
                      height: 600,
                      child: Center(child: Text('No notification')),
                    )
            ],
          ),
        );
      }),
    );
  }
}
