import 'package:email_validator/email_validator.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/views/forgot_password_screen.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/widgets/continue_elevated_button.dart';
import 'package:expriy_deals_vendors/app/modules/common/views/main_bottom_nav_bar.dart';
import 'package:expriy_deals_vendors/app/modules/product/controllers/add_product_controller.dart';
import 'package:expriy_deals_vendors/app/utils/responsive_size.dart';
import 'package:expriy_deals_vendors/app/widgets/costom_app_bar.dart';
import 'package:expriy_deals_vendors/app/widgets/gradiant_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});
  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AddProductController _controller = Get.put(AddProductController());
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController detailsCtrl = TextEditingController();
  TextEditingController categoryCtrl = TextEditingController();
  TextEditingController priceCtrl = TextEditingController();
  TextEditingController quantityCtrl = TextEditingController();
  TextEditingController expiryDateCtrl = TextEditingController();
  TextEditingController daysCtrl = TextEditingController();
  TextEditingController discountCtrl = TextEditingController();

  List<File> selectedImages = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFiles = await _picker.pickMultiImage();
    if (pickedFiles != null) {
      setState(() {
        selectedImages.addAll(pickedFiles.map((pickedFile) => File(pickedFile.path)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AddProductController>(
        builder: (controller) => Padding(
          padding: EdgeInsets.all(12.0.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heightBox20,
                CustomAppBar(name: 'Add product'),
                heightBox16,
                Text('Upload images'),
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
                    child: selectedImages.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add, size: 40),
                              Text('Add product images', style: TextStyle(fontSize: 20)),
                            ],
                          )
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: selectedImages
                                  .asMap()
                                  .entries
                                  .map((entry) => Padding(
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
                                                    selectedImages.removeAt(entry.key);
                                                  });
                                                },
                                                child: Icon(Icons.remove_circle, color: Colors.red),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                  ),
                ),
                heightBox12,
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Item Name',
                          style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff626262))),
                      heightBox8,
                      TextFormField(
                        controller: nameCtrl,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value!.isEmpty ? 'Enter item name' : null,
                        decoration: InputDecoration(
                          hintText: 'Item Name',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                      heightBox8,
                      Text('Item Details',
                          style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff626262))),
                      heightBox8,
                      TextFormField(
                        controller: detailsCtrl,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value!.isEmpty ? 'Enter item details' : null,
                        decoration: InputDecoration(
                          hintText: 'Item Details',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                      heightBox8,
                      Text('Category',
                          style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff626262))),
                      heightBox8,
                      TextFormField(
                        controller: categoryCtrl,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value!.isEmpty ? 'Enter category' : null,
                        decoration: InputDecoration(
                          hintText: 'Category',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                      heightBox8,
                      Text('Item Price',
                          style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff626262))),
                      heightBox8,
                      TextFormField(
                        controller: priceCtrl,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.number,
                        validator: (value) => value!.isEmpty ? 'Enter price' : null,
                        decoration: InputDecoration(
                          hintText: 'Item Price',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                      heightBox8,
                      Text('Item Quantity',
                          style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff626262))),
                      heightBox8,
                      TextFormField(
                        controller: quantityCtrl,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.number,
                        validator: (value) => value!.isEmpty ? 'Enter quantity' : null,
                        decoration: InputDecoration(
                          hintText: 'Item Quantity',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                      heightBox8,
                      Text('Expiry Date',
                          style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff626262))),
                      heightBox8,
                      TextFormField(
                        controller: expiryDateCtrl,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value!.isEmpty ? 'Enter expiry date' : null,
                        decoration: InputDecoration(
                          hintText: 'Expiry Date',
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
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.number,
                              validator: (value) => value!.isEmpty ? 'Enter days' : null,
                              decoration: InputDecoration(
                              hintText: 'Days',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 170,
                          child: TextFormField(
                            controller: discountCtrl,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.number,
                            validator: (value) => value!.isEmpty ? 'Enter discount' : null,
                            decoration: InputDecoration(
                              hintText: 'Discount %',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                    heightBox12,
                    controller.inProgress
                        ? Center(child: CircularProgressIndicator())
                        : CustomElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                bool success = await controller.addProduct(
                                  name: nameCtrl.text,
                                  details: detailsCtrl.text,
                                  category: categoryCtrl.text,
                                  price: priceCtrl.text,
                                  quantity: quantityCtrl.text,
                                  expiryDate: expiryDateCtrl.text,
                                  days: daysCtrl.text,
                                  discount: discountCtrl.text,
                                  images: selectedImages,
                                );
                                if (success) {
                                  Get.to(() => MainButtonNavbarScreen());
                                  Get.snackbar('Success', 'Product added successfully');
                                } else {
                                  Get.snackbar('Error', controller.errorMessage ?? 'Failed to add product');
                                }
                              }
                            },
                            text: 'Save',
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
  // Future<void> onTapGoogleSignIn() async {
  //   final controller = Get.find<GoogleAuthController>();
  //   final bool isSuccess = await controller.signInWithGoogle();

  //   if (isSuccess) {
  //     if (context.mounted) {
  //       showSnackBarMessage(context, 'Google দিয়ে লগইন সফল হয়েছে');
  //     }
  //   } else {
  //     String message = controller.errorMessage ?? 'Google লগইন ব্যর্থ হয়েছে';

  //     if (message.contains('credentials')) {
  //       if (context.mounted) {
  //         showDialog(
  //           context: context,
  //           builder: (_) => AlertDialog(
  //             title: Text("অ্যাকাউন্ট সমস্যা"),
  //             content: Text("এই ইমেইলটি আগে থেকেই রেজিস্টার করা আছে ইমেইল-পাসওয়ার্ড দিয়ে। দয়া করে অন্য Google অ্যাকাউন্ট সিলেক্ট করুন।"),
  //             actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text("ঠিক আছে"))],
  //           ),
  //         );
  //       }
  //     } else {
  //       if (context.mounted) {
  //         showSnackBarMessage(context, message, true);
  //       }
  //     }
  //   }
  // }

  // Future<void> onTapToNextButton() async {
  //   if (_formKey.currentState!.validate()) {
  //     final bool isSuccess = await signInController.signIn(emailCtrl.text, passwordCtrl.text, isChecked);

  //     if (isSuccess) {
  //       if (mounted) {
  //         showSnackBarMessage(context, 'Login successfully done');
  //         Navigator.pushNamedAndRemoveUntil(context, MainButtonNavbarScreen.routeName, (route) => false);
  //       }
  //     } else {
  //       if (mounted) {
  //         showSnackBarMessage(context, signInController.errorMessage ?? 'Login failed', true);
  //       }
  //     }
  //   }
  // }

  // Future<void> forgotPasswordBTN() async {
  //   final bool isSuccess = await forgotPasswordController.forgotPassword(emailCtrl.text);
  //   if (isSuccess && mounted) {
  //     Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
  //   } else if (mounted) {
  //     showSnackBarMessage(context, forgotPasswordController.errorMessage ?? 'Error occurred', true);
  //   }
  // }

  // void clearTextField() {
  //   emailCtrl.clear();
  //   passwordCtrl.clear();
  // }

  // @override
  // void dispose() {
  //   emailCtrl.dispose();
  //   passwordCtrl.dispose();
  //   super.dispose();
  // }

