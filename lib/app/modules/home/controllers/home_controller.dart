import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:novel_app/app/modules/home/models/home_model.dart';
import 'package:novel_app/app/utils/api_endpoints.dart';

class HomeController extends GetxController {
  var homeModel = <HomeModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNovel();
  }

  Future<void> fetchNovel() async {
    try {
      isLoading(true);
      errorMessage('');

      var url = ApiEndpoints.baseUrl + ApiEndpoints.novelEndPoints.fetchNovel;
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
        homeModel.value = result.map((e) => HomeModel.fromJson(e)).toList();
      } else {
        errorMessage('Failed to fetching novels');
      }
    } catch (e) {
      errorMessage('Failed while getting novels: $e');
    } finally {
      isLoading(false);
    }
  }
}
