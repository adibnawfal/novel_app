import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:novel_app/app/modules/search/models/search_model.dart';
import 'package:novel_app/app/utils/api_endpoints.dart';

class SearchNovelController extends GetxController {
  var searchModel = <SearchModel>[].obs;
  var filterData = <SearchModel>[].obs;
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
        searchModel.value = result.map((e) => SearchModel.fromJson(e)).toList();
        filterData.value = result.map((e) => SearchModel.fromJson(e)).toList();
      } else {
        errorMessage('Failed to fetching novels');
      }
    } catch (e) {
      errorMessage('Failed while getting novels: $e');
    } finally {
      isLoading(false);
    }
  }

  void filterNovel(String novelName) {
    if (novelName.isEmpty) {
      filterData.value = searchModel;
    } else {
      filterData.value = searchModel
          .where((element) => element.title!
              .toString()
              .toLowerCase()
              .contains(novelName.toLowerCase()))
          .toList();
    }
  }
}
