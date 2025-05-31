// ignore_for_file: avoid_print

import 'package:expriy_deals_vendors/app/modules/authentication/views/sign_in_screen.dart';
import 'package:expriy_deals_vendors/app/modules/widthraw/model/my_widthdraw_model.dart';
import 'package:expriy_deals_vendors/get_storage.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_caller.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_response.dart';
import 'package:expriy_deals_vendors/urls.dart';
import 'package:get/get.dart';

class MyWidthdrawController extends GetxController {
  final RxBool _inProgress = false.obs;
  bool get inProgress => _inProgress.value;

  final RxString _errorMessage = ''.obs;
  String get errorMessage => _errorMessage.value;

  final Rx<MyWidthdrawModel?> _myWidthdrawModel = Rx<MyWidthdrawModel?>(null);
  List<MyWidthdrawItemModel>? get myWidthdrawData =>
      _myWidthdrawModel.value?.data?.data.isNotEmpty == true
          ? _myWidthdrawModel.value!.data!.data
          : [];

  Future<bool> getWidthdraw() async {
    final token = StorageUtil.getData(StorageUtil.userAccessToken);
    print('Token: $token');
    if (token == null) {
      Get.off(() => SignInScreen());
      return false;
    }

    _inProgress.value = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(Urls.withdrawUrl, accesToken: token);

    if (response.isSuccess) {
      _errorMessage.value = '';
      _myWidthdrawModel.value =
          MyWidthdrawModel.fromJson(response.responseData);
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
