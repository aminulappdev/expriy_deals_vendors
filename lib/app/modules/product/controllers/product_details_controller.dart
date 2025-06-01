import 'package:expriy_deals_vendors/app/modules/authentication/views/sign_in_screen.dart';
import 'package:expriy_deals_vendors/app/modules/product/model/product_details_model.dart';
import 'package:expriy_deals_vendors/get_storage.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_caller.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_response.dart';
import 'package:expriy_deals_vendors/urls.dart';
import 'package:get/get.dart';


class ProductDetailsController extends GetxController {
  final RxBool _inProgress = false.obs;
  bool get inProgress => _inProgress.value;

  RxString? _errorMessage = ''.obs;
  String? get errorMessage => _errorMessage?.value;

  final Rx<ProductDetailsModel?> _productModel = Rx<ProductDetailsModel?>(null);
  ProductDetailsData? get productDetailsData => _productModel.value?.data;

  // Reactive list for image URLs
  final RxList<String> displayImages = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> productDetails(String productId) async {
    final token = StorageUtil.getData(StorageUtil.userAccessToken);
    if (token == null) {
      Get.to(SignInScreen());
      return false;
    }

    _inProgress.value = true;

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
        Urls.productDetailsById(productId),
        accesToken: StorageUtil.getData(StorageUtil.userAccessToken));

    if (response.isSuccess) {
      _errorMessage = null;
      _productModel.value = ProductDetailsModel.fromJson(response.responseData);
      
      // Populate displayImages with URLs from productDetailsData
      if (_productModel.value?.data?.images != null) {
        displayImages.value = _productModel.value!.data!.images
            .map((image) => image.url ?? '')
            .where((url) => url.isNotEmpty)
            .toList();
      }
      
      _inProgress.value = false;
      return true;
    } else {
      _errorMessage?.value = response.errorMessage;
      _inProgress.value = false;
      return false;
    }
  }
}