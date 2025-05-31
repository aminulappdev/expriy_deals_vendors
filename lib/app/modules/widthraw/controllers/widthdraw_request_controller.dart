import 'package:expriy_deals_vendors/get_storage.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_caller.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_response.dart';
import 'package:expriy_deals_vendors/urls.dart';
import 'package:get/get.dart';

class WidthdrawRequestController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> widthdrawRequest(
    int amount,
  ) async {
    bool isSuccess = false;

    _inProgress = true;
    update();

    Map<String, dynamic> requestBody = {"amount": amount};
    print('Controller e asche');
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(Urls.withdrawRequestUrl, requestBody,
            accesToken: StorageUtil.getData(
                StorageUtil.userAccessToken)); // Replace your api url

    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
