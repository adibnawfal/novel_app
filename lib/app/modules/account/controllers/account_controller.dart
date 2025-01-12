import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AccountController extends GetxController {
  final storage = GetStorage();
  var loggedEmail = ''.obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    loggedEmail.value = storage.read('loggedEmail');
  }
}
