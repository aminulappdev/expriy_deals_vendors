import 'package:expriy_deals_vendors/app/modules/authentication/views/sign_in_screen.dart';
import 'package:expriy_deals_vendors/app/modules/bank/model/card_details_model.dart';
import 'package:expriy_deals_vendors/get_storage.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_caller.dart';
import 'package:expriy_deals_vendors/urls.dart';
import 'package:get/get.dart';

class BankDetailsController extends GetxController {
  final RxBool _inProgress = false.obs;
  final RxString _errorMessage = ''.obs;

  bool get inProgress => _inProgress.value;
  String? get errorMessage => _errorMessage.value;

  final Rx<BankDetailsModel?> bankDetailsModel = Rx<BankDetailsModel?>(null);
  BankDetailsData? get bankDetailsData => bankDetailsModel.value?.data;

  @override
  void onInit() {
    super.onInit();
    getBankData();
  }

  Future<bool> getBankData() async {
    final token = StorageUtil.getData(StorageUtil.userAccessToken);
    if (token == null) {
      Get.off(SignInScreen());
      return false;
    }
    _inProgress.value = true;
    final response = await Get.find<NetworkCaller>().getRequest(
      Urls.bankDetailstUrl,
      accesToken: StorageUtil.getData(StorageUtil.userAccessToken),
    );
    if (response.isSuccess) {
      _errorMessage.value = '';
      bankDetailsModel.value = BankDetailsModel.fromJson(response.responseData);
      _inProgress.value = false;
      return true;
    } else {
      _errorMessage.value = response.errorMessage;
      _inProgress.value = false;
      return false;
    }
  }
}
