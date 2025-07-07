import 'package:expriy_deals_vendors/app/modules/product/controllers/all_category_controller.dart';
import 'package:expriy_deals_vendors/app/modules/product/controllers/all_product_conrtoller.dart';
import 'package:expriy_deals_vendors/app/modules/product/controllers/product_details_controller.dart';
import 'package:expriy_deals_vendors/app/modules/product/controllers/update_product_controller.dart';
import 'package:expriy_deals_vendors/app/utils/app_colors.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:expriy_deals_vendors/app/widgets/gradiant_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UpdateProductScreen extends StatefulWidget {
  final String? productId;
  const UpdateProductScreen({super.key, this.productId});

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController detailsCtrl = TextEditingController();
  final TextEditingController priceCtrl = TextEditingController();
  final TextEditingController quantityCtrl = TextEditingController();
  final TextEditingController expiryDateCtrl = TextEditingController();
  final TextEditingController daysCtrl = TextEditingController();
  final TextEditingController discountCtrl = TextEditingController();
  final AllCategoryController allCategoryController =
      Get.put(AllCategoryController());
  final ProductDetailsController productDetailScreen =
      Get.put(ProductDetailsController());
  final UpdateProductController updateProductController =
      Get.put(UpdateProductController());
  final AllProductController allProductController =
      Get.put(AllProductController());

  List<File> selectedImages = [];
  final ImagePicker _picker = ImagePicker();
  String? selectedCategoryId;
  bool isFormPrefilled = false;

  Future<void> _pickImage() async {
    final pickedFiles = await _picker.pickMultiImage();
    setState(() {
      selectedImages
          .addAll(pickedFiles.map((pickedFile) => File(pickedFile.path)));
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.productId != null) {
      productDetailScreen.productDetails(widget.productId!).then((success) {
        if (success && !isFormPrefilled) {
          final productData = productDetailScreen.productDetailsData;
          if (productData != null) {
            setState(() {
              nameCtrl.text = productData.name ?? '';
              detailsCtrl.text = productData.details ?? '';
              priceCtrl.text = productData.price.toString();
              quantityCtrl.text = productData.stock.toString();
              expiryDateCtrl.text = productData.expiredAt.toString();
              if (productData.expiredAt != null) {
                daysCtrl.text = productData.expiredAt!
                    .difference(DateTime.now())
                    .inDays
                    .toString();
              }
              discountCtrl.text = productData.discount.toString();
              selectedCategoryId = productData.category?.id;
              isFormPrefilled = true;
            });
          }
        }
      });
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      allCategoryController.getCategory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: Scaffold(
        body: GetBuilder<UpdateProductController>(
          builder: (controller) => Padding(
            padding: EdgeInsets.all(12.0.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  heightBox20,
                  CustomAppBar(name: 'update_product_screen.title'.tr),
                  heightBox16,
                  Text(
                    'update_product_screen.upload_images'.tr,
                    style: GoogleFonts.poppins(fontSize: 12.sp),
                  ),
                  heightBox12,
                  InkWell(
                    onTap: _pickImage,
                    child: Container(
                      height: 140,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Obx(() {
                        final hasImages =
                            productDetailScreen.displayImages.isNotEmpty ||
                                selectedImages.isNotEmpty;
                        return hasImages
                            ? SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    ...productDetailScreen.displayImages
                                        .asMap()
                                        .entries
                                        .map((entry) {
                                      return Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Stack(
                                          children: [
                                            Image.network(
                                              entry.value,
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  Icon(Icons.error,
                                                      color: Colors.red),
                                            ),
                                            Positioned(
                                              right: 0,
                                              child: GestureDetector(
                                                onTap: () {
                                                  productDetailScreen
                                                      .displayImages
                                                      .removeAt(entry.key);
                                                },
                                                child: Icon(Icons.remove_circle,
                                                    color: Colors.red),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                    ...selectedImages.asMap().entries.map(
                                          (entry) => Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Stack(
                                              children: [
                                                Image.file(
                                                  entry.value,
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                ),
                                                Positioned(
                                                  right: 0,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedImages
                                                            .removeAt(entry.key);
                                                      });
                                                    },
                                                    child: Icon(
                                                        Icons.remove_circle,
                                                        color: Colors.red),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                  ],
                                ),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add, size: 40),
                                  Text(
                                    'update_product_screen.add_product_images'
                                        .tr,
                                    style: GoogleFonts.poppins(fontSize: 20.sp),
                                  ),
                                ],
                              );
                      }),
                    ),
                  ),
                  heightBox12,
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'update_product_screen.item_name'.tr,
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff626262),
                          ),
                        ),
                        heightBox8,
                        TextFormField(
                          controller: nameCtrl,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) => value!.isEmpty
                              ? 'update_product_screen.enter_item_name'.tr
                              : null,
                          decoration: InputDecoration(
                            hintText: 'update_product_screen.item_name'.tr,
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                        heightBox8,
                        Text(
                          'update_product_screen.item_details'.tr,
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff626262),
                          ),
                        ),
                        heightBox8,
                        TextFormField(
                          controller: detailsCtrl,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) => value!.isEmpty
                              ? 'update_product_screen.enter_item_details'.tr
                              : null,
                          decoration: InputDecoration(
                            hintText: 'update_product_screen.item_details'.tr,
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                        heightBox8,
                        Text(
                          'update_product_screen.category'.tr,
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff626262),
                          ),
                        ),
                        heightBox8,
                        Obx(() => allCategoryController.inProgress
                            ? Center(child: CircularProgressIndicator())
                            : allCategoryController.errorMessage.isNotEmpty
                                ? Column(
                                    children: [
                                      Text(
                                        allCategoryController.errorMessage,
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      SizedBox(height: 8),
                                      ElevatedButton(
                                        onPressed: () =>
                                            allCategoryController.getCategory(),
                                        child: Text(
                                            'update_product_screen.retry'.tr),
                                      ),
                                    ],
                                  )
                                : allCategoryController.categoryData?.isEmpty ??
                                        true
                                    ? Text(
                                        'update_product_screen.no_categories_available'
                                            .tr,
                                        style:
                                            GoogleFonts.poppins(fontSize: 14.sp),
                                      )
                                    : DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                          hintText:
                                              'update_product_screen.select_category'
                                                  .tr,
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: OutlineInputBorder(),
                                        ),
                                        value: selectedCategoryId,
                                        items: allCategoryController
                                            .categoryData!
                                            .map((category) =>
                                                DropdownMenuItem<String>(
                                                  value: category.id,
                                                  child: Text(category.name ??
                                                      'Unnamed Category'),
                                                ))
                                            .toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedCategoryId = value;
                                          });
                                        },
                                        validator: (value) => value == null
                                            ? 'update_product_screen.select_category'
                                                .tr
                                            : null,
                                      )),
                        heightBox8,
                        Text(
                          'update_product_screen.item_price'.tr,
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff626262),
                          ),
                        ),
                        heightBox8,
                        TextFormField(
                          controller: priceCtrl,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.number,
                          validator: (value) => value!.isEmpty
                              ? 'update_product_screen.enter_price'.tr
                              : null,
                          decoration: InputDecoration(
                            hintText: 'update_product_screen.item_price'.tr,
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                        heightBox8,
                        Text(
                          'update_product_screen.item_quantity'.tr,
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff626262),
                          ),
                        ),
                        heightBox8,
                        TextFormField(
                          controller: quantityCtrl,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.number,
                          validator: (value) => value!.isEmpty
                              ? 'update_product_screen.enter_quantity'.tr
                              : null,
                          decoration: InputDecoration(
                            hintText: 'update_product_screen.item_quantity'.tr,
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                        heightBox8,
                        Text(
                          'update_product_screen.expiry_date'.tr,
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff626262),
                          ),
                        ),
                        heightBox8,
                        TextFormField(
                          controller: expiryDateCtrl,
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2100),
                            );
                            if (pickedDate != null) {
                              expiryDateCtrl.text =
                                  "${pickedDate.toLocal()}".split(' ')[0];
                            }
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) => value!.isEmpty
                              ? 'update_product_screen.enter_expiry_date'.tr
                              : null,
                          decoration: InputDecoration(
                            hintText: 'update_product_screen.expiry_date'.tr,
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                        heightBox12,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 170,
                              child: TextFormField(
                                controller: daysCtrl,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.number,
                                validator: (value) => value!.isEmpty
                                    ? 'update_product_screen.enter_days'.tr
                                    : null,
                                decoration: InputDecoration(
                                  hintText: 'update_product_screen.days'.tr,
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 170,
                              child: TextFormField(
                                controller: discountCtrl,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.number,
                                validator: (value) => value!.isEmpty
                                    ? 'update_product_screen.enter_discount'.tr
                                    : null,
                                decoration: InputDecoration(
                                  hintText: 'update_product_screen.discount'.tr,
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                        heightBox12,
                        controller.inProgress
                            ? Container(
                                decoration: BoxDecoration(
                                  color: AppColors.iconButtonThemeColor,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                ))
                            : CustomElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    if (selectedCategoryId == null) {
                                      Get.snackbar(
                                          'Error',
                                          'update_product_screen.error_select_category'
                                              .tr);
                                      return;
                                    }
                                    bool success =
                                        await controller.updateProduct(
                                      id: widget.productId!,
                                      name: nameCtrl.text,
                                      details: detailsCtrl.text,
                                      category: selectedCategoryId!,
                                      price: priceCtrl.text,
                                      quantity: quantityCtrl.text,
                                      expiryDate: expiryDateCtrl.text,
                                      days: daysCtrl.text,
                                      discount: discountCtrl.text,
                                      images: selectedImages,
                                    );
                                    if (success) {
                                      clearData();
                                      allProductController.getProduct();
                                      Get.back();
                                      Get.snackbar(
                                          'Success',
                                          'update_product_screen.success_message'
                                              .tr);
                                    } else {
                                      Get.snackbar(
                                          'Error',
                                          controller.errorMessage ??
                                              'update_product_screen.error_message'
                                                  .tr);
                                    }
                                  }
                                },
                                text: 'update_product_screen.update_product'.tr,
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void clearData() {
    nameCtrl.clear();
    detailsCtrl.clear();
    priceCtrl.clear();
    quantityCtrl.clear();
    expiryDateCtrl.clear();
    daysCtrl.clear();
    discountCtrl.clear();
    selectedImages.clear();
    productDetailScreen.displayImages.clear();
    isFormPrefilled = false;
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    detailsCtrl.dispose();
    priceCtrl.dispose();
    quantityCtrl.dispose();
    expiryDateCtrl.dispose();
    daysCtrl.dispose();
    discountCtrl.dispose();
    super.dispose();
  }
}