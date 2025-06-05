

// import 'package:get/get.dart';

// class MySubscriptionController extends GetxController {
//   bool _inProgress = false;
//   bool get inProgress => _inProgress;

//   String? _errorMessage;
//   String? get errorMessage => _errorMessage;

//   MySubscriptionModel? mySubscriptionModel;
//   List<MySubscriptionItemModel>? get subscriptionData =>
//       mySubscriptionModel?.data;

//   Future<bool> getMySubscriptions() async {
//     _inProgress = true;
//     update();

//     bool isSuccess = false;

//     final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
//       Urls.mySubscriptionUrl,
//       accesToken: box.read('user-login-access-token'),
//     );

//     if (response.isSuccess) {
//       mySubscriptionModel = MySubscriptionModel.fromJson(response.responseData);
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
