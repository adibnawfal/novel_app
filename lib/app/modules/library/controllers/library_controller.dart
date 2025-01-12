import 'package:get/get.dart';
import 'package:novel_app/app/modules/details/models/details_model.dart';
import 'package:novel_app/app/services/library_service.dart';

class LibraryController extends GetxController {
  final LibraryService libraryService = Get.find<LibraryService>();

  List<DetailsModel> get libraryModel => libraryService.libraryModel;

  void addToLibrary(DetailsModel novel) {
    libraryService.addToLibrary(novel);
  }

  void removeFromLibrary(novelId) {
    libraryService.removeFromLibrary(novelId);
    Get.back();
  }

  void clearLibrary() {
    libraryService.clearLibrary();
  }
}
