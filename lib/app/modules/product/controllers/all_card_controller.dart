
import 'package:expriy_deals_vendors/app/modules/authentication/views/sign_in_screen.dart';
import 'package:expriy_deals_vendors/app/modules/product/model/all_addToCard_model.dart';
import 'package:expriy_deals_vendors/get_storage.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_caller.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_response.dart';
import 'package:expriy_deals_vendors/urls.dart';
import 'package:get/get.dart';

class AllCartController extends GetxController {
  final RxBool _inProgress = false.obs;
  bool get inProgress => _inProgress.value; 

  RxString? _errorMessage = ''.obs;
  String? get errorMessage => _errorMessage?.value;

  final Rx<AllAddToCartModel?> _addToCartModel = Rx<AllAddToCartModel?>(null);
  List<AllAddToCardItemModel>? get addToCartData =>
      _addToCartModel.value!.data?.data ?? [];

  @override
  void onInit() {
    super.onInit();
    // getCategory(Get.arguments);
  }

  Future<bool> getCart({String? categoryId, String? authorID}) async {
    final token = StorageUtil.getData(StorageUtil.userAccessToken);
    if (token == null) {
      Get.to(SignInScreen());
      return false;
    }

    _inProgress.value = true;

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
        Urls.addToCartUrl,
        accesToken: StorageUtil.getData(StorageUtil.userAccessToken));

    if (response.isSuccess) {
      _errorMessage = null;

      _addToCartModel.value = AllAddToCartModel.fromJson(response.responseData);
      _inProgress.value = false;
      return true;
    } else {
      _errorMessage?.value = response.errorMessage;
      _inProgress.value = false;
      return false;
    }
  }
}
