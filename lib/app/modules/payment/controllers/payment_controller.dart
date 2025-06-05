
import 'package:expriy_deals_vendors/app/modules/payment/model/payment_model.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_caller.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_response.dart';
import 'package:expriy_deals_vendors/urls.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String? _accessToken;
  String? get accessToken => _accessToken;

  PaymentModel? paymentModel; 
  PaymentModel? get paymentData => paymentModel; 


  Future<bool> getPayment(String modelType, String userId, String refereneId) async {
    bool isSuccess = false;

    _inProgress = true;

    update();

    Map<String, dynamic> requestBody = {
    "modelType": modelType, // here modelType: Booking | Subscription | Order
    "account": userId,
    "reference": refereneId
};

    final NetworkResponse response =
        await Get.find<NetworkCaller>().postRequest('Urls.paymentCheckoutUrl', requestBody);

    if (response.isSuccess) {

      paymentModel = PaymentModel.fromJson(response.responseData);
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
