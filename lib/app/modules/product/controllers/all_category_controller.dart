// ignore_for_file: avoid_print

import 'package:expriy_deals_vendors/app/modules/authentication/views/sign_in_screen.dart';
import 'package:expriy_deals_vendors/app/modules/product/model/category_model.dart';
import 'package:expriy_deals_vendors/get_storage.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_caller.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_response.dart';
import 'package:expriy_deals_vendors/urls.dart';
import 'package:get/get.dart';

class AllCategoryController extends GetxController {
  final RxBool _inProgress = false.obs;
  bool get inProgress => _inProgress.value;

  final RxString _errorMessage = ''.obs;
  String get errorMessage => _errorMessage.value;

  final Rx<CategoryModel?> _categoryModel = Rx<CategoryModel?>(null);
  List<CategoryData>? get categoryData => _categoryModel.value?.data?.data.isNotEmpty == true
      ? _categoryModel.value!.data!.data
      : [];

  Future<bool> getCategory() async {
    final token = StorageUtil.getData(StorageUtil.userAccessToken);
    print('Token: $token');
    if (token == null) {
      Get.snackbar('Error', 'No access token found. Please sign in.');
      Get.off(() => SignInScreen());
      return false;
    }

    _inProgress.value = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
        Urls.categoryUrl, accesToken: token);
    print('Response: ${response.responseData}');
    print('Error: ${response.errorMessage}');

    if (response.isSuccess) {
      _errorMessage.value = '';
      _categoryModel.value = CategoryModel.fromJson(response.responseData);
      _inProgress.value = false;
      update();
      return true;
    } else {
      _errorMessage.value = response.errorMessage;
      _inProgress.value = false;
      update();
      Get.snackbar('Error', _errorMessage.value);
      return false;
    }
  }
}