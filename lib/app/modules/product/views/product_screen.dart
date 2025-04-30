import 'package:expriy_deals_vendors/app/modules/product/views/add_product_screen.dart';
import 'package:expriy_deals_vendors/app/modules/product/widgets/product_card.dart';
import 'package:expriy_deals_vendors/app/utils/app_colors.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductScreen extends StatefulWidget {
  final bool shouldBackButton;
  static const String routeName = '/product-screen';
  const ProductScreen({super.key, required this.shouldBackButton});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  // @override
  // void initState() {
  //   super.initState();
  //   scrollController.addListener(_loadMoreData);
  // }

  // void _loadMoreData() {
  //   if (scrollController.position.extentAfter < 500 &&
  //       !allProcuctController.inProgress) {
  //     allProcuctController.fetchAllProducts(null); // Trigger fetch more data
  //   }
  // }

  // void _onSearch() {
  //   String query = searchController.text;
  //   allProcuctController.onSearchQueryChangedProducts(query); // Trigger search
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightBox20,
            Text(
              'Products',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            heightBox8,
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: Color(0xffFAFAFA),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Colors.grey[300]!,
                      ),
                    ),
                    child: Row(
                      children: [
                        widthBox8,
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 34.h,
                            width: 34.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.iconButtonThemeColor,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.search_rounded,
                                size: 24.h,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        widthBox8,
                        Expanded(
                          child: TextFormField(
                            controller: searchController,
                            onChanged: (_) {},
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            heightBox12,
            SizedBox(
              height: 56,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Container(
                      width: 90,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.iconButtonThemeColor),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(
                          child: Text(
                            'Smart phone accesories',
                            style: TextStyle(fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            heightBox12,
            Center(
              child: InkWell(
                onTap: () {
                  Get.to(AddProductScreen());
                },
                child: Container(
                  height: 32,
                  width: 123,
                  decoration: BoxDecoration(
                      color: AppColors.iconButtonThemeColor,
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 13,
                        child: Icon(Icons.add),
                      ),
                      widthBox4,
                      Text(
                        'Add product',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            heightBox12,
            Expanded(
              child: SizedBox(
                  child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 10,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 16,
                          childAspectRatio: 1.02,
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: ProductCard(),
                        );
                      },
                    ),
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
