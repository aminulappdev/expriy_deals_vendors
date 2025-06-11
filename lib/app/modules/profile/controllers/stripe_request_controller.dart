// ignore_for_file: avoid_print

import 'package:expriy_deals_vendors/get_storage.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_caller.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_response.dart';
import 'package:expriy_deals_vendors/urls.dart';
import 'package:get/get.dart';

class StripeRequestController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String? _accessToken;
  String? get accessToken => _accessToken;

  Future<String?> stripeRequest() async {
    _inProgress = true;

    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .patchRequest(Urls.stripeRequestUrl,
            accesToken: StorageUtil.getData(StorageUtil.userAccessToken));

    if (response.isSuccess) {
      _errorMessage = null;
      print(response.responseData['data']);
      return response.responseData['data'];
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();

    return null;
  }
}
