import 'package:expriy_deals_vendors/app/modules/authentication/controllers/create_user_controller.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/controllers/forgot_password_controller.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/controllers/otp_verify_controller.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/controllers/resend_otp_controller.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/controllers/reset_password_controller.dart';
import 'package:expriy_deals_vendors/app/modules/authentication/controllers/sign_in_controller.dart';
import 'package:expriy_deals_vendors/app/modules/bank/controllers/bank_details_controller.dart';
import 'package:expriy_deals_vendors/app/modules/bank/controllers/create_bank_info_controller.dart';
import 'package:expriy_deals_vendors/app/modules/bank/controllers/update_bank_info_controller.dart';
import 'package:expriy_deals_vendors/app/modules/order/controllers/order_details_controller.dart';
import 'package:expriy_deals_vendors/app/modules/order/controllers/update_status_controller.dart';
import 'package:expriy_deals_vendors/app/modules/product/controllers/all_category_controller.dart';
import 'package:expriy_deals_vendors/app/modules/product/controllers/all_product_conrtoller.dart';
import 'package:expriy_deals_vendors/app/modules/product/controllers/delete_product_controller.dart';
import 'package:expriy_deals_vendors/app/modules/product/controllers/update_product_controller.dart';
import 'package:expriy_deals_vendors/app/modules/profile/controllers/change_password_controller.dart';
import 'package:expriy_deals_vendors/app/modules/profile/controllers/content_controller.dart';
import 'package:expriy_deals_vendors/app/modules/profile/controllers/edit_profile_controller.dart';
import 'package:expriy_deals_vendors/app/modules/profile/controllers/profile_controller.dart';
import 'package:expriy_deals_vendors/app/modules/widthraw/controllers/my_widthdrae_controller.dart';
import 'package:expriy_deals_vendors/app/modules/widthraw/controllers/widthdraw_request_controller.dart';
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
    Get.put(UpdateStatusController());
    Get.put(CreateBankInfoController());
    Get.put(BankDetailsController());
    Get.put(UpdateBankInfoController());
    Get.put(ChangePasswordController());
    Get.put(MyWidthdrawController());
    Get.put(WidthdrawRequestController());
    Get.put(UpdateProductController());
    Get.put(DeleteProductController());
    Get.put(ContentController());
  
  }
}
