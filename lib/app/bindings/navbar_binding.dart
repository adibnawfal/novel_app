import 'package:get/get.dart';
import 'package:novel_app/app/modules/navbar/controllers/navbar_controller.dart';
import 'package:novel_app/app/modules/home/controllers/home_controller.dart';
import 'package:novel_app/app/modules/search/controllers/search_novel_controller.dart';
import 'package:novel_app/app/modules/library/controllers/library_controller.dart';
import 'package:novel_app/app/services/library_service.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavbarController>(() => NavbarController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<SearchNovelController>(() => SearchNovelController());
    Get.lazyPut<LibraryController>(() => LibraryController());
    Get.lazyPut<LibraryService>(() => LibraryService());
  }
}
