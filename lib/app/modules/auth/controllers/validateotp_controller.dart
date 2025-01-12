import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:novel_app/app/utils/api_endpoints.dart';
import 'package:novel_app/app/routes/app_pages.dart';

class ValidateotpController extends GetxController {
  final storage = GetStorage();

  Future<void> validateOtp(
    String emailAddress,
    String verificationCode,
  ) async {
    try {
      var url = ApiEndpoints.baseUrl + ApiEndpoints.authEndPoints.validateOtp;
      var headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': ApiEndpoints.token,
      };
      Map body = {
        'identifier': emailAddress,
        'code': verificationCode,
      };

      http.Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Get.offAllNamed(Routes.navbar);
      } else {
        throw 'Failed to log in';
      }
    } catch (e) {
      await storage.remove('loggedEmail');
      Get.offAllNamed(Routes.login);
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: Text('Error'),
            contentPadding: EdgeInsets.all(20),
            children: [Text(e.toString())],
          );
        },
      );
    }
  }
}
