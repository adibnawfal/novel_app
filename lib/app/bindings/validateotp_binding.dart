import 'package:get/get.dart';
import 'package:novel_app/app/modules/auth/controllers/validateotp_controller.dart';

class ValidateotpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ValidateotpController>(() => ValidateotpController());
  }
}
