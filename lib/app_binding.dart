import 'package:expriy_deals_vendors/app/modules/authentication/controllers/create_user_controller.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/controllers/forgot_password_controller.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/controllers/otp_verify_controller.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/controllers/resend_otp_controller.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/controllers/reset_password_controller.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/controllers/sign_in_controller.dart';
import 'package:expriy_deals_vendors/app/modules/order/controllers/order_details_controller.dart';
import 'package:expriy_deals_vendors/app/modules/product/controllers/all_category_controller.dart';
import 'package:expriy_deals_vendors/app/modules/product/controllers/all_product_conrtoller.dart';
import 'package:expriy_deals_vendors/app/modules/profile/controllers/edit_profile_controller.dart';
import 'package:expriy_deals_vendors/app/modules/profile/controllers/profile_controller.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override

  void dependencies() { 
    Get.put(NetworkCaller());
    Get.put(CreateUserController());
    Get.put(OtpVerifyController());
    Get.put(SignInController());
    Get.put(ForgotPasswordController());
    Get.put(ResendOTPController());
    Get.put(ResetPasswordController());
    Get.put(OrderDetailsController());
    Get.put(ProfileController());
    Get.put(EditProfileController());
    Get.put(AllCategoryController());
    Get.put(AllProductController());
  
  }
}
