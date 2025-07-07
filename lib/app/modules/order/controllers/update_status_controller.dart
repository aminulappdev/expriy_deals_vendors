 import 'package:expriy_deals_vendors/get_storage.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_caller.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_response.dart';
import 'package:expriy_deals_vendors/urls.dart';
import 'package:get/get.dart';

class UpdateStatusController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> updateStatus(String status, String id) async {
    bool isSuccess = false;

    _inProgress = true;
    update();

    Map<String, dynamic> requestBody = {
      "status": status // ['pending', 'ongoing', 'cancelled', 'delivered']
    };

    print('Controller e asche');
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .patchRequest(Urls.updateOrderStatusById(id), body:  requestBody, accesToken: StorageUtil.getData(StorageUtil.userAccessToken));

    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
