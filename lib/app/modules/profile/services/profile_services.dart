
import 'package:expriy_deals_vendors/get_storage.dart';


class ProfileService {
  // Future<bool> deleteAccount() async {
  //   final token = StorageUtil.getData(StorageUtil.userAccessToken);
  //   if (token == null) {
  //     Get.offNamed('/sign-in-screen');
  //     return false;
  //   }

  //   final response = await Get.find<NetworkCaller>().deleteRequest(
  //     Urls.deleteAccountUrl,
  //     accesToken: token,
  //   );

  //   if (response.isSuccess) {
  //     StorageUtil.deleteData(StorageUtil.userAccessToken);
  //     return true;
  //   }
  //   return false;
  // }

  Future<bool> logout() async {
    try {
     // await GoogleSignIn().signOut();
      StorageUtil.deleteData(StorageUtil.userAccessToken);
      return true;
    } catch (e) {
      return false;
    }
  }
}