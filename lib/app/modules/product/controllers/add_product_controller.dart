// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
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
          'http://115.127.156.131:7000/api/v1/products'); // Replace with your actual API URL
      var request = http.MultipartRequest('POST', uri);

      // Set product data
      Map<String, dynamic> jsonFields = {
        "name": name,
        "details": details,
        "category": "683146eebb83252a71e24536",
        "price": 12.00,
        "stock": 3 ,
        "expiredAt": expiryDate,
        "discount": 10,
        "quantity" : 20
      };

      request.fields['data'] = jsonEncode(jsonFields);
      request.headers['Authorization'] =
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2ODE4ODczY2RlMzAwYzA5OTU3MzRmMzIiLCJyb2xlIjoidmVuZG9yIiwiaWF0IjoxNzQ3ODg0OTAyLCJleHAiOjE3NTA0NzY5MDJ9.lc988CLjYpvkz8aIceVF1kt3mrlAx_DxhihRsG76pMU';

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
