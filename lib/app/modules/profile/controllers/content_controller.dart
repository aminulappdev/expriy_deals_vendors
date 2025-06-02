import 'package:expriy_deals_vendors/app/modules/profile/model/content_model.dart';
import 'package:expriy_deals_vendors/get_storage.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_caller.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_response.dart';
import 'package:expriy_deals_vendors/urls.dart';
import 'package:get/get.dart';

class ContentController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;


  ContensModel? _contentModel;
  ContensModel? get contentModel => _contentModel;

  Future<bool> contentData(String param) async {
    bool isSuccess = false;

    _inProgress = true;

    update();

    Map<String, dynamic> queryParam = {
      "name": param,
    };

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
        Urls.contentUrl,
        accesToken: StorageUtil.getData(StorageUtil.userAccessToken),
        queryParams: queryParam);

    if (response.isSuccess) {
      _contentModel = ContensModel.fromJson(response.responseData);
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
