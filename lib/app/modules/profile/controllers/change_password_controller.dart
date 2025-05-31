import 'package:expriy_deals_vendors/services/network_caller/network_caller.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_response.dart';
import 'package:expriy_deals_vendors/urls.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String? _accessToken;
  String? get accessToken => _accessToken;

  Future<bool> changePassword(String oldPassword, String newPassword,
      String confirmPassword, String token) async {
    bool isSuccess = false;

    _inProgress = true;

    update();

    Map<String, dynamic> requestBody = {
      "oldPassword": oldPassword,
      "confirmPassword": confirmPassword,
      "newPassword": newPassword,
    };

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .patchRequest(Urls.changePasswordtUrl,
            body: requestBody, accesToken: token);

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
