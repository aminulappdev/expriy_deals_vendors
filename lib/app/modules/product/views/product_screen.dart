import 'package:expriy_deals_vendors/app/modules/product/controllers/all_category_controller.dart';
import 'package:expriy_deals_vendors/app/modules/product/controllers/all_product_conrtoller.dart';
import 'package:expriy_deals_vendors/app/modules/product/views/add_product_screen.dart';
import 'package:expriy_deals_vendors/app/modules/product/views/update_product_screen.dart';
import 'package:expriy_deals_vendors/app/modules/product/widgets/product_card.dart';
import 'package:expriy_deals_vendors/app/utils/app_colors.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:async';

class ProductScreen extends StatefulWidget {
  final bool shouldBackButton;
  static const String routeName = '/product-screen';

  const ProductScreen({
    super.key,
    required this.shouldBackButton,
  });

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final AllProductController allProductController =
      Get.find<AllProductController>();
  final AllCategoryController allCategoryController =
      Get.find<AllCategoryController>();
  String? _selectedCategoryId; // Track selected category ID
  String searchQuery = '';
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      allCategoryController.getCategory();
      allProductController.getProduct(
          categoryId: null); // Fetch all products initially
    });
    searchController.addListener(() {
      _onSearchChanged(searchController.text);
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    scrollController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  // Debounce search input to improve performance
  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      setState(() {
        searchQuery = value.trim();
      });
    });
  }

  // Filter products based on search query
  List<dynamic> _getFilteredProducts(List<dynamic> products) {
    if (searchQuery.isEmpty) {
      return products;
    }
    return products.where((product) {
      final title = product.name?.toLowerCase() ?? '';
      return title.contains(searchQuery.toLowerCase());
    }).toList();
  }

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
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            heightBox8,
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffFAFAFA),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Colors.grey[300]!,
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Icon(
                            Icons.search_rounded,
                            size: 30.h,
                            color: AppColors.iconButtonThemeColor,
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: searchController,
                            decoration: const InputDecoration(
                              hintText: 'Search products',
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                        if (searchController.text.isNotEmpty)
                          GestureDetector(
                            onTap: () {
                              searchController.clear();
                              _onSearchChanged('');
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Icon(
                                Icons.clear,
                                size: 20.h,
                                color: AppColors.iconButtonThemeColor,
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
            Center(
              child: InkWell(
                onTap: () {
                  Get.to(const AddProductScreen());
                },
                child: Container(
                  height: 32,
                  width: 123,
                  decoration: BoxDecoration(
                    color: AppColors.iconButtonThemeColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 13,
                        child: const Icon(Icons.add),
                      ),
                      widthBox4,
                      const Text(
                        'Add product',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            heightBox12,
            SizedBox(
              height: 60.h,
              child: Obx(() {
                if (allCategoryController.inProgress == true) {
                  return const Center(child: CircularProgressIndicator());
                } else if (allCategoryController.categoryData == null ||
                    allCategoryController.categoryData!.isEmpty) {
                  return const Center(child: Text('No categories found'));
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: allCategoryController.categoryData!.length,
                    itemBuilder: (context, index) {
                      final category =
                          allCategoryController.categoryData![index];
                      final isSelected = _selectedCategoryId == category.id;
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedCategoryId = category.id;
                            });
                            allProductController.getProduct(
                                categoryId: category.id);
                          },
                          child: Container(
                            height: 55.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                  color: AppColors.iconButtonThemeColor),
                              color: isSelected
                                  ? AppColors.iconButtonThemeColor
                                  : Colors.transparent,
                              boxShadow: [
                                if (isSelected)
                                  BoxShadow(
                                    color: Colors.blue.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: const Offset(0, 3),
                                  ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4.h, horizontal: 8.w),
                              child: Center(
                                child: Text(
                                  category.name ?? 'Category',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: isSelected
                                        ? Colors.white
                                        : const Color.fromARGB(255, 10, 10, 10),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
            ),
            heightBox12,
            Expanded(
              child: Obx(() {
                if (allProductController.inProgress == true) {
                  return const Center(child: CircularProgressIndicator());
                } else if (allProductController.productData == null ||
                    allProductController.productData!.isEmpty) {
                  return const Center(child: Text('No products found'));
                }
                final filteredProducts =
                    _getFilteredProducts(allProductController.productData!);
                if (filteredProducts.isEmpty && searchQuery.isNotEmpty) {
                  return const Center(
                      child: Text('No matching products found'));
                }
                return GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: filteredProducts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.02,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: ProductCard(
                        editOntap: () {
                          Get.to(UpdateProductScreen(
                                  productId: product.id ?? ''))
                              ?.then((value) {
                            if (value == true) {
                              allProductController.getProduct(
                                  categoryId: _selectedCategoryId);
                            }
                          });
                        },
                        isShowDiscount: false,
                        image: product.images.isNotEmpty
                            ? product.images[0].url ?? ''
                            : '',
                        title: product.name ?? 'Product',
                        price: product.price?.toString() ?? '0',
                        productId: product.id ?? '',
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  
}
