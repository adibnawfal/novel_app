import 'package:get/get.dart';
import 'package:novel_app/app/modules/auth/views/login_view.dart';
import 'package:novel_app/app/modules/auth/views/signup_view.dart';
import 'package:novel_app/app/modules/auth/views/validateotp_view.dart';
import 'package:novel_app/app/modules/navbar/views/navbar_view.dart';
import 'package:novel_app/app/modules/home/views/home_view.dart';
import 'package:novel_app/app/modules/details/views/details_view.dart';
import 'package:novel_app/app/modules/search/views/search_view.dart';
import 'package:novel_app/app/modules/library/views/library_view.dart';
import 'package:novel_app/app/modules/account/views/account_view.dart';
import 'package:novel_app/app/bindings/login_binding.dart';
import 'package:novel_app/app/bindings/signup_binding.dart';
import 'package:novel_app/app/bindings/validateotp_binding.dart';
import 'package:novel_app/app/bindings/navbar_binding.dart';
import 'package:novel_app/app/bindings/details_binding.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.signup,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: Routes.validateOtp,
      page: () => ValidateotpView(),
      binding: ValidateotpBinding(),
    ),
    GetPage(
      name: Routes.navbar,
      page: () => NavbarView(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomeView(),
    ),
    GetPage(
      name: Routes.details,
      page: () => DetailsView(),
      binding: DetailsBinding(),
    ),
    GetPage(
      name: Routes.search,
      page: () => SearchView(),
    ),
    GetPage(
      name: Routes.library,
      page: () => LibraryView(),
    ),
    GetPage(
      name: Routes.account,
      page: () => AccountView(),
    ),
  ];
}
