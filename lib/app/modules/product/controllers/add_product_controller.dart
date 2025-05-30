// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io'; 
import 'package:expriy_deals_vendors/get_storage.dart';
import 'package:expriy_deals_vendors/urls.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class AddProductController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> addProduct({
    required String name,
    required String details,
    required String category,
    required String price,
    required String quantity,
    required String expiryDate,
    required String days,
    required String discount,
    required List<File> images,
  }) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    try {
      var uri = Uri.parse(
          Urls.addProductUrl); // Replace with your actual API URL
      var request = http.MultipartRequest('POST', uri);

      // Set product data
      Map<String, dynamic> jsonFields = {
        "name": name,
        "details": details,
        "category": category,
        "days": days,
        "price": double.tryParse(price) ?? 0.0,
        "stock": int.tryParse(quantity) ?? 0,
        "expiredAt": expiryDate,
        "discount": double.tryParse(discount) ?? 0.0,
        "quantity" : int.tryParse(quantity) ?? 0,
      };

      request.fields['data'] = jsonEncode(jsonFields);
      request.headers['Authorization'] =
          'Bearer ${StorageUtil.getData(StorageUtil.userAccessToken)}'; // Assuming you have a StorageService to get the token

      // Add multiple images
      for (int i = 0; i < images.length; i++) {
        String imagePath = images[i].path;
        String? mimeType = lookupMimeType(imagePath) ?? 'image/jpeg';

        request.files.add(
          await http.MultipartFile.fromPath(
            'images', // Backend should expect array of images
            imagePath,
            contentType: MediaType.parse(mimeType),
          ),
        );
            }

      // Send request
      var streamedResponse = await request.send();
      var responseBody = await streamedResponse.stream.bytesToString();

      print('📥 Server Response:');
      print(responseBody);

      var decodedResponse = jsonDecode(responseBody) as Map<String, dynamic>;

      if (streamedResponse.statusCode == 200) {
        _errorMessage = null;
        isSuccess = true;
      } else {
        _errorMessage = decodedResponse['message'] ?? "Failed to add product";
      }
    } catch (e) {
      _errorMessage = "Error adding product: $e";
    } finally {
      _inProgress = false;
      update();
    }

    return isSuccess;
  }
}
