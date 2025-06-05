
// import 'package:expriy_deals_vendors/app/modules/payment/model/package_model.dart';
// import 'package:expriy_deals_vendors/services/network_caller/network_caller.dart';
// import 'package:expriy_deals_vendors/services/network_caller/network_response.dart';
// import 'package:get/get.dart';

// class AllPackageController extends GetxController {
//   bool _inProgress = false;
//   bool get inProgress => _inProgress;

//   String? _errorMessage;
//   String? get errorMessage => _errorMessage;

//   PackageModel? packageModel;
//   List<PackageItemModel>? get packageItemList => packageModel?.data;

//   int? lastPage;

//   Future<bool> getAllPackage() async {
   
//     bool isSuccess = false; 

//     _inProgress = true;

//     update();

//     final NetworkResponse response = await Get.find<NetworkCaller>()
//         .getRequest(Urls.allPackageUrl, accesToken: box.read('user-login-access-token'));
   
//     packageModel = PackageModel.fromJson(response.responseData);
    
//     if (response.isSuccess) {
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
