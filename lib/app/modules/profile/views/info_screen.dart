
import 'package:expriy_deals_vendors/app/modules/profile/controllers/content_controller.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoScreen extends StatefulWidget {
  InfoScreen({super.key, required this.appBarTitle, required this.param});
  final String appBarTitle;
  final String param;

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final ContentController contentController = Get.put(ContentController());

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
          child: GetBuilder<ContentController>(builder: (controller) {
            print('all data ${controller.contetData}');
            if (controller.inProgress) {
              return SizedBox(
                height: 500,
                width: 300,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (controller.errorMessage != null) {
              return SizedBox(
                height: 500,
                width: 300,
                child: Center(
                  child: Text(
                    controller.errorMessage ?? "Error loading data",
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
            if (controller.contetData == null) {
              return SizedBox(
                height: 500,
                width: 300,
                child: Center(
                  child: Text(
                    "No data available",
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
                CustomAppBar(name: widget.appBarTitle),
                heightBox8,
                Text(
                  widget.appBarTitle,
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
                              ? controller.contetData?.termsAndConditions ?? ""
                              : widget.param == 'supports'
                                  ? controller.contetData?.supports ?? ""
                                  : widget.param == 'faq'
                                      ? controller.contetData?.faq ?? ""
                                      : "",
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
