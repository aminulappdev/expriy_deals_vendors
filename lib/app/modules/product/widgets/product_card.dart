import 'package:expriy_deals_vendors/app/utils/app_colors.dart';
import 'package:expriy_deals_vendors/app/utils/assets_path.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 1,
        child: Container(
          height: 180.h,
          width: 156.w,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 105.h,
                width: 156.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AssetsPath.headphone),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(8)),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: AppColors.iconButtonThemeColor)),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.edit,
                                color: AppColors.iconButtonThemeColor,
                                size: 20,
                              ),
                            )),
                      ),
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        'Hocco headphone',
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    heightBox5,
                    Text(
                      '\$50.0',
                      style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          color: AppColors.iconButtonThemeColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> getProductScreen() async {
  //   print('Hello');
  //   print(widget.productsModel.name);
  //   print(widget.productsModel.id);
  //   final bool isSuccess = await procuctDetailsController
  //       .getProductDetails(widget.productsModel.id!);

  //   if (isSuccess) {
  //     if (mounted) {
  //       Navigator.pushNamed(context, ProductDetailScreen.routeName,
  //           arguments: procuctDetailsController.productModel);

  //       // print('My token ---------------------------------------');
  //       // print(signUpController.token);
  //     } else {
  //       if (mounted) {
  //         showSnackBarMessage(
  //             context, procuctDetailsController.errorMessage!, true);
  //       }
  //     }
  //   }
  // }
}
