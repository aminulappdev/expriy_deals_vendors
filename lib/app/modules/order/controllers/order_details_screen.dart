import 'package:expriy_deals_vendors/app/modules/authentication/views/sign_in_screen.dart';
import 'package:expriy_deals_vendors/app/modules/order/model/order_details_model.dart';
import 'package:expriy_deals_vendors/get_storage.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_caller.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_response.dart';
import 'package:expriy_deals_vendors/urls.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  final RxBool _inProgress = false.obs;
  bool get inProgress => _inProgress.value;

  final RxString _errorMessage = ''.obs;
  String? get errorMessage =>
      _errorMessage.value.isEmpty ? null : _errorMessage.value;

  final Rx<OrderDetailsModel?> orderDetailsModel = Rx<OrderDetailsModel?>(null);
  List<OrderDetailsItemModel>? get addToCartData =>
      orderDetailsModel.value?.data?.data ?? [];

  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> getCart() async {
    final token = StorageUtil.getData(StorageUtil.userAccessToken);
    if (token == null) {
      print('No token found, redirecting to SignInScreen');
      Get.to(SignInScreen());
      return false;
    }

    print('Using token: $token');
    _inProgress.value = true;

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      Urls.orderDetailstUrl,
       accesToken: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2ODIxOWEwNzMwYmY5YmI3YTIzZThmZjgiLCJyb2xlIjoidXNlciIsImlhdCI6MTc0ODQwODQ1MSwiZXhwIjoxNzUxMDAwNDUxfQ.oJ4hmvhAIyPNmKkzxvhLIEBOkefDpefVjYj3VfY-Ukc// Use the stored token consistently'
    );

    print('API Response: ${response.responseData}');
    print('Is Success: ${response.isSuccess}, Error: ${response.errorMessage}');

    if (response.isSuccess) {
      _errorMessage.value = '';
      orderDetailsModel.value = OrderDetailsModel.fromJson(response.responseData);
      print('Fetched Orders: ${orderDetailsModel.value?.data?.data?.length}');
      _inProgress.value = false;
      return true;
    } else {
      _errorMessage.value = response.errorMessage ?? 'Unknown error occurred';
      print('Error Message Set: ${_errorMessage.value}');
      _inProgress.value = false;
      return false;
    }
  }
}