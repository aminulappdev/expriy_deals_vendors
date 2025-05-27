
import 'package:expriy_deals_vendors/app/modules/common/views/main_bottom_nav_bar.dart';
import 'package:expriy_deals_vendors/get_storage.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_caller.dart';
import 'package:expriy_deals_vendors/services/network_caller/network_response.dart';
import 'package:expriy_deals_vendors/urls.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GoogleAuthController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String? _token;
  String? get token => _token;

  Future<bool> signInWithGoogle() async {
    _inProgress = true;
    update();

    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        _errorMessage = "Google sign-in was cancelled";
        _inProgress = false;
        update();
        return false;
      }

      // Get token & idToken from Google
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create Firebase credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Get full Firebase ID token
      String? idToken = await userCredential.user!.getIdToken();

      // Prepare request body with the full ID token
      final Map<String, dynamic> requestBody = {
        "token": idToken,
      };

      final NetworkResponse response = await Get.find<NetworkCaller>()
          .postRequest(Urls.googleAuthUrl, requestBody);

      if (response.isSuccess) {
        print(response.responseData['data']['accessToken']);
        StorageUtil.saveData(
            StorageUtil.userAccessToken, response.responseData['data']['accessToken']);
        print('User access token from Google user:');
        print(StorageUtil.getData(StorageUtil.userAccessToken));
        _errorMessage = null;

        // Navigate to main page
        Future.delayed(Duration.zero, () {
          Get.offAll(MainButtonNavbarScreen());
        });

        _inProgress = false;
        update();
        return true;
      } else {
        if (response.errorMessage.contains('credentials')) {
          await _googleSignIn
              .signOut(); // Clear session so user can select a new account
          _errorMessage = response.errorMessage;
          _inProgress = false;
          update();
          return false;
        }

        _errorMessage = response.errorMessage;
        _inProgress = false;
        update();
        return false;
      }
    } catch (e) {
      _errorMessage = e.toString();
      _inProgress = false;
      update();
      return false;
    }
  }
}
