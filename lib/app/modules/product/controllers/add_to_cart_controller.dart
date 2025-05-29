
import 'package:expriy_deals_vendors/get_storage.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_caller.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_response.dart';
import 'package:expriy_deals_vendors/urls.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> addToCart(String productId, String quantity) async {
    bool isSuccess = false;

    _inProgress = true;
    update();

    Map<String, dynamic> requestBody = {
      "product": productId,
      "quantity": quantity
    };
    print('Controller e asche');
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(Urls.addToCartUrl, requestBody,accesToken: StorageUtil.getData(StorageUtil.userAccessToken)); // Replace your api url

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
