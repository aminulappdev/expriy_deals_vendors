// ignore_for_file: avoid_print
import 'package:expriy_deals_vendors/app/modules/authentication/views/sign_in_screen.dart';

import 'package:expriy_deals_vendors/app/modules/earnings/model/earning_dashboardModel.dart';
import 'package:expriy_deals_vendors/get_storage.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_caller.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_response.dart';
import 'package:expriy_deals_vendors/urls.dart';
import 'package:get/get.dart';

class EarningDashboardController extends GetxController {
  final RxBool _inProgress = false.obs;
  bool get inProgress => _inProgress.value;

  final RxString _errorMessage = ''.obs;
  String get errorMessage => _errorMessage.value;

  final Rx<EarningDashboardModel?> earningDashboardModel =
      Rx<EarningDashboardModel?>(null);
  EarningDashboardData? get earningDashboardData =>
      earningDashboardModel.value?.data;


  Future<bool> getEarningDashboard() async {
    final token = StorageUtil.getData(StorageUtil.userAccessToken);
    print('Token: $token');
    if (token == null) {
      Get.snackbar('Error', 'No access token found. Please sign in.');
      Get.off(() => SignInScreen());
      return false;
    }

    _inProgress.value = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(Urls.vendorEarningDashboardUrl, accesToken: token);

    if (response.isSuccess) {
      _errorMessage.value = '';
      earningDashboardModel.value =
          EarningDashboardModel.fromJson(response.responseData);
         print('Earning Dashboard Data: ${earningDashboardModel.value?.data}');

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
