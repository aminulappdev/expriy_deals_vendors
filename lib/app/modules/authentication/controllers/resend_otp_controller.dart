
import 'package:expriy_deals_vendors/services/network_caller/network_caller.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_response.dart';
import 'package:expriy_deals_vendors/urls.dart';
import 'package:get/get.dart';

class ResendOTPController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String? _otpToken;
  String? get otpToken => _otpToken;

  Future<bool> resendOTP(String email) async {
    bool isSuccess = false;

    _inProgress = true;

    update();

    Map<String, dynamic> requestBody = {"email": email};

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(Urls.resendOTPUrl, requestBody);

    if (response.isSuccess) {
      _otpToken = response.responseData['data']['token'];

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
