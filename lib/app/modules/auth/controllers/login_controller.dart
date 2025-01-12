import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:novel_app/app/routes/app_pages.dart';
import 'package:novel_app/app/utils/api_endpoints.dart';

class LoginController extends GetxController {
  final storage = GetStorage();
  TextEditingController emailController = TextEditingController();

  Future<void> login() async {
    try {
      var url = ApiEndpoints.baseUrl + ApiEndpoints.authEndPoints.login;
      var headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': ApiEndpoints.token,
      };
      Map body = {'identifier': emailController.text.trim()};

      http.Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        storage.write('loggedEmail', json['user']['email']);

        emailController.clear();
        Get.toNamed(
          Routes.validateOtp,
          arguments: {
            'email': json['user']['email'],
            'otp': json['otp'],
          },
        );
      } else {
        throw 'Failed to log in';
      }
    } catch (e) {
      Get.back();
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

  void navigateBasedOnLogin() {
    if (storage.read('loggedEmail') != null) {
      Get.offAllNamed(Routes.navbar);
    } else {
      Get.offAllNamed(Routes.login);
    }
  }
}
