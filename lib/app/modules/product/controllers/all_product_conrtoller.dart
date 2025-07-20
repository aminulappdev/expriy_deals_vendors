
import 'package:expriy_deals_vendors/app/modules/authentication/views/sign_in_screen.dart';
import 'package:expriy_deals_vendors/app/modules/product/model/product_model.dart';
import 'package:expriy_deals_vendors/get_storage.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_caller.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_response.dart';
import 'package:expriy_deals_vendors/urls.dart';
import 'package:get/get.dart';

class AllProductController extends GetxController {
  final RxBool _inProgress = false.obs;
  bool get inProgress => _inProgress.value;

  RxString? _errorMessage = ''.obs;
  String? get errorMessage => _errorMessage?.value;

  final Rx<ProductModel?> _productModel = Rx<ProductModel?>(null);
  List<ProductItemModel>? get productData =>
      _productModel.value?.data?.data ?? [];

  @override
  void onInit() {
    super.onInit();
    // getCategory(Get.arguments);
  }

  Future<bool> getProduct({String? categoryId, String? authorID}) async {
    final token = StorageUtil.getData(StorageUtil.userAccessToken);
    if (token == null) {
      Get.to(SignInScreen());
      return false;
    }

    _inProgress.value = true;

   Map<String, dynamic> queryparamByCategory = {
      'category': categoryId,
      'limit': 99999
    };
    Map<String, dynamic> queryparamByAuthor = {
      'author': authorID,
      'limit': 99999
    };
   

    Map<String, dynamic> queryparam = {'limit': 99999};

    final NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(Urls.productUrl,
            queryParams: categoryId != null
                ? queryparamByCategory
                : authorID != null
                    ? queryparamByAuthor
                    : queryparam,
            accesToken: StorageUtil.getData(StorageUtil.userAccessToken));

    if (response.isSuccess) {
      _errorMessage = null;

      _productModel.value = ProductModel.fromJson(response.responseData);
      _inProgress.value = false;
      return true;
    } else {
      _errorMessage?.value = response.errorMessage;
      _inProgress.value = false;
      return false;
    }
  }
}
