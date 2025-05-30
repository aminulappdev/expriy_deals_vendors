
import 'package:expriy_deals_vendors/app/modules/authentication/views/sign_in_screen.dart';
import 'package:expriy_deals_vendors/app/modules/product/model/category_model.dart';
import 'package:expriy_deals_vendors/get_storage.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_caller.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_response.dart';
import 'package:expriy_deals_vendors/urls.dart';
import 'package:get/get.dart';

class AllCategoryController extends GetxController { 
  final RxBool _inProgress = false.obs;
  bool get inProgress => _inProgress.value;

  RxString? _errorMessage = ''.obs;
  String? get errorMessage => _errorMessage?.value;

  
  final Rx<CategoryModel?> _categoryModel = Rx<CategoryModel?>(null);
  List<CategoryData>? get categoryData => _categoryModel.value!.data?.data ?? [];
  // AllCheckInModel? _allCheckInModel;
  // List<CheckInItemModel>? get checkInList => _allCheckInModel?.data;

  @override
  void onInit() {
    super.onInit();
    getCategory();
  }

  Future<bool> getCategory() async {
    final token = StorageUtil.getData(StorageUtil.userAccessToken);
    if (token == null) {
      Get.off(SignInScreen());
      return false;
    }

    _inProgress.value = true;

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
        Urls.categoryUrl,
        accesToken: StorageUtil.getData(StorageUtil.userAccessToken));

    if (response.isSuccess) {
      _errorMessage = null;

      _categoryModel.value = CategoryModel.fromJson(response.responseData);
      _inProgress.value = false;
      return true;
    } else {
      _errorMessage?.value = response.errorMessage;
      _inProgress.value = false;
      return false;
    }
  }
}
