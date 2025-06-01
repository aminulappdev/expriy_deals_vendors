// ignore_for_file: avoid_print

import 'package:expriy_deals_vendors/app/modules/product/controllers/all_product_conrtoller.dart';
import 'package:expriy_deals_vendors/app/modules/product/controllers/product_details_controller.dart';
import 'package:expriy_deals_vendors/app/modules/product/widgets/product_caresoul_slider.dart';
import 'package:expriy_deals_vendors/app/modules/product/widgets/see_more_button.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:flutter/material.dart';
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

  bool _isExpandedProduct = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print('Product ID details page theke: ${widget.productId}');
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
                    CustomAppBar(name: 'Product Details'),
                    heightBox12,
                    HomeCarouselSlider(),
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
                      'Product Details',
                      style: GoogleFonts.poppins(
                          fontSize: 16.sp, fontWeight: FontWeight.w400),
                    ),
                    heightBox4,
                    AnimatedCrossFade(
                      firstChild: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Product Name: ${data.name ?? 'UltraShield SPF 50+ Sunscreen'}'),
                          Text('Brand: '),
                          Text('Type: Broad-Spectrum Protection'),
                          Text('SPF: 50+'),
                          Text('Formulation: Lotion'),
                          Text('Volume: 150 ml'),
                          Text('Price: \$${discountValue.toStringAsFixed(2)}'),
                          Text(
                              'Key Ingredients: Avobenzone, Octinoxate, Titanium Dioxide'),
                          Text('Water Resistance: Up to 80 minutes'),
                          Text(
                              'Application: Apply generously on all exposed skin areas 15 minutes before sun exposure. Reapply every 2 hours or after swimming or sweating.'),
                          Text(
                              'Benefits: Helps prevent sunburn, premature skin aging, and skin cancer. Suitable for all skin types, including sensitive skin.'),
                        ],
                      ),
                      secondChild: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Product Name: ${data.name ?? 'UltraShield SPF 50+ Sunscreen'}'),
                          Text('Brand:'),
                          Text('Type: Broad-Spectrum Protection'),
                          Text('SPF: 50+'),
                          Text('Formulation: Lotion'),
                          Text('Volume: 150 ml'),
                        ],
                      ),
                      crossFadeState: _isExpandedProduct
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: const Duration(milliseconds: 300),
                    ),
                    SizedBox(height: 8.h),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isExpandedProduct = !_isExpandedProduct;
                        });
                      },
                      child: SeeMoreButton(
                        isExpanded: _isExpandedProduct,
                      ),
                    ),
                    heightBox4,
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
