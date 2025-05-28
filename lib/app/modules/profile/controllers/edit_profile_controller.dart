// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';
import 'package:expriy_deals_vendors/urls.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http; 
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class EditProfileController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String? _accessToken;
  String? get accessToken => _accessToken;

  /// 🔁 Update Profile Function
  Future<bool> updateProfile(File? image, String name, String email,
      String contact, String address, String city, String state,String zipcode, String country, String token) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    print('Controller e asche');
    try {
      var uri = Uri.parse(Urls.updateProfileUrl);
      var request = http.MultipartRequest('PATCH', uri);
      print('Update profile controller token : $token');
      request.headers['Authorization'] = 'Bearer $token';
      // ✅ Set 'data' field with JSON-encoded string
      Map<String, dynamic> jsonFields = {
        "name": name,
        "email": email,
        "phoneNumber": contact,
        "address": address,
        "city": city,
        "state": state,
        "zipCode": zipcode,
        "country": country,
      };

      request.fields['data'] = jsonEncode(jsonFields);

      // ✅ Add image if available
      if (image != null) {
        print('Image ache ekhane ................................');
        print(image);
        String imagePath = image.path;
        String? mimeType = lookupMimeType(imagePath) ?? 'image/jpeg';

        request.files.add(
          await http.MultipartFile.fromPath(
            'profile', // 🔑 Backend should expect this key
            imagePath,
            contentType: MediaType.parse(mimeType),
          ),
        );
      }

      // 📡 Send request
      var streamedResponse = await request.send();
      var responseBody = await streamedResponse.stream.bytesToString();

      print('📥 Server Response:');
      print(responseBody);

      var decodedResponse = jsonDecode(responseBody) as Map<String, dynamic>;
      // var decodedResponse = jsonDecode(responseBody);

      if (streamedResponse.statusCode == 200) {
        _errorMessage = null;
        isSuccess = true;
      } else {
        _errorMessage =
            decodedResponse['message'] ?? "Failed to update profile";
      }
    } catch (e) {
      _errorMessage = "Error updating profile: $e";
    } finally {
      _inProgress = false;
      update();
    }

    return isSuccess;
  }
}
