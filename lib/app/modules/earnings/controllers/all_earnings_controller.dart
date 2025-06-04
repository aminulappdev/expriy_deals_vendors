// ignore_for_file: avoid_print
import 'package:expriy_deals_vendors/app/modules/authentication/views/sign_in_screen.dart';
import 'package:expriy_deals_vendors/app/modules/earnings/model/all_earnings_model.dart';
import 'package:expriy_deals_vendors/get_storage.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_caller.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_response.dart';
import 'package:expriy_deals_vendors/urls.dart';
import 'package:get/get.dart';

class AllEarningsController extends GetxController {
  final RxBool _inProgress = false.obs;
  bool get inProgress => _inProgress.value;

  final RxString _errorMessage = ''.obs;
  String get errorMessage => _errorMessage.value;


  final Rx<AllEarningsModel?> _allEarningsModel = Rx<AllEarningsModel?>(null);
  List<AllEarningsItemModel>? get allEarningsData =>
      _allEarningsModel.value!.data?.allData.isNotEmpty == true
          ? _allEarningsModel.value!.data!.allData
          : [];

  Future<bool> getEarnings() async {
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
        .getRequest(Urls.vendorEarningsUrl, accesToken: token);

    if (response.isSuccess) {
      _errorMessage.value = '';
      _allEarningsModel.value =
          AllEarningsModel.fromJson(response.responseData);
      print('respose model : ${response.responseData}');
      print('Total Earnings: ${_allEarningsModel.value?.data?.totalEarnings}');
      print('Today Earnings: ${_allEarningsModel.value?.data?.todayEarnings}');
      print('Earnings fetched successfully: ${_allEarningsModel.value?.data?.allData.length}');

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
