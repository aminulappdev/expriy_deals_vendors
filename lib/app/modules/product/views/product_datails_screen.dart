import 'package:expriy_deals_vendors/app/modules/product/controllers/all_product_conrtoller.dart';
import 'package:expriy_deals_vendors/app/modules/product/controllers/product_details_controller.dart';
import 'package:expriy_deals_vendors/app/modules/product/widgets/product_caresoul_slider.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productId;
  const ProductDetailScreen({super.key, required this.productId});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ProductDetailsController productDetailsController =
      Get.put(ProductDetailsController());
  final AllProductController allProductController =
      Get.put(AllProductController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      productDetailsController.productDetails(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0.h),
          child: SingleChildScrollView(
            child: Obx(() {
              if (productDetailsController.inProgress == true) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final data = productDetailsController.productDetailsData;
                final double updatePrice = double.parse(data!.price.toString());
                final double discountValue = updatePrice *
                    ((100 - int.parse(data.discount!.toString())) / 100);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(name: 'product_detail_screen.title'.tr),
                    heightBox12,
                    HomeCarouselSlider(
                      images:
                          productDetailsController.productDetailsData?.images ??
                              [],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data.name ?? 'No Name',
                          style: GoogleFonts.poppins(
                            fontSize: 24.sp,
                          ),
                        ),
                        Text(
                          '\$${discountValue.toStringAsFixed(2)}',
                          style: GoogleFonts.poppins(
                              fontSize: 16.h, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    heightBox8,
                    Text(
                      'product_detail_screen.product_details'.tr,
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    heightBox4,
                    Html(data: data.details ?? ''),
                  ],
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}