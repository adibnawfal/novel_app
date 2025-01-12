import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:novel_app/app/modules/auth/models/signup_model.dart';
import 'package:novel_app/app/routes/app_pages.dart';
import 'package:novel_app/app/utils/api_endpoints.dart';

class SignupController extends GetxController {
  final storage = GetStorage();
  var signupModel = <SignupModel>[].obs;
  var selectedGender = 'Male'.obs;
  var selectedCountryCode = 'MY'.obs;
  var selectedCountryDialCode = '+60'.obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    countryCode();
  }

  Future<void> countryCode() async {
    try {
      isLoading(true);
      errorMessage('');

      var url =
          ApiEndpoints.baseUrl + ApiEndpoints.generalEndPoints.countryCode;
      var headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': ApiEndpoints.token,
      };

      http.Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body)['data'];
        signupModel.value = result.map((e) => SignupModel.fromJson(e)).toList();
      } else {
        errorMessage('Failed to fetching country code');
      }
    } catch (e) {
      errorMessage('Failed while getting country code: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> signup() async {
    try {
      var url = ApiEndpoints.baseUrl + ApiEndpoints.authEndPoints.signup;
      var headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': ApiEndpoints.token,
      };
      Map body = {
        'email': emailController.text.trim(),
        'firstName': firstNameController.text,
        'lastName': lastNameController.text,
        'gender': selectedGender.value.toString(),
        'countryCode': selectedCountryCode.toString(),
        'phoneNumber':
            selectedCountryDialCode.value + phoneNumberController.text,
      };

      http.Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        storage.write('loggedEmail', json['user']['email']);

        emailController.clear();
        firstNameController.clear();
        lastNameController.clear();
        genderController.clear();
        countryCodeController.clear();
        phoneNumberController.clear();
        Get.toNamed(
          Routes.validateOtp,
          arguments: {
            'email': json['user']['email'],
            'otp': json['otp'],
          },
        );
      } else {
        throw 'Failed to sign up';
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

  void updateGender(String value) {
    selectedGender.value = value;
  }

  void updateCountryCode(String value) {
    selectedCountryCode.value = value;
  }
}
