
import 'package:expriy_deals_vendors/app/modules/profile/controllers/content_controller.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key, required this.appBarTitle, required this.data, required this.params});
  final String appBarTitle;
  final String data;
  final String params;

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final ContentController contentController = Get.find<ContentController>();

  @override
  void initState() {
    
    contentController.contentData(widget.params);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.r), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               heightBox20,
              CustomAppBar(name: widget.appBarTitle),
              heightBox8,
              Text(
                widget.appBarTitle,
                style: GoogleFonts.poppins(fontSize: 16.sp,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
              heightBox4,          
              GetBuilder<ContentController>(
                builder: (context) {
                  if (contentController.inProgress) {
                    return Center(child: CircularProgressIndicator());
                  } else if (contentController.errorMessage != null) {
                    return Center(
                      child: Text(
                        contentController.errorMessage!,
                        style: GoogleFonts.poppins(fontSize: 14.sp, color: Colors.red),
                      ),
                    );
                  } else if (contentController.contentModel == null) {
                    return Center(
                      child: Text(
                        'No data available',
                        style: GoogleFonts.poppins(fontSize: 14.sp),
                      ),
                    );
                  } else {
                    return Html(
                      data: contentController.contentModel!.data ?? '',
                      style: {
                        "body": Style(
                          fontSize: FontSize(14.sp),
                          color: Colors.black,
                        ),
                      },
                    );
                  }
                }
              )
            ],
          ),
        ),
      ),
    );
  }


}
