
import 'package:expriy_deals_vendors/app/utils/app_colors.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatefulWidget {
  final String productId;
  final String? image;
  final String? discount;
  final String? title;
  final String? price;

  final bool isShowDiscount;
  const ProductCard({
    super.key,
    this.isShowDiscount = false,
    this.image,
    this.title,
    this.price,
    required this.productId,
    this.discount,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  void initState() {
    // print('Product card theke: ${widget.productId}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double updatePrice = double.parse(widget.price ?? '0');
    final double discountValue =
        updatePrice * ((100 - double.parse(widget.discount ?? '0')) / 100);
    return GestureDetector(
      onTap: () {
        print('Product card theke: ${widget.productId}');
        // Get.to(ProductDetailScreen(
        //   productId: widget.productId,
        // ));
      },
      child: Card(
        elevation: 1,
        child: Container(
          height: 185.h,
          width: 156.w,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.image ??
                              'https://fastly.picsum.photos/id/471/200/300.jpg?hmac=N_ZXTRU2OGQ7b_1b8Pz2X8e6Qyd84Q7xAqJ90bju2WU'),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(8)),
                  child: widget.isShowDiscount
                      ? Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 25,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.iconButtonThemeColor),
                              child: Center(
                                  child: Text(
                                widget.discount == null || widget.discount == ''
                                    ? '0%'
                                    : '-${widget.discount}%',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              )),
                            ),
                          ),
                        )
                      : Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: GestureDetector(
                              child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color:
                                              AppColors.iconButtonThemeColor)),
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
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 80.w,
                        child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          widget.title ?? 'name',
                          style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      heightBox5,
                      Row(
                        children: [
                          Text(
                            discountValue.toStringAsFixed(2),
                            style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                color: AppColors.iconButtonThemeColor,
                                fontWeight: FontWeight.w600),
                          ),
                          widthBox10,
                          Text(
                            widget.price ?? '00',
                            style: GoogleFonts.poppins(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 12.sp,
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
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
