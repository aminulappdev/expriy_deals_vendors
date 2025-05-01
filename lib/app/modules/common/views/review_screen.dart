import 'package:expriy_deals_vendors/app/modules/onboarding/widgets/custom_scafold_background.dart';
import 'package:expriy_deals_vendors/app/utils/app_colors.dart';
import 'package:expriy_deals_vendors/app/utils/assets_path.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldBackground(
      child: Padding(
        padding: EdgeInsets.all(12.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            heightBox20,
            Image(
              image: AssetImage(AssetsPath.review),
            ),
            heightBox12,
            Text(
              'Your application is under review',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.iconButtonThemeColor),
            )
            ,
            heightBox10,
             Text(
              'We will notify you as soon as youraccount has been approved',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                  textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
