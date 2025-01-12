import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:novel_app/app/modules/details/models/details_model.dart';
import 'package:novel_app/app/modules/library/controllers/library_controller.dart';
import 'package:novel_app/app/utils/api_endpoints.dart';

class DetailsController extends GetxController {
  var detailsModel = DetailsModel().obs;
  var isBookmark = false.obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  final LibraryController libraryController = Get.find<LibraryController>();

  @override
  void onInit() {
    super.onInit();
    final novelId = Get.arguments;
    novel(novelId);

    var findNovel = libraryController.libraryModel
        .firstWhereOrNull((novel) => novel.id == novelId);

    if (findNovel != null) {
      isBookmark.value = true;
    } else {
      isBookmark.value = false;
    }
  }

  Future<void> novel(novelId) async {
    try {
      isLoading(true);
      errorMessage('');

      var url =
          '${ApiEndpoints.baseUrl}${ApiEndpoints.novelEndPoints.novel}/$novelId?htmlToText=1';
      var headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': ApiEndpoints.token,
      };

      http.Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body)['data'];
        detailsModel.value = DetailsModel.fromJson(result);
      } else {
        errorMessage('Failed to fetching novels');
      }
    } catch (e) {
      errorMessage('Failed while getting novels is $e');
    } finally {
      isLoading(false);
    }
  }
}
