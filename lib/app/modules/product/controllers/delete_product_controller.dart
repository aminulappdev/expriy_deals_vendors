// ignore_for_file: avoid_print

import 'package:expriy_deals_vendors/app/modules/authentication/views/sign_in_screen.dart';
import 'package:expriy_deals_vendors/get_storage.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_caller.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_response.dart';
import 'package:expriy_deals_vendors/urls.dart';
import 'package:get/get.dart';

class DeleteProductController extends GetxController {
  final RxBool _inProgress = false.obs;
  bool get inProgress => _inProgress.value;

  final RxString _errorMessage = ''.obs;
  String get errorMessage => _errorMessage.value;

  

  Future<bool> deleteProduct(String productId) async {
    final token = StorageUtil.getData(StorageUtil.userAccessToken);
    print('Token: $token');
    if (token == null) {
      Get.snackbar('Error', 'No access token found. Please sign in.');
      Get.off(() => SignInScreen());
      return false;
    }

    _inProgress.value = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().deleteRequest(
        Urls.updateProductById(productId), accesToken: token);
    print('Response: ${response.responseData}');
    print('Error: ${response.errorMessage}');

    if (response.isSuccess) {
      _errorMessage.value = '';
      _inProgress.value = false;
      update();
      return true;
    } else {
      _errorMessage.value = response.errorMessage;
      _inProgress.value = false;
      update();
      return false;
    }
  }
}