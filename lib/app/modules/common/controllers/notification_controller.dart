import 'package:expriy_deals_vendors/app/modules/common/model/notification_model.dart';
import 'package:expriy_deals_vendors/get_storage.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_caller.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_response.dart';
import 'package:expriy_deals_vendors/urls.dart';
import 'package:get/get.dart';

class AllNotificationController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String? _accessToken;
  String? get accessToken => _accessToken;

  AllNotificationModel? notificationList;
  List<AllNotificationItemModel>? get allNotificationData =>
      notificationList?.data;

  Future<bool> getNotificationList() async {
    bool isSuccess = false;

    _inProgress = true;

    update();

    // Map<String, dynamic> queryparam = {'limit': _limit, 'page': page};

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
        Urls.notificationUrl,
        accesToken: StorageUtil.getData(StorageUtil.userAccessToken));

    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;

      notificationList = AllNotificationModel.fromJson(response.responseData);
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
