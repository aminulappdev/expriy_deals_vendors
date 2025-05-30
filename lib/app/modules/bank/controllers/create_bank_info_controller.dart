// ignore_for_file: avoid_print
import 'package:expriy_deals_vendors/get_storage.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_caller.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_response.dart';
import 'package:expriy_deals_vendors/urls.dart';
import 'package:get/get.dart';

class CreateBankInfoController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> createCardInfo(
    String accountNumber,
    String routingNumber,
    String bankName,
    String bankHolderName,
    String bankAddress,
  ) async {
    bool isSuccess = false;

    _inProgress = true;
    update();

    Map<String, dynamic> requestBody = {
      "accountNumber": accountNumber,
      "routingNumber": routingNumber,
      "bankName": bankName,
      "bankHolderName": bankHolderName,
      "bankAddress": bankAddress
    }; // Replace your body data

    print('Controller e asche');
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(Urls.createCardInfotUrl, requestBody,
            accesToken: StorageUtil.getData(StorageUtil.userAccessToken));

    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
