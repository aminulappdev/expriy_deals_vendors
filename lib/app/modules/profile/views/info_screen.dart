import 'package:expriy_deals_vendors/app/modules/profile/controllers/content_controller.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key, required this.appBarTitle, required this.param});
  final String appBarTitle;
  final String param;

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final ContentController contentController = Get.find<ContentController>();

  @override
  void initState() {
    super.initState();
    contentController.contentData(param: widget.param);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: GetBuilder<ContentController>(
            builder: (controller) {
              print('all data ${controller.contentData}');
              if (controller.inProgress) {
                return SizedBox(
                  height: 500.h,
                  width: double.infinity,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (controller.errorMessage != null) {
                return SizedBox(
                  height: 500.h,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      controller.errorMessage ??
                          'info_screen.error_loading_data'.tr,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }
              if (controller.contentData == null) {
                return SizedBox(
                  height: 500.h,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'info_screen.no_data_available'.tr,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  heightBox20,
                  CustomAppBar(
                    name: widget.appBarTitle == 'Privacy & Policies'
                        ? 'info_screen.privacy_policies'.tr
                        : widget.appBarTitle == 'About Us'
                            ? 'info_screen.about_us'.tr
                            : widget.appBarTitle.tr,
                  ),
                  heightBox8,
                  Text(
                    widget.appBarTitle == 'Privacy & Policies'
                        ? 'info_screen.privacy_policies'.tr
                        : widget.appBarTitle == 'About Us'
                            ? 'info_screen.about_us'.tr
                            : widget.appBarTitle.tr,
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  heightBox4,
                  Html(
                    data: widget.param == 'aboutUs'
                        ? controller.contetData?.aboutUs ?? ""
                        : widget.param == 'privacyPolicy'
                            ? controller.contetData?.privacyPolicy ?? ""
                            : widget.param == 'termsAndConditions'
                                ? controller.contetData?.termsAndConditions ??
                                    ""
                                : widget.param == 'supports'
                                    ? controller.contetData?.supports ?? ""
                                    : widget.param == 'faq'
                                        ? controller.contetData?.faq ?? ""
                                        : "",
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
