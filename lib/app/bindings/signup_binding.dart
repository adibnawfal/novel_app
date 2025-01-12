import 'package:get/get.dart';
import 'package:novel_app/app/modules/auth/controllers/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());
  }
}
