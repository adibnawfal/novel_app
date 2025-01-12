import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:novel_app/app/modules/details/models/details_model.dart';

class LibraryService extends GetxService {
  final storage = GetStorage();
  var libraryModel = <DetailsModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    List? storedLibrary = storage.read<List>('libraryModel');

    if (storedLibrary != null) {
      libraryModel.assignAll(
          storedLibrary.map((e) => DetailsModel.fromJson(e)).toList());
    }

    ever(libraryModel, (_) {
      storage.write(
        'libraryModel',
        libraryModel.map((e) => e.toJson()).toList(),
      );
    });
  }

  void addToLibrary(DetailsModel novel) {
    libraryModel.add(novel);
  }

  void removeFromLibrary(novelId) {
    // libraryModel.remove(novel);
    libraryModel.removeWhere((item) => item.id == novelId);
  }

  void clearLibrary() {
    libraryModel.clear();
  }
}
