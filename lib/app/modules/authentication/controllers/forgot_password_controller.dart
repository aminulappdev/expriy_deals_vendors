
import 'package:expriy_deals_vendors/app/utils/get_storage.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_caller.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_response.dart';
import 'package:expriy_deals_vendors/urls.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String? _accessToken;
  String? get accessToken => _accessToken;

  Future<bool> forgotPassword(String email) async {
    bool isSuccess = false;

    _inProgress = true;

    update();

    Map<String, dynamic> requestBody = {"email": email};

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .patchRequest(Urls.forgotPasswordUrl, body:  requestBody);

    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;

      _accessToken = response.responseData['data']['token'];

      Map<String, dynamic> userInfo = {'email': email, 'token': _accessToken};

      box.write('fotgot-password-info', userInfo);
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
