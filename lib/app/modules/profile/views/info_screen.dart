
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoScreen extends StatelessWidget {
  static const String routeName = '/info-screen';
  const InfoScreen({super.key, required this.appBarTitle, required this.data});
  final String appBarTitle;
  final String data;
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
              CustomAppBar(name: appBarTitle),
              heightBox8,
              Text(
                appBarTitle,
                style: GoogleFonts.poppins(fontSize: 16.sp,fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
              heightBox4,          
              Html(data: data)
            ],
          ),
        ),
      ),
    );
  }
}
