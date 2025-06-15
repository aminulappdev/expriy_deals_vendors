
import 'package:expriy_deals_vendors/app/modules/authentication/views/sign_in_screen.dart';
import 'package:expriy_deals_vendors/app/modules/profile/model/my_shop_model.dart';
import 'package:expriy_deals_vendors/get_storage.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_caller.dart';
import 'package:expriy_deals_vendors/urls.dart';
import 'package:get/get.dart';

class ShopController extends GetxController {
  

  final RxBool _inProgress = false.obs;
  final RxString _errorMessage = ''.obs;
  final Rx<MyShopModel?> _shopModel = Rx<MyShopModel?>(null);

  bool get inProgress => _inProgress.value;
  String? get errorMessage => _errorMessage.value;
  MyShopData? get shopData => _shopModel.value?.data;

  @override
  void onInit() {
    super.onInit();
    getShopData();
  }
 
  Future<bool> getShopData() async {
    final token = StorageUtil.getData(StorageUtil.userAccessToken);
    if (token == null) {
      Get.off(SignInScreen());
      return false;
    }
    _inProgress.value = true;
    final response = await Get.find<NetworkCaller>().getRequest(
      Urls.getShopUrl,
      accesToken: token,
    );
    if (response.isSuccess) {
      _errorMessage.value = '';
      _shopModel.value = MyShopModel.fromJson(response.responseData);
      print('Fetched Shop Data: ${response.responseData}');
      _inProgress.value = false;
      return true;
    } else {
      _errorMessage.value = response.errorMessage;
      _inProgress.value = false;
      return false;
    }
  }



}