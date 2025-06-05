// import 'package:antoinette/app/modules/payment/model/subscription_response_mode.dart';
// import 'package:antoinette/app/urls.dart';
// import 'package:antoinette/app/utils/get_storage.dart';
// import 'package:antoinette/services/network_caller/network_caller.dart';
// import 'package:antoinette/services/network_caller/network_response.dart';
// import 'package:get/get.dart';

// class SubscriptionController extends GetxController {
//   bool _inProgress = false;
//   bool get inProgress => _inProgress;

//   String? _errorMessage; 
//   String? get errorMessage => _errorMessage;

//   String? _accessToken;
//   String? get accessToken => _accessToken;

//   SubscriptionResponseModel? subscriptionResponseModel;
//   SubscriptionResponseItemModel? get subscriptionResponseData => subscriptionResponseModel!.data;

//   Future<bool> getSubcription(String user, String package) async {
//     bool isSuccess = false;

//     _inProgress = true;

//     update();

//     Map<String, dynamic> requestBody = {"user": user, "package": package};

//     final NetworkResponse response = await Get.find<NetworkCaller>()
//         .postRequest(Urls.subscriptionUrl, requestBody,
//             accesToken: box.read('user-login-access-token'));

//     if (response.isSuccess) {
  
//       subscriptionResponseModel = SubscriptionResponseModel.fromJson(response.responseData);
      
//       _errorMessage = null;
//       isSuccess = true;
//     } else {
//       _errorMessage = response.errorMessage;
//     }

//     _inProgress = false;
//     update();
//     return isSuccess;
//   }
// }
