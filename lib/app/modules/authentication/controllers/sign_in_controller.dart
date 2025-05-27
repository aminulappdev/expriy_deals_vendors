
import 'package:expriy_deals_vendors/get_storage.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_caller.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_response.dart';
import 'package:expriy_deals_vendors/urls.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> signIn(String email, String password) async {
    bool isSuccess = false;

    _inProgress = true;
    update();

    Map<String, dynamic> requestBody = {
      "email": email,
      "password": password
    }; // Replace your body data
    print('Controller e asche');
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(Urls.signInUrl, requestBody); // Replace your api url

    if (response.isSuccess) {
      // Save access token using await and ensure data is saved before moving forward
      await StorageUtil.saveData(
          StorageUtil.userAccessToken, response.responseData['data']['accessToken']);
      print('Access token : ${response.responseData['data']['accessToken']}');
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
