
import 'package:expriy_deals_vendors/app/modules/authentication/views/sign_in_screen.dart';
import 'package:expriy_deals_vendors/app/modules/profile/model/profile_model.dart';
import 'package:expriy_deals_vendors/app/modules/profile/services/profile_services.dart';
import 'package:expriy_deals_vendors/get_storage.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_caller.dart';
import 'package:expriy_deals_vendors/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final ProfileService _profileService = ProfileService();

  final RxBool _inProgress = false.obs;
  final RxString _errorMessage = ''.obs;
  final Rx<ProfileModel?> _profileModel = Rx<ProfileModel?>(null);

  bool get inProgress => _inProgress.value;
  String? get errorMessage => _errorMessage.value;
  ProfileData? get profileData => _profileModel.value?.data;

  @override
  void onInit() {
    super.onInit();
    getProfileData();
  }
 
  Future<bool> getProfileData() async {
    final token = StorageUtil.getData(StorageUtil.userAccessToken);
    if (token == null) {
      Get.off(SignInScreen());
      return false;
    }
    _inProgress.value = true;
    final response = await Get.find<NetworkCaller>().getRequest(
      Urls.getProfileUrl,
      accesToken: token,
    );
    if (response.isSuccess) {
      _errorMessage.value = '';
      _profileModel.value = ProfileModel.fromJson(response.responseData);
      _inProgress.value = false;
      return true;
    } else {
      _errorMessage.value = response.errorMessage;
      _inProgress.value = false;
      return false;
    }
  }

  // Future<void> deleteAccount() async {
  //   _inProgress.value = true;
  //   final isSuccess = await _profileService.deleteAccount();
  //   _inProgress.value = false;
  //   if (isSuccess) {
  //     Get.snackbar('Success', 'Account deleted successfully', snackPosition: SnackPosition.BOTTOM);
  //     Get.offAllNamed('/sign-in-screen');
  //   } else {
  //     _errorMessage.value = 'Failed to delete account';
  //     Get.snackbar('Error', 'Failed to delete account',
  //         snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.redAccent, colorText: Colors.white);
  //   }
  // }

  Future<void> logout() async {
    _inProgress.value = true;
    final isSuccess = await _profileService.logout();
    _inProgress.value = false;
    if (isSuccess) {
      Get.snackbar('Success', 'Logged out successfully', snackPosition: SnackPosition.BOTTOM);
      Get.off(SignInScreen());
    } else {
      _errorMessage.value = 'Failed to log out';
      Get.snackbar('Error', 'Failed to log out',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.redAccent, colorText: Colors.white);
    }
  }
}