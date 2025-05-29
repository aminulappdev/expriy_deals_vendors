// // ignore_for_file: avoid_print

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ProductDetailScreen extends StatefulWidget {
//   final String productId;
//   const ProductDetailScreen({super.key, required this.productId});

//   @override
//   _ProductDetailScreenState createState() => _ProductDetailScreenState();
// }

// class _ProductDetailScreenState extends State<ProductDetailScreen> {
//   final ProductDetailsController productDetailsController =
//       Get.put(ProductDetailsController());
//   final AddToCartController addToCartController =
//       Get.put(AddToCartController());
//   final AllProductController allProductController =
//       Get.put(AllProductController());

//   bool _isExpandedProduct = false;
//   bool _isExpandedPolicy = false;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       print('Product ID details page theke: ${widget.productId}');
//       productDetailsController.productDetails(widget.productId);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: EdgeInsets.all(16.0.h),
//           child: SingleChildScrollView(
//             child: Obx(() {
//               if (productDetailsController.inProgress == true) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               } else {
//                 final data = productDetailsController.productDetailsData;
//                 final double updatePrice = double.parse(data!.price.toString());
//                 final double discountValue = updatePrice *
//                     ((100 - int.parse(data.discount!.toString())) / 100);
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CustomAppBar(name: 'Product Details'),
//                     heightBox12,
//                     HomeCarouselSlider(),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           data?.name ?? 'No Name',
//                           style: GoogleFonts.poppins(
//                             fontSize: 24.sp,
//                           ),
//                         ),
//                         Text(
//                           '\$${discountValue.toStringAsFixed(2)}',
//                           style: GoogleFonts.poppins(
//                               fontSize: 16.h, fontWeight: FontWeight.w500),
//                         ),
//                       ],
//                     ),
//                     heightBox8,
//                     Text(
//                       'Product Details',
//                       style: GoogleFonts.poppins(
//                           fontSize: 16.sp, fontWeight: FontWeight.w400),
//                     ),
//                     heightBox4,
//                     AnimatedCrossFade(
//                       firstChild: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                               'Product Name: ${data?.name ?? 'UltraShield SPF 50+ Sunscreen'}'),
//                           Text('Brand: '),
//                           Text('Type: Broad-Spectrum Protection'),
//                           Text('SPF: 50+'),
//                           Text('Formulation: Lotion'),
//                           Text('Volume: 150 ml'),
//                           Text('Price: \$${discountValue.toStringAsFixed(2)}'),
//                           Text(
//                               'Key Ingredients: Avobenzone, Octinoxate, Titanium Dioxide'),
//                           Text('Water Resistance: Up to 80 minutes'),
//                           Text(
//                               'Application: Apply generously on all exposed skin areas 15 minutes before sun exposure. Reapply every 2 hours or after swimming or sweating.'),
//                           Text(
//                               'Benefits: Helps prevent sunburn, premature skin aging, and skin cancer. Suitable for all skin types, including sensitive skin.'),
//                         ],
//                       ),
//                       secondChild: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                               'Product Name: ${data?.name ?? 'UltraShield SPF 50+ Sunscreen'}'),
//                           Text('Brand:'),
//                           Text('Type: Broad-Spectrum Protection'),
//                           Text('SPF: 50+'),
//                           Text('Formulation: Lotion'),
//                           Text('Volume: 150 ml'),
//                         ],
//                       ),
//                       crossFadeState: _isExpandedProduct
//                           ? CrossFadeState.showFirst
//                           : CrossFadeState.showSecond,
//                       duration: const Duration(milliseconds: 300),
//                     ),
//                     SizedBox(height: 8.h),
//                     GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           _isExpandedProduct = !_isExpandedProduct;
//                         });
//                       },
//                       child: SeeMoreButton(
//                         isExpanded: _isExpandedProduct,
//                       ),
//                     ),
//                     heightBox4,
//                     AnimatedCrossFade(
//                       firstChild: Container(
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(12)),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             PolicyCustomRow(
//                                 name: 'Warranty Policy', routeName: ''),
//                             PolicyCustomRow(
//                                 name: 'Return & Refund Policy', routeName: ''),
//                             PolicyCustomRow(
//                                 name: 'Replacement Policy', routeName: ''),
//                             PolicyCustomRow(
//                                 name: 'Return & Refund Policy', routeName: ''),
//                             PolicyCustomRow(
//                                 name: 'Replacement Policy', routeName: ''),
//                           ],
//                         ),
//                       ),
//                       secondChild: Container(
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(12)),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             PolicyCustomRow(
//                                 name: 'Warranty Policy', routeName: ''),
//                             PolicyCustomRow(
//                                 name: 'Return & Refund Policy', routeName: ''),
//                             PolicyCustomRow(
//                                 name: 'Replacement Policy', routeName: ''),
//                           ],
//                         ),
//                       ),
//                       crossFadeState: _isExpandedPolicy
//                           ? CrossFadeState.showFirst
//                           : CrossFadeState.showSecond,
//                       duration: const Duration(milliseconds: 300),
//                     ),
//                     SizedBox(height: 8.h),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             data?.author?.shop?.logo != null
//                                 ? CircleAvatar(
//                                     radius: 18.r,
//                                     backgroundImage:
//                                         NetworkImage(data!.author!.shop!.logo!),
//                                   )
//                                 : CircleAvatar(
//                                     backgroundColor: AppColors.themeColor,
//                                     radius: 18.r,
//                                     child: Text(
//                                       data?.author?.shop?.name?.isNotEmpty ==
//                                               true
//                                           ? data!.author!.shop!.name!
//                                               .substring(0, 1)
//                                           : '',
//                                       style: GoogleFonts.poppins(
//                                           color: Colors.white, fontSize: 18.sp),
//                                     ),
//                                   ),
//                             widthBox4,
//                             Text(
//                               data?.author?.shop?.name ?? 'Unknown Shop',
//                               style: GoogleFonts.poppins(
//                                   fontSize: 18.sp, fontWeight: FontWeight.w500),
//                             ),
//                           ],
//                         ),
//                         heightBox8,
//                         InkWell(
//                           onTap: () {
//                             if (data != null &&
//                                 data.author != null &&
//                                 data.author!.shop != null) {
//                               Get.to(SellerProfileScreen(
//                                 sellerData: {
//                                   'sellerId': data.author!.id ?? '',
//                                   'shopName':
//                                       data.author!.shop!.name ?? 'Unknown Shop',
//                                   'shopLogo': data.author!.shop!.logo,
//                                   'shopId': data.author!.shop!.id ?? '',
//                                   'sellerName':
//                                       data.author!.name ?? 'Unknown Seller',
//                                   'location': data.author!.shop?.address ??
//                                       'Unknown Location',
//                                   'phone': data.author!.phoneNumber ?? 'N/A',
//                                   'description':
//                                       data.author!.shop!.description ??
//                                           'No Description',
//                                 },
//                               ));
//                             } else {
//                               print('Data not found or incomplete');
//                               showSnackBarMessage(
//                                   context, 'Seller data not available', false);
//                             }
//                           },
//                           child: Container(
//                             height: 32.h,
//                             width: 130,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(30),
//                               color: const Color(0xff308960),
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 const Icon(Icons.shopping_bag_outlined,
//                                     color: Colors.white),
//                                 Text(
//                                   'Visit Store',
//                                   style:
//                                       GoogleFonts.poppins(color: Colors.white),
//                                 ),
//                                 const Icon(Icons.arrow_forward_ios,
//                                     color: Colors.white),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             _isExpandedPolicy = !_isExpandedPolicy;
//                           });
//                         },
//                         child: SeeMoreButton(isExpanded: _isExpandedPolicy),
//                       ),
//                     ),
//                     Text(
//                       'You might also like',
//                       style: GoogleFonts.poppins(
//                           fontSize: 15.sp, fontWeight: FontWeight.w500),
//                     ),
//                     heightBox8,
//                     Obx(() {
//                       if (allProductController.inProgress == true) {
//                         return const CircularProgressIndicator();
//                       } else {
//                         return SizedBox(
//                           height: 180.h,
//                           width: MediaQuery.of(context).size.width,
//                           child: ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             itemCount:
//                                 allProductController.productData?.length ?? 0,
//                             itemBuilder: (context, index) {
//                               final product =
//                                   allProductController.productData?[index];
//                               if (product?.category?.name ==
//                                   productDetailsController
//                                       .productDetailsData?.category?.name) {
//                                 return Padding(
//                                   padding:
//                                       EdgeInsets.symmetric(horizontal: 4.w),
//                                   child: ProductCard(
//                                     image: product?.images[0].url,
//                                     price: product?.price.toString() ?? '',
//                                     title: product?.name,
//                                     isShowDiscount: true,
//                                     productId: product?.id ?? '',
//                                   ),
//                                 );
//                               }
//                               return const SizedBox.shrink();
//                             },
//                           ),
//                         );
//                       }
//                     }),
//                     heightBox12,
//                     Container(
//                       height: 70.h,
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 12),
//                             child: SizedBox(
//                               width: 159.w,
//                               height: 40.h,
//                               child: GestureDetector(
//                                 onTap: () {
//                                   if (data != null && data.id != null) {
//                                     addToCArtFunction(
//                                         data.id!, data.stock.toString());
//                                   } else {
//                                     print('productDetailsData is null');
//                                     showSnackBarMessage(context,
//                                         'Product data not available', false);
//                                   }
//                                 },
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                         color: AppColors.iconButtonThemeColor),
//                                     borderRadius: BorderRadius.circular(30),
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       'Add to cart',
//                                       style: GoogleFonts.poppins(
//                                           color:
//                                               AppColors.iconButtonThemeColor),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 12),
//                             child: SizedBox(
//                               width: 159.w,
//                               height: 42.h,
//                               child: CustomElevatedButton(
//                                 onPressed: () {
//                                   if (data != null) {
//                                     Get.to(CheckOutScreen(
//                                         productDetailsData: data));
//                                   } else {
//                                     print('productDetailsData is null');
//                                     showSnackBarMessage(context,
//                                         'Product data not available', false);
//                                   }
//                                 },
//                                 text: 'Buy now',
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 );
//               }
//             }),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> addToCArtFunction(String productId, String quantity) async {
//     final bool isSuccess =
//         await addToCartController.addToCart(productId, quantity);
//     if (isSuccess) {
//       if (mounted) {
//         showSnackBarMessage(context, 'Successfully added to cart', true);
//       }
//     } else {
//       if (mounted) {
//         showSnackBarMessage(context,
//             addToCartController.errorMessage ?? 'Failed to add to cart', false);
//       }
//     }
//   }
// }
