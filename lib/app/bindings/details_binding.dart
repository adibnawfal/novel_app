import 'package:get/get.dart';
import 'package:novel_app/app/modules/details/controllers/details_controller.dart';
import 'package:novel_app/app/modules/library/controllers/library_controller.dart';

class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(() => DetailsController());
    Get.lazyPut<LibraryController>(() => LibraryController());
  }
}
